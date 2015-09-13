---
title: PinPress Updates with URL Linking
author: Aaron
layout: post
permalink: /pinpress-updates-url-linking/
dsq_thread_id:
  - 3047445448
categories:
  - Tech
tags:
  - app
  - cli
  - github
  - pinpress
  - ruby
---
Last weekend, I updated <a title="PinPress" href="https://github.com/bachya/pinpress" target="_blank">PinPress</a> – my command-line-based utility to create text templates of <a title="Pinboard" href="https://pinboard.in" target="_blank">Pinboard</a> data – with a (I think) much-needed feature: URL linking.

Here&#8217;s the use case: you&#8217;re humming along, saving interesting links to your Pinboard, and you want to store linkable URLs in the description of a pin<sup id="fnref-2098-1"><a href="#fn-2098-1" rel="footnote">1</a></sup>.  Moreover, you want to be able to use those links in your PinPress output: if a description includes a URL, it out to come out of a PinPress as a hyperlink.<!--more-->

## TL;DR

PinPress now includes the ability to create hyperlinks around URLs in Pinboard data.

## The Background

It seems simple enough, especially given <a title="Pinboard: Frequently Asked Questions" href="https://pinboard.in/faq/#html_in_descriptions" target="_blank">Pinboard&#8217;s FAQ on the matter</a>:

> The only HTML element allowed in descriptions is <blockquote>, useful for displaying cited text. **Any URLs in description text will be auto-hyperlinked.**

Here&#8217;s the problem: although the auto-hyperlinking happens on the Pinboard website:

[<img class="alignnone size-full wp-image-2104" src="{{ site.baseurl }}/assets/2014/09/Screen-Shot-2014-09-23-at-3.17.25-PM.png" alt="URL in Pinboard Description" width="583" height="106" />][1]

&#8230;nothing comparable happens to the data when returned from PinPress:

[<img class="alignnone size-full wp-image-2105" src="{{ site.baseurl }}/assets/2014/09/Screen_Shot_2014-09-23_at_3_17_37_PM.png" alt="Pinboard URL in PinPress Output" width="647" height="393" />][2]

Bummer.<sup id="fnref-2098-2"><a href="#fn-2098-2" rel="footnote">2</a></sup> It got me thinking: is there a nice way to automate the creation of hyperlinks around URLs when PinPress exports its data?

## The New Stuff

<a target="_blank" href="https://github.com/bachya/PinPress">Open on Github</a>

With version 1.6.1, PinPress now has the ability to do just that. Best of all, it can accommodate two different scenarios:

  1. Auto Linking (wherein the URL gets wrapped in a hyperlink that uses the URL itself as the text)
  2. Manual Linking (wherein the URL gets wrapped in a hyperlink that uses user-defined text)

More is explained below, but make sure to check out the GitHub repository for more in-depth documentation.

## Auto Linking

Auto Linking gets activated in one of two ways: either you specify the `-a` switch when running `pinpress pins` or you include `auto_link: true` in the `pinpress` section of the configuration file (located at `~/.pinpress`).

Let&#8217;s try the &#8220;switch route&#8221; and run:

{% highlight Bash %}
$ pinpress pins -n 1 -a
{% endhighlight %}

This produces output wherein every URL found is automatically wrapped in a hyperlink. So, for example, if PinPress finds this URL in a pin description:

{% highlight HTML %}
http://www.google.com
{% endhighlight %}

&#8230;it gets turned into this:

{% highlight HTML %}
<a href="http://www.google.com" target="_blank">http://www.google.com</a>
{% endhighlight %}

Neat!

## Manual Linking

But what if you want to customize the text of the hyperlink? That&#8217;s where Manual Linking comes into play. Like Auto Linking, it can be activated via a switch or a configuration key/value (`-l` and `manual_link: true`, respectively).

Again, an example:

{% highlight Bash %}
$ pinpress pins -n 1 -m
{% endhighlight %}

This produces a prompt for every URL, giving the user a chance to specify what the link text should be:

{% highlight Bash %}
—> URL FOUND!
URL: http://www.google.com
TITLE: I Want to Pin Google on Pinboard
POSITION: …http://www.google.com…
What do you want the link text to say?:
{% endhighlight %}

Note that in addition to the URL, the user is given the title of the pin in which the URL was found and its rough &#8220;position&#8221; (i.e., where it occurs in the description compared to surrounding text).

If I type in &#8220;Le Googlez&#8221; and hit return, the URL gets output like this:

{% highlight HTML %}
<a href="http://www.google.com" target="_blank">Le Googlez</a>
{% endhighlight %}

Neat again!

## Saved Configurations

With both Auto and Manual Linking, PinPress saves the link information into the configuration file; under the `links` heading, you&#8217;ll see entries that look like this:

{% highlight YAML %}
4a0f001e05877a9473b7dd8d3b2c70cf:
  title: I Want to Pin Google on Pinboard
  url: http://www.google.com
  link_text: Le Googlez
{% endhighlight %}

This happens for two reasons:

  1. By saving this configuration info, PinPress ensures that it doesn&#8217;t (a) have to recalculate hyperlinks (in the case of Auto Linking) and (b) re-prompt the user (in the case of Manual Linking) when it finds URLs in pins that it&#8217;s already run across.
  2. Going forward, if the user wants to change the URL text, they can do it easily.

## Onward

PinPress is one of my favorite projects; it serves a niche need, but is super fun to play with. If there are any features you&#8217;d like to request, please do so on the <a title="PinPress: Issues" href="https://github.com/bachya/pinpress/issues" target="_blank">GitHub Issues Page</a>!

----

<ol>
<li id="fn-2098-1">
  I often like to include &#8220;via references&#8221; in a pin description: &#8220;Blah blah blah. (via http://www.whatever.com)&#8221;&#160;<a href="#fnref-2098-1" rev="footnote">&#8617;</a>
</li>
<li id="fn-2098-2">
And yet, it makes sense: Pinboard is rendering hyperlinks in its GUI, rather than modifying user data. I&#8217;d be much more bummed if it was the other way around. :)&#160;<a href="#fnref-2098-2" rev="footnote">&#8617;</a></li>
</ol>

[1]: {{ site.baseurl }}/assets/2014/09/Screen-Shot-2014-09-23-at-3.17.25-PM.png
[2]: {{ site.baseurl }}/assets/2014/09/Screen_Shot_2014-09-23_at_3_17_37_PM.png
