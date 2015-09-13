---
title: Using DD-WRT to Override DNS for Specific Hosts
author: Aaron
layout: post
permalink: /using-dd-wrt-to-override-dns/
dsq_thread_id:
  - 2294815088
categories:
  - Tech
tags:
  - dd-wrt
  - hulu
  - iptables
  - opendns
---
The other day, my wife and I were settling in to dig through our Hulu Plus queue. What started out as a grand TV binge-a-thon, however, quickly turned into frustration: each show would play for about 5 seconds, buffer anywhere from 20-30 seconds, then repeat.

I ran the usual gamut of test/support steps:

  1. Checked my internet speed via <a href="http://speedtest.net" target="_blank">speedtest.net</a> (using the same wired connection that my Samsung Smart TV uses). 56 Mbps down, 30 Mbps up, 16 ms ping. *Far* beyond what would be necessary for this type of venture.
  2. Called Hulu Support; received a healthy amount of, &#8220;Hmm, we&#8217;re not sure, but we&#8217;ll credit your account one month.&#8221; Nice, but not what I needed.
  3. Tested the cabling from the TV to the router (a Cisco E1000 v.1 running DD-WRT). Smooth and running fine.

Despite all of these (rather obvious) measures, more and more stuttering. Frustrating, frustrating, frustrating. I hunted around the internet, but couldn&#8217;t find anything having to do with solid, reliable stutter-removal advice for Hulu.<!--more-->

## TL;DR

Using DD-WRT, it is possible to re-reroute the DNS servers for specific hosts on a network.

## The Setup

So, given that Hulu wasn&#8217;t reliably the source of the problem, I turned to the idea that something in <a href="http://www.dd-wrt.com/site/index" target="_blank">DD-WRT</a> – our router&#8217;s killer alternate firmware – was involved (or that DD-WRT might contain something that would help).

Blessedly, I eventually landed on this page at the DD-WRT wiki: <a href="http://www.dd-wrt.com/phpBB2/viewtopic.php?p=530053" target="_blank">Netflix streaming, pausing every 30 seconds, wired</a>. Of particular note was the comment left by Luniz2k1, one of DD-WRT&#8217;s gurus:

> the use of OpenDNS instead of your local ISP&#8217;s DNS has a very big impact on web site performance. Major sites and media companies uses content delivery network. If you used openDNS to lookup sites like <a href="http://www.apple.com%2C/" target="_blank" rel="nofollow">www.apple.com,</a> you will get faraway IP addresses compared to using your ISP&#8217;s DNS. As a result, downloads and videos are slower.

Interesting. We do, indeed, use OpenDNS for content filtering (and do so in a rather hardcore fashion at the router level via DD-WRT, per <a href="http://www.dd-wrt.com/wiki/index.php/OpenDNS" target="_blank">this guide</a> – of particular note, we use DD-WRT to enforce OpenDNS&#8217;s servers for every client on our network).

Completely out of other options, I temporarily allowed our Samsung TV to point back to our ISP&#8217;s DNS servers&#8230;

&#8216;Lo and behold: no more stuttering. &#8220;Water in the desert&#8221; doesn&#8217;t even come close to describing my joy.

After a few moments, however, I crashed back to reality with a painful thought: I wanted to allow my Samsung TV to access our ISP&#8217;s DNS servers, but still force other clients – laptops, phones, etc. – to use OpenDNS. What&#8217;s worse, there didn&#8217;t appear to be any documentation out on the internet that described such a process.

After much toil (which I&#8217;ll leave out here), I landed on modifying my iptables (the firewall that DD-WRT uses) rules to allow for certain hosts to use certain DNS servers.

Here&#8217;s the full firewall configuration for this specific maneuver:

{% gist 0f7d8dca2b3b6f2174a8 %}

Allow me to describe in detail what&#8217;s occurring here:

  1. The first three blocks relate to the three devices that should bypass OpenDNS: our Samsung TV, a Media Center PC, and out PS3. Note that I&#8217;m referring to hostnames and not IP addresses; because many devices – like the PS3 and Samsung TV – don&#8217;t report a hostname, you can use <a href="http://www.dd-wrt.com/wiki/index.php/Static_DHCP" target="_blank">Static Leases</a> to enforcehostnames.
      * The work is done on the PREROUTING chain (before the request is fired off).
      * The redirection happens using both TCP and UDP.
      * \`nvram get wan\_get\_dns\` returns back a space-delimited string of our WAN&#8217;s DNS IPs. A subsequent call to \`awk\` splits out the first IP.
      * **ALL TOLD:** these rules force traffic from three specific hosts to use the first WAN DNS IP (as reported by DD-WRT).
  2. The last two rules follow a similar approach: they merely force all clients (really, all *other* clients – because iptables is a first-match-wins firewall, any non-TV/Media Center/PS3 will hit this rule) to use the router&#8217;s DNS IPs (which are set to OpenDNS).

Even though I had hoped for an easier, more supported method, I&#8217;m happy with this solution. DD-WRT Land appears &#8220;okay&#8221; with it, too: as of today, <a href="http://dd-wrt.com/phpBB2/viewtopic.php?t=256340" target="_blank">my forum post at the DD-WRT wiki has no responses</a>, despite over 200 views. If you can think of a better way, though, I&#8217;m all ears.
