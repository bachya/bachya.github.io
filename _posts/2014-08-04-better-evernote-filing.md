---
title: Better Evernote Filing
author: Aaron
layout: post
permalink: /better-evernote-filing/
dsq_thread_id:
  - 2899941648
categories:
  - Tech
tags:
  - applescript
  - evernote
  - hazel
  - mutt
  - omnifocus
  - postfix
---
You know how it goes: when you discover a cool &#8220;something&#8221; somewhere, you immediately begin to try to apply it to everything else.

<a title="Better OmniFocus Task Entry" href="http://www.bachyaproductions.com/better-omnifocus-task-entry/" target="_blank">My post on smarter task entry with OmniFocus</a> got me thinking: where else might this logic – wherein I use an application&#8217;s localized AppleScript methods if it&#8217;s already open, but if not, use another mechanism (like email) – work?

Out of the blue, it hit me: Evernote. <a title="Hazel: A Productivity Nerd’s Best Friend on OS X" href="http://www.bachyaproductions.com/hazel-productivity-nerds-best-friend/" target="_blank">I already use Hazel to automatically file documents into Evernote</a>, and although it works, the same problem applies: the methods require the Evernote already be running. Like OmniFocus, I don&#8217;t always have it running&#8230;and that presents a problem: Evernote is a beast of an application. It isn&#8217;t uncommon for it to take anywhere from 15-30 seconds to launch and become usable. Combined with the fact that it likes to become the dominant application when launched, Evernote chokes what should be a fairly painless and automated workflow.

So, I began to form a plan: rework all of my Hazel-based Evernote workflows to use the same logic that I&#8217;d come up with for OmniFocus.

Time to get to work. <img src="http://www.bachyaproductions.com/wp-includes/images/smilies/simple-smile.png" alt=":)" class="wp-smiley" style="height: 1em; max-height: 1em;" /><!--more-->

## TL;DR

Use a smart Applescript to send files to Evernote, regardless of whether or not it&#8217;s open.

## A New Element: Mutt

One fundamental difference exists between <a title="Better OmniFocus Task Entry" href="http://www.bachyaproductions.com/better-omnifocus-task-entry/" target="_blank">my OmniFocus workflow</a> and this new Evernote workflow: the type of content. The OmniFocus workflow uses text and it&#8217;s not hard to use `mail` to send text. The Evernote workflow, however, deals in rich media types: images, videos, PDFs, etc.

For many reasons, using `mail` to send attachments isn&#8217;t easy (especially on OS X). Therefore, I&#8217;m bringing something else into the picture: <a title="The Mutt E-Mail Client" href="http://www.mutt.org/" target="_blank">Mutt</a>. Mutt is a terminal-based email client that, among other things, allows for easy background sending of email; most important of all, its `-a` flag allows for painless sending of attachments.

The easiest way to install Mutt on OS X is via <a title="Homebrew" href="http://brew.sh/" target="_blank">Homebrew</a>; simply run:

{% highlight Bash %}
$ brew install mutt
{% endhighlight %}

Alternatively, you can build mutt yourself from the <a title="Downloading Mutt" href="http://www.mutt.org/download.html" target="_blank">releases page</a>.

## Mavericks Tags

Hazel has one glaringly missing feature (to me): there&#8217;s no officially supported way to send dynamic values from Hazel to AppleScript. In practice, this has meant dozens of slightly-different-but-mostly-the-same rules.

OS X 10.9 created a roundabout fix to this when it introduced <a title="OS X: Tags help you organize your files" href="http://support.apple.com/kb/HT5839" target="_blank">the long-anticipated concept of tags</a>:

> OS X Mavericks includes Tags – a powerful new way to organize your files. Whether your files are on your Mac or in iCloud, you can find them with just one click

Tags aren&#8217;t a perfect way for Hazel to pass variable information into an AppleScript, but for our purposes here, they&#8217;ll do the trick.

Where does that leave pre-10.9 users? Without tags, you&#8217;ll be forced to make several AppleScripts, instead of just using the same one. It&#8217;s not the end of the world, but it&#8217;s worth knowing.

## The Base AppleScript

Each Hazel workflow makes use of the same base AppleScript<sup id="fnref-1712-1"><a href="#fn-1712-1" rel="footnote">1</a></sup>:

{% gist 166dd967f4ca33e9f946 %}

There&#8217;s a lot going on here, but it follows a simple breakdown:

  * If Evernote is running, use its AppleScript methods to create notes; otherwise, use Mutt to send an email to an Evernote email address to create the note.
  * In either case, use any tags that exist on the file as tags on the Evernote note.

## Some Examples

Let&#8217;s take a look at some of my earlier Hazel rules and how they change in this new setup.

### Save To Evernote

This action – which monitors a single directory and places any file found in it into Evernote – doesn&#8217;t change much, but it does make use of the new base AppleScript.

**Old:**

[<img class="alignnone size-full wp-image-1452" src="{{ site.baseurl }}/assets/2014/06/Screen-Shot-2014-06-18-at-8.57.42-PM.png" alt="&quot;Save To Evernote&quot; Hazel Workflow" width="681" height="527" />][1]

**New:**

[<img class="alignnone size-full wp-image-1727" src="{{ site.baseurl }}/assets/2014/08/Screen-Shot-2014-08-03-at-5.48.55-PM.png" alt="New Save to Evernote - Hazel" width="681" height="527" />][2]

The primary changes here are twofold:

  1. I got rid of the action that renamed the file (because, frankly, I didn&#8217;t see the point in renaming generic files).
  2. I use my base `Save File to Evernote.scpt` in place of the embedded script used before.

### Comcast Statement

The changes to this action – which monitors my `~/Downloads` folder and archives any Comcast statements in Evernote – showcase the first example of 10.9 tags coming into play

**Old:**

[<img class="alignnone size-full wp-image-706" src="{{ site.baseurl }}/assets/2014/04/Screen-Shot-2014-04-12-at-1.24.13-PM-e1398190262482.png" alt="Hazel Rule: Archive Comcast Statements" width="668" height="346" />][3]

**New:**

[<img class="alignnone size-full wp-image-1732" src="{{ site.baseurl }}/assets/2014/08/Screen-Shot-2014-08-03-at-5.53.30-PM.png" alt="New Rule: Archive Comcast Statements - Hazel" width="681" height="527" />][4]

Here, too, are two changes:

  1. After the file is renamed, I add two tags to it.
  2. Then, I use my generic AppleScript.

In either case – whether using Evernote&#8217;s AppleScript methods or my Evernote email address – the tags are added to the newly created note.

----

<ol>
<li id="fn-1712-1">
Special thanks to Justin Lancy of <a title="Veritrope" href="http://veritrope.com/" target="_blank">Veritrope</a> for helping me figure out <a title="Get a List of 10.9 “Mavericks” Tags" href="http://veritrope.com/code/get-a-list-of-10-9-mavericks-tags/" target="_blank">how to use 10.9 tags in AppleScript</a>.&#160;<a href="#fnref-1712-1" rev="footnote">&#8617;</a></li>
</ol>

[1]: {{ site.baseurl }}/assets/2014/06/Screen-Shot-2014-06-18-at-8.57.42-PM.png
[2]: {{ site.baseurl }}/assets/2014/08/Screen-Shot-2014-08-03-at-5.48.55-PM.png
[3]: {{ site.baseurl }}/assets/2014/04/Screen-Shot-2014-04-12-at-1.24.13-PM-e1398190262482.png
[4]: {{ site.baseurl }}/assets/2014/08/Screen-Shot-2014-08-03-at-5.53.30-PM.png
