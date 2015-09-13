---
title: Sync aText and TextExpander Touch with ExpandSync
author: Aaron
layout: post
permalink: /sync-atext-textexpander-touch-expandsync/
dsq_thread_id:
  - 2438145126
categories:
  - Tech
tags:
  - atext
  - cli
  - expandsync
  - ios
  - osx
  - textexpander-touch
---
I love <a title="How to Use Text Expansion to Save Yourself Hours of Typing Every Week" href="http://lifehacker.com/5611210/how-to-use-text-expansion-to-save-yourself-hours-of-typing-every-day" target="_blank">text expansion</a>. I was skeptical at first, but by employing it diligently, I&#8217;ve saved hours and hours of time.

On the Mac, my favorite is <a title="aText" href="http://www.trankynam.com/atext/" target="_blank">aText</a>. It&#8217;s sleek, affordable, and has a killer feature set. On iOS, there are limited options (primarily because of iOS&#8217; locked down architecture). To date, <a title="TextExpander Touch" href="https://smilesoftware.com/TextExpander/touch/index.html" target="_blank">TextExpander Touch</a> has been the only workable solution for me; thankfully, many other apps I use – such as <a title="Drafts" href="http://agiletortoise.com/drafts/" target="_blank">Drafts</a> and <a title="Fantastical" href="http://flexibits.com/fantastical-iphone" target="_blank">Fantastical</a> – can use snippets defined in TextExpander Touch.

Unfortunately, there&#8217;s a glaring problem: there&#8217;s no way to synchronize your snippets between the two. If you come up with a great snippet on the road, you have to remember to *manually* enter it once you get back to your Mac. It&#8217;s a disaster for any real productivity fiend.

So, like any enterprising developer, I took matters into my own hands. Today, it becomes possible to synchronize snippets between aText and TextExpander Touch thanks to <a title="ExpandSync" href="https://github.com/bachya/ExpandSync" target="_blank">ExpandSync</a>.<!--more-->

## TL;DR

ExpandSync is an app of mine that synchronizes aText snippets with TextExpander Touch.

## Explanation

ExpandSync is a command-line tool that offers semi-automated synchronization between aText and TextExpander Touch. The process it follows is fairly simple: upon running, it will figure out which snippets each program has (but the other doesn&#8217;t) and &#8220;give&#8221; them to each other (TextExpander, via Dropbox, and aText, via an importable CSV file).

Simple, clean, and it gets the job done.

## Installation and Configuration

Full configuration instructions are on [the project&#8217;s GitHub page](http://github.com/bachya/ExpandSync).

## Other Thoughts

I&#8217;ve got a full slate of features that I want to add to ExpandSync , but as with all my projects on Github, I urge feedback. Feel free to leave bug reports and enhancement requests on the project&#8217;s <a title="ExpandSync Issues" href="https://github.com/bachya/ExpandSync/issues" target="_blank">Issues Page</a>. Feel free to leave feedback here, as well!
