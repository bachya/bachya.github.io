---
title: Toodledo Tasks via Evernote Checkboxes (v.1)
author: Aaron
layout: post
permalink: /toodledo-tasks-via-evernote-checkboxes/
dsq_thread_id:
  - 2294656573
categories:
  - Tech
tags:
  - apple mail
  - applescript
  - evernote
  - osx
  - toodledo
---
<a href="http://www.evernote.com" target="_blank">Evernote</a> is my archive of choice. Lately, I&#8217;ve started using checkboxes more frequently; while taking notes, if I need to remember a todo, I use a checkbox.

There&#8217;s one problem, however: I don&#8217;t use Evernote as a task management system (although, if <a href="http://blog.sfgate.com/techchron/2013/09/25/evernote-ceo-more-ios7-updates-fitness-features-recurring-reminders-on-the-way/" target="_blank">Phil Libin&#8217;s comments about recurring reminders</a> come to fruition, I may change my mind). For that particular task, I use <a href="http://www.toodledo.com" target="_blank">Toodledo</a>.

The other day, a light bulb went off: could I find a way to combine the lightning-fast &#8220;remind-me-to-do-this&#8221; process of Evernote checkboxes with the fact that I manage my todos via Toodledo?

Answer: yes I can. I&#8217;d like to share it with you here.<!--more-->

## TL;DR

Automatically create Toodledo tasks from Evernote checkboxes.

## The Setup

This method follows a simple process:

  1. I tag any notes whose unchecked checkboxes I would like to send to Toodledo.
  2. I run a service (created using Automator).
  3. Those checkboxes are sent to Toodledo and the note is assigned a new, &#8220;complete&#8221; tag.

Let&#8217;s walk through how to set this up.

## Step #1: Retrieve you personal Toodledo email address.

This address can be found in Toodledo&#8217;s Settings screen: <a href="https://www.toodledo.com/tools/connect_email.php" target="_blank">https://www.toodledo.com/tools/connect_email.php</a>

<a style="line-height: 1.5em;" href="{{ site.baseurl }}/assets/2014/01/Toodledo___Email_Access.jpg"><img class="alignnone size-full wp-image-61" src="{{ site.baseurl }}/assets/2014/01/Toodledo___Email_Access.jpg" alt="Toodledo Email Address Screen" width="510" height="360" /></a>

## Step #2: Create two tags in Evernote related to this automation.

In my case, I chose these tags – feel free to use whatever you prefer:

  * **toodledo:** this is tag to apply to notes that should be scanned for unchecked checkboxes.
  * **toodledo-complete:** this is the tag applied to notes that have been scanned by the service.

## Step #3: Download the workflow and install it via Automator.

<a target="_blank" href="{{ site.baseurl }}/assets/2014/01/Checkboxes-to-Toodledo.workflow.zip" class="aio-red" title="Download Automator Workflow">Download Automator Workflow</a>

For reference, here&#8217;s the Applescript of the workflow – **note that when you import it into Automator, you&#8217;ll need to change the first three variables:**

  * **td_email:** your Toodledo email address
  * **tag_toSend: **your first tag (for scanning)
  * **tag_complete:** your second tag (for indicating completion)

{% gist b650215137dfa23a6db5 %}

## Step #4 (optional): Attach the newly installed service to a hotkey.

Because I am a hotkey aficionado, I wanted to attach this service to a hotkey. This is done by going into System Preferences >> Keyboard (I&#8217;m using Mavericks; YMMV on earlier versions of OS X) and clicking the &#8220;Shortcuts&#8221; tab.

[<img class="alignnone size-full wp-image-72" src="{{ site.baseurl }}/assets/2014/01/Keyboard.jpg" alt="Keyboard Settings in System Preferences" width="609" height="355" />][1]

Once there, it is simply a matter of finding your service and adding the hotkey combination that you would like.

[<img class="alignnone size-full wp-image-73" src="{{ site.baseurl }}/assets/2014/01/Keyboard1.jpg" alt="Assigning A Hotkey" width="659" height="267" />][2]

## Step #5 (not optional): Rock and roll.

At this stage, everything should be ready to go. Let&#8217;s test it out. First, I create a new note and add some blank checkboxes to it.

[<img class="alignnone size-full wp-image-75" src="{{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-20-at-9.22.34-PM.png" alt="Add Evernote Note" width="531" height="455" />][3]

Then, I tag the note with the first tag (the one that indicates whether a note should be scanned).

[<img class="alignnone size-full wp-image-76" src="{{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-20-at-9.23.23-PM.png" alt="Adding The Tag" width="537" height="149" />][4]

I run my service (either through the Services menu or via my hotkey). The spinning gear in the Menu Bar tells me it&#8217;s working.

Once it&#8217;s done, the note should have the first tag removed and the second (the one that indicates a note has been processed) applied.

[<img class="alignnone size-full wp-image-77" src="{{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-20-at-9.24.47-PM.png" alt="Upload to Toodledo Complete" width="530" height="456" />][5]

A quick hop over to Toodledo – lo&#8217; and behold, it works!

[<img class="alignnone size-full wp-image-78" src="{{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-20-at-9.26.20-PM.png" alt="Added Todo Items" width="968" height="79" />][6]

(Note that the &#8220;#1&#8221; and &#8220;#2&#8221; are missing; turns out that <a href="https://www.toodledo.com/info/help_email.php" target="_blank">the hashtag represents a special character when sending a task into Toodledo via email</a>)

Sweet success! That said, there are some things to watch out for with v.1 of this service:

  * The Applescript uses Mail to send the emails into Toodledo. Tactically, this doesn&#8217;t cause issues, but I have noticed that when I close Mail, there are several Drafts of my Toodledo emails sitting around&#8230;somewhat annoying.
  * Other than switching tags, the original Evernote note is not modified (e.g., the checkboxes aren&#8217;t checked). I did this on purpose; you might not want that done with your notes.
  * This doesn&#8217;t intelligently check Toodledo for things like tasks with the same name, etc. What you input is what you get.
  * I haven&#8217;t rigorously tested this against all situations (checkboxes with bolded text, etc.). Again, YMMV.

I&#8217;ve already got a list of items I&#8217;d like to address for v.2 of this service:

  1. Remove the Mail dependency (preferably by using something like sendmail or accessing the Toodledo API directly).
  2. Provide options for the user to modify the Evernote note in some way.
  3. Perhaps some more intelligence in parsing the todo text (e.g., in the example above, perhaps a warning that &#8220;#&#8221; represents a special character?).

In the meantime, enjoy!

 [1]: {{ site.baseurl }}/assets/2014/01/Keyboard.jpg
 [2]: {{ site.baseurl }}/assets/2014/01/Keyboard1.jpg
 [3]: {{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-20-at-9.22.34-PM.png
 [4]: {{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-20-at-9.23.23-PM.png
 [5]: {{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-20-at-9.24.47-PM.png
 [6]: {{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-20-at-9.26.20-PM.png
