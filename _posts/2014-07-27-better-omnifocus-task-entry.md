---
title: Better OmniFocus Task Entry
author: Aaron
layout: post
permalink: /better-omnifocus-task-entry/
dsq_thread_id:
  - 2878621928
categories:
  - Productivity
  - Tech
tags:
  - apple mail
  - applescript
  - hazel
  - nvalt
  - omnifocus
---
In keeping with GTD principles, every time a task comes to mind, I have to get it into OmniFocus right away. The longer it stays in my brain, the more likely I am to forget it.

OmniFocus has a quick entry mechanism that allows me to type `^ + Space` and enter tasks at lightening speed. There&#8217;s one catch, however: OmniFocus has to be open for it to work. Believe it or not, I *don&#8217;t* always have OmniFocus open. Opening it, *then* entering my tasks introduces a slightly irksome level of friction, and that isn&#8217;t acceptable.

I realized that this was true of OmniFocus&#8217; AppleScript methods, as well: OmniFocus needs to be open in order for them to work. Given that I have some workflows that make use of these methods, this, too, introduced friction.<!--more-->

## TL;DR

With a smart Applescript, it&#8217;s possible to add tasks to OmniFocus regardless of whether it&#8217;s open.

## The Beginning

I brainstormed a bit and came up with a flow to remove the friction and be more robust overall:

  1. If OmniFocus is open, use its AppleScript methods to add tasks.
  2. If OmniFocus isn&#8217;t open, use <a title="OmniFocus Mail Drop" href="http://support.omnigroup.com/omnifocus-mail-drop" target="_blank">Mail Drop</a>.

Fortunately, with a little wizardry, this can be accomplished in a variety of workflows. Here&#8217;s how to do it.

## Postfix

In order to do #2 above, it is necessary to install and configure a mail server on OS X. Postfix is a great option and, once installed, allows you to easily send email via the command line.

/usr has <a title="Enabling postfix for outbound relay via Gmail on OS X Lion" href="http://blog.anupamsg.me/2012/02/14/enabling-postfix-for-outbound-relay-via-gmail-on-os-x-lion-11/" target="_blank">a guide on installing Postfix on OS X</a>. Use it to set up Postfix on your own machine.

## The Generic AppleScript

Although my various OmniFocus workflows include other applications and scripts, the same base AppleScript is used across each:

{% gist 7eb70e95f2ff12fce918 %}

There is a decent amount happening here, but it&#8217;s not difficult to understand. The basic flow goes like this:

  1. Query OS X and see how many instances of the &#8220;OmniFocus&#8221; process exist.
  2. If more than one instance is running, use OmniFocus&#8217; AppleScript methods to create a task.
  3. Otherwise, use the `mail` command (which, assuming you&#8217;ve followed the /usr guide above, uses Postfix) to mail the task to OmniFocus via Mail Drop.

With this flow in place, all sorts of new workflows become possible.

## Alfred 2 Workflow

<a href="/wp-assets/uploads/2014/07/OmniFocusPlus.alfredworkflow">Download Workflow</a>

This Alfred 2 workflow gives me a quick entry mechanism comparable to OmniFocus&#8217; own method, but which makes use of my base AppleScript:

{% gist 22541a8b15d5963988ab %}

With this, Alfred can give me the quick entry experience that I want – I simply use the `of` command:

[<img class="alignnone wp-image-1668 size-full" src="{{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-27-at-7.23.23-PM.png" alt="OmniFocus+ for Alfred" width="620" height="150" />][1]

&#8230;and the task is added to OmniFocus, regardless of whether it&#8217;s open or not:

[<img class="alignnone wp-image-1670 size-full" src="{{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-27-at-7.23.39-PM.png" alt="Task From OminFocus+" width="286" height="49" />][2]

## Apple Mail Service

<a href="/wp-assets/uploads/2014/07/AddEmailsToOmniFocus.workflow.zip">Download Service</a>

This Automator service works on any selected messages in Mail:

  1. Sends the email to OmniFocus as a task.
  2. Attaches the `@FollowUp` flag (a byproduct of the excellent <a title="MailTags" href="http://www.indev.ca/MailTags.html" target="_blank">MailTags</a>) to the email.

The power lies in the AppleScript that comes along with the service:

{% gist 48fd6a35a7686b87bee1 %}

Thus, I can select a group of messages&#8230;

[<img class="alignnone size-full wp-image-1676" src="{{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-27-at-7.42.25-PM-copy.png" alt="Selected Messages in Mail" width="253" height="294" />][3]

&#8230;and run the service, which nicely tags the messages for follow up&#8230;

[<img class="alignnone size-full wp-image-1677" src="{{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-27-at-7.45.37-PM-copy.png" alt="Tagged Messages in Mail" width="252" height="320" />][4]

&#8230;and sends them to OmniFocus as tasks:

[<img class="alignnone size-full wp-image-1679" src="{{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-27-at-7.49.42-PM.png" alt="Mail Tasks in OmniFocus" width="387" height="143" />][5]

Another nice feature: the task&#8217;s note includes a URL back to the original email:

[<img class="alignnone wp-image-1680 size-full" src="{{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-27-at-7.46.17-PM.png" alt="Message URL Note" width="254" height="235" />][6]

## nvALT Checkboxes via Hazel

<div class="aio-button">
  <a href="/wp-assets/uploads/2014/07/nvALTToOmniFocus.hazelrules" class="aio-red" title="Download Hazel Rule"><i class="glyphicons glyphicons-download-alt"></i>Download Hazel Rule</a>
</div>

I mentioned this workflow in my posts on <a title="OmniFocus Rising" href="http://www.bachyaproductions.com/omnifocus-rising/" target="_blank">OmniFocus</a> and <a title="Evernote, Meet nvALT" href="http://www.bachyaproductions.com/evernote-meet-nvalt/" target="_blank">nvALT</a> – its purpose is to take &#8220;checkboxes&#8221; in nvALT (which I label as `[ x ]`) and convert them into OmniFocus tasks. As with the other workflows, it allows me to file tasks into OmniFocus whether it is open.

The companion AppleScript used by the Hazel rule looks like this:



*(Notice the ridiculous number of accompanying methods used to create a link back to the nvALT note; I wish I knew a better way.)*

Entering some tasks into nvALT:

<div class="monochrome_code">
  [ x ] Task #1<br /> [ x ] Task #2
</div>

&#8230;causes Hazel to parse them into OmniFocus tasks:

[<img class="alignnone size-full wp-image-1691" src="{{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-27-at-8.43.00-PM.png" alt="OmniFocus Tasks via Hazel" width="339" height="98" />][7]

Once again, these tasks&#8217; notes contain links back to the original nvALT notes:

[<img class="alignnone size-full wp-image-1692" src="{{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-27-at-8.43.52-PM.png" alt="Link Back to nvALT" width="256" height="239" />][8]

## Closing Thoughts

Some might look at this and think it&#8217;s a tad overkill. *Why not just keep OmniFocus open?* you might say. It&#8217;s a valid point, but in my own workflows, I&#8217;ve simply noticed that it doesn&#8217;t always happen. That&#8217;s usually enough of an impetus to drive me to invent a solution like this.

The truth is, when OmniFocus is open, its AppleScript methods are quicker (and it seems less elegant to email tasks when there are quicker methods). When OmniFocus is closed, however, the email method removes the friction that I&#8217;ve grown to dislike. Having one automated method for both saves me time, and that&#8217;s what productivity is all about.

Enjoy!

[1]: {{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-27-at-7.23.23-PM.png
[2]: {{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-27-at-7.23.39-PM.png
[3]: {{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-27-at-7.42.25-PM-copy.png
[4]: {{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-27-at-7.45.37-PM-copy.png
[5]: {{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-27-at-7.49.42-PM.png
[6]: {{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-27-at-7.46.17-PM.png
[7]: {{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-27-at-8.43.00-PM.png
[8]: {{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-27-at-8.43.52-PM.png
