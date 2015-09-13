---
title: 'PinPress: Joining Pinboard and WordPress'
author: Aaron
layout: post
permalink: /pinpress-joining-pinboard-wordpress/
dsq_thread_id:
  - 2620618821
categories:
  - Tech
tags:
  - cli
  - osx
  - pinboard
  - pinpress
  - ruby
  - wordpres
---
This blog regularly features a <a title="Link Mash" href="/tag/link-mash/" target="_blank">Link Mash</a> (a curated selection of links that I want to share with my readers). To date, the creation of the Link Mash has been painful: I store interesting URLs in an Evernote note and, when the time comes, manually create blog posts with that info.

No good, dear reader. Too slow, too manual, and not at all respectful of my wish to be productive. So, as usual, I set out to create a tool that could smooth this process a bit.

Having long been a fan of <a title="brettterpstra.com" href="http://brettterpstra.com" target="_blank">Brett Terpstra</a>, I recently noticed that his Link Mash variant (called &#8220;Web Excursions&#8221;) mentioned that his links were stored on <a title="Pinboard" href="http://pinboard.in" target="_blank">Pinboard</a>&nbsp;(think Pinterest for techie-types). I liked the idea of storing interesting links in Pinboard; furthermore, after scoping out their excellent API, it became clear that a Pinboard-style integration was possible.

After much toil, I am proud to present <a title="PinPress" href="https://github.com/bachya/PinPress" target="_blank">PinPress</a>.<!--more-->

## TL;DR

Pinpress is a tool I made to solve a simple problem: output Pinboard tags according to a template.

## The Project

<a target="_blank" href="https://github.com/bachya/PinPress">Open on Github</a>

On the simplest level, PinPress allows me to easily grab pins (and their tags) and add them to a Link Mash post. More generally, however, PinPress gives users the ability to grab sets of pins and tags and output them into user-defined templates (HTML, Markdown, etc.).

For example, if I wanted to get all the pins I&#8217;ve pinned in the last two days:

{% highlight Bash %}
$ pinpress pins -s "2 days ago"
{% endhighlight %}

&#8230;which produces:

{% highlight html %}
<ul>
  <li>Using Drafts for Remote CLI.</li>
  <!-- other pins (formatted according to my template) -->
</ul>
{% endhighlight %}

Best of all, you get the ability to define&nbsp;any output template you like! Ultimately, PinPress is capable of a ton of interesting output. If you&#8217;re interested, check out its <a title="PinPress" href="https://github.com/bachya/PinPress" target="_blank">Github page</a>!
