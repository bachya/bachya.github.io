---
title: 'Hazel: A Productivity Nerd&#8217;s Best Friend on OS X'
author: Aaron
layout: post
permalink: /hazel-productivity-nerds-best-friend/
dsq_thread_id:
  - 2606926420
ptadn_textarea:
  - 'New Blog Post: {title} {link}'
ptadn_disable_post:
  - 0
categories:
  - Productivity
  - Tech
tags:
  - evernote
  - hazel
  - osx
  - windows
---
Automation is the name of the game when it comes to productivity. If you find yourself performing the same task over and over, finding an automated solution might be in your best interest.

One area ripe for support from automation is computer file management. Almost no one does it well; I sure don&#8217;t. Too often, desktops become overrun with files, folders overflow, and a general sense of, &#8220;Ah, screw it&#8221; sets in. That, dear reader, is not a place we want to be.

Allow me to share with you how I use <a title="Noodelsoft Hazel" href="http://www.noodlesoft.com/hazel.php" target="_blank">Hazel</a> – a wonderful automation app for OS X – to address some of these problems.<!--more-->

## TL;DR

Hazel is a wonderful app that manages files in some really neat ways.

## The App

<a title="Hazel" href="http://www.noodlesoft.com/hazel.php" target="_blank">Hazel</a>&#8216;s premise is simple:

> Hazel is a System Preference pane that works silently in the background, automatically filing, organizing and cleaning.

I&#8217;ve had Hazel on my Mac for some time, but for a long time, I remained ignorant to its true power. That changed rather suddenly through some random reading and experimentation; today, Hazel performs some of the most powerful automation tasks in my day-to-day-life.

## The Ground Rules

Before we jump in, allow me to explain some basic precepts of my Hazel setup (and its associated topics).

### The Basics

In the spirit of diving right into the good stuff, I&#8217;m not going to cover the basics of Hazel&#8217;s operation. Check out the Hazel <a title="Hazel FAQ" href="http://www.noodlesoft.com/faq.php" target="_blank">FAQ</a> and <a title="Hazel Form" href="http://www.noodlesoft.com/forums/" target="_blank">Forum</a> for more basic info.

### A Clean Desktop

Let&#8217;s prove this up front: no one has a good reason for storing files and folders on the desktop. Zero. Nada. So, our first rule: *nothing gets stored on the desktop*. Promise me, okay? You don&#8217;t want to go down this road.<sup id="fnref-689-1"><a href="#fn-689-1" rel="footnote">1</a></sup>

### The Downloads Folder

I use my Downloads folder as my general dumping ground. Every file I&#8217;m working on gets stored here. Sounds crazy, I know, but in general, I don&#8217;t archive files on a local filesystem (<a title="Productivity, Part 3: Material Archiving" href="http://www.bachyaproductions.com/productivity-part-3-material-archiving/" target="_blank">you remember, right?</a>). The Downloads folder is where everything gets &#8220;swept&#8221; into for my attention.

### Windows Users

For my brethren on the Microsoft side of the equation, <a title="Belvedere" href="https://github.com/mshorts/belvedere" target="_blank">Belvedere</a> (created by former Lifehacker Editor-in-Chief <a title="Adam Pash" href="http://adampash.com/" target="_blank">Adam Pash</a>) can do many of the same things as Hazel. It&#8217;s not as powerful, but it does the trick.

## The Rules

I apply Hazel rules to three folders: **Desktop**, **Downloads**, and a special folder called **Save to Evernote**. Let&#8217;s take a look at each of them in turn.

### Desktop

<a target="_blank" href="https://github.com/bachya/Code/blob/master/hazel/Desktop.hazelrules">Open on Github</a>

**Rule #1: Move Desktop Files to Downloads**

<img class="alignnone size-full wp-image-701" src="{{ site.baseurl }}/assets/2014/04/Screen-Shot-2014-04-12-at-1.19.58-PM.png" alt="Hazel Rule: Move Desktop Files to Downloads" width="667" height="320" />]

One rule. That&#8217;s all I have for the Desktop folder. It&#8217;s incredibly aggressive: it moves all files (*except* Disk Images, Aliases, and Folders) into my Downloads folder. That&#8217;s it.

I don&#8217;t tend to manually save files on the Desktop (if I did, this rule would catch them); rather, this rule&#8217;s usefulness appears when I take screenshots: since OS X saves those to the Desktop<sup id="fnref-689-2"><a href="#fn-689-2" rel="footnote">2</a></sup>, they get moved into my Downloads folder.

### Downloads

<a target="_blank" href="https://github.com/bachya/Code/blob/master/hazel/Downloads.hazelrules">Open on Github</a>

**Rule #1: Delete 1-Week-Old Files**

<img class="alignnone size-full wp-image-704" src="{{ site.baseurl }}/assets/2014/04/Screen-Shot-2014-04-12-at-1.21.58-PM.png" alt="Hazel Rule: Delete 1-Week-Old Files" width="668" height="320" />

Using my Downloads folder as a dumping ground for all my files means it gets cluttered. I don&#8217;t want that pile to grow infinitely big<sup id="fnref-689-3"><a href="#fn-689-3" rel="footnote">3</a></sup>, so this rule moves any files older than a week to the Trash. Added bonus: it forces me to proactively &#8220;do stuff&#8221; with the files in Downloads; if they linger too long, they get trashed.

**Rule #2: Archive Statements<sup id="fnref-689-4"><a href="#fn-689-4" rel="footnote">4</a></sup>**

<img class="alignnone size-full wp-image-706" title="Hazel Rule: Archive Statements" src="{{ site.baseurl }}/assets/2014/04/Screen-Shot-2014-04-12-at-1.24.13-PM.png" alt="Hazel Rule: Archive Statements" width="668" height="346" />

<a title="Productivity, Part 3: Material Archiving" href="http://www.bachyaproductions.com/productivity-part-3-material-archiving/" target="_blank">As we&#8217;ve established</a>, I like to archive my files in Evernote. This rule allows me to quickly archive my statements from Comcast; I merely save the PDF into my Downloads folder to kick it off. Once there, Hazel renames the file to a format that includes the current date and runs this AppleScript to put the PDF in Evernote:

{% gist 3071a1d87ebb31473167 %}

Finally, the rule deletes the PDF from my Downloads folder. Beautiful! Even better, it&#8217;s relatively easy to download statements from Xcel Energy, Verizon, my apartment organization, and many others using the same rule structure.

### Save to Evernote

<a target="_blank" href="https://github.com/bachya/Code/blob/master/hazel/Save%20To%20Evernote.hazelrules">Open on Github</a>

**Rule #1: Save New Files to Evernote**

<img class="alignnone size-full wp-image-711" src="{{ site.baseurl }}/assets/2014/04/Screen-Shot-2014-04-12-at-1.36.50-PM.png" alt="Hazel Rule: Save New Files to Evernote" width="668" height="319" />

This one rule accomplishes a much-needed automation: any file placed into it gets renamed and placed into Evernote via this AppleScript:

{% gist 4f861098e52f95cbee22 %}

I can save files off the web, download email attachments, and move existing files all into Evernote <span style="text-decoration: underline;">much</span> more easily.<span style="text-decoration: underline;"><br /> </span>

## What&#8217;s Next?

Naturally, I&#8217;ve merely scratched the surface of Hazel&#8217;s capabilities. A quick Google search shows that others have come up with a plethora of ideas:

  * <a title="9 Hazel Rules to Increase Your Productivity" href="http://computers.tutsplus.com/tutorials/9-hazel-rules-to-increase-your-productivity--mac-47144" target="_blank">9 Hazel Rules to Increase Your Productivity</a>
  * <a title="Do you use Hazel? What are some of your coolest rules? (Reddit)" href="http://www.reddit.com/r/apple/comments/1wlxtr/do_you_use_hazel_what_are_some_of_your_coolest" target="_blank">Do you use Hazel? What are some of your coolest rules? (Reddit)</a>
  * <a title="7 Awesome Hazel Rules You Can't Live Without" href="http://www.maclife.com/article/features/7_awesome_hazel_rules_you_cant_live_without" target="_blank">7 Awesome Hazel Rules You Can&#8217;t Live Without</a>

Naturally, it&#8217;s up to you to decide how complex or simple you want; Hazel can accommodate you either way.

Happy automation!

**UPDATE (8/5/2014):** *Many of these workflows have been updated in <a title="Better Evernote Filing" href="http://www.bachyaproductions.com/better-evernote-filing/" target="_blank">my post on smarter filing in Evernote</a>. You should still read this for background!*

----

<ol>
<li id="fn-689-1">
  Interestingly enough, Lifehacker recently talked about this same thing: <a title="The Downsides of Storing Files on Your Desktop" href="http://lifehacker.com/the-downsides-of-storing-files-on-your-desktop-1562235146" target="_blank">http://lifehacker.com/the-downsides-of-storing-files-on-your-desktop-1562235146</a>&#160;<a href="#fnref-689-1" rev="footnote">&#8617;</a>
</li>
<li id="fn-689-2">
   <a title="OS X Mountain Lion: Shortcuts for taking pictures of the screen" href="http://support.apple.com/kb/ph11229" target="_blank">http://support.apple.com/kb/ph11229</a>&#160;<a href="#fnref-689-2" rev="footnote">&#8617;</a>
</li>
<li id="fn-689-3">
   I jest. Although, if they ever make an infinitely big hard drive, that would be cool on numerous levels.&#160;<a href="#fnref-689-3" rev="footnote">&#8617;</a>
</li>
<li id="fn-689-4">
I have to give credit where credit&#8217;s due: <a title="How I went paperless with Hazel and Evernote" href="http://www.macworld.com/article/2029451/how-i-went-paperless-with-hazel-and-evernote.html" target="_blank">http://www.macworld.com/article/2029451/how-i-went-paperless-with-hazel-and-evernote.html</a>&#160;<a href="#fnref-689-4" rev="footnote">&#8617;</a>
</ol>
