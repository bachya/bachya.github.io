---
title: Markdown Links from Firefox Tabs
author: Aaron
layout: post
permalink: /markdown-links-firefox-tabs/
dsq_thread_id:
  - 2996705295
categories:
  - Tech
tags:
  - alfred
  - applescript
  - atext
  - firefox
  - textexpander
---
I just updated <a title="Text Expansion: My Up-to-Date Guide" href="http://www.bachyaproductions.com/text-expansion-date-guide/" target="_blank">my up-to-date text expansion guide</a> with some new goodies. Of particular note are two new snippets related to grabbing the current tab in Firefox and making a Markdown link out of it.

This turned out to be harder than I anticipated: although Chrome and Safari have AppleScript support for grabbing the document title and URL of their current tabs, Firefox can only grab the title.<sup id="fnref-2015-1"><a href="#fn-2015-1" rel="footnote">1</a></sup><!--more-->

## TL;DR

Create an AppleScript that fully automates the retrieval of the current Firefox window/tab&#8217;s title and URL, then creates a Markdown link from it.

## The Process

I hunted around a bit and ran across <a title="[How To] Get frontmost tab’s url and title of various browsers" href="http://www.alfredforum.com/topic/2013-how-to-get-frontmost-tab%E2%80%99s-url-and-title-of-various-browsers/" target="_blank">a method in the Alfred forums</a> that grabs the URL in a rather hacky way: use AppleScript to switch to Firefox and simulate the `Command + L/Command + C` key sequence (which, as you might surmise, moves the focus to the Omnibar and copies its contents).

Although the Alfred forum members were not overly satisfied with this solution<sup id="fnref-2015-2"><a href="#fn-2015-2" rel="footnote">2</a></sup>, it had enough promise for my particular uses. The only thing missing was the automatic return to the &#8220;caller&#8221; application (that is, the application into which the TextExpander/aText snippet was entered). Fortunately, this wasn&#8217;t hard to add:

{% gist 59fbf1a6170cf4bde4e1 %}

Hopefully, the Mozilla folks will someday add proper support for this transaction. Until then, enjoy!

----

<ol>
<li id="fn-2015-1">
  Unfortunately, given the staleness of the <a title="Add Applescript Support to Firefox " href="https://bugzilla.mozilla.org/show_bug.cgi?id=608049" target="_blank"><span id="summary_alias_container"> <span id="short_desc_nonedit_display">&#8220;Add Applescript Support to Firefox&#8221; ticket</span></span></a><span id="summary_alias_container"> </span> on Bugzilla (the last update was in February of 2013), I&#8217;m not overly hopeful that this will get addressed anytime soon.&#160;<a href="#fnref-2015-1" rev="footnote">&#8617;</a>
</li>
<li id="fn-2015-2">
Let&#8217;s be fair: I&#8217;m not, either. However, at the end of the day, when you need something to work, you&#8217;re willing to put aside notions of &#8220;hacky-ness&#8221; and move forward.&#160;<a href="#fnref-2015-2" rev="footnote">&#8617;</a></li>
</ol>
