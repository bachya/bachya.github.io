---
title: OmniFocus Tasks from URLs on iOS
author: Aaron
layout: post
permalink: /omnifocus-tasks-urls-ios/
dsq_thread_id:
  - 2976390803
categories:
  - Tech
tags:
  - drafts
  - editorial
  - launch center pro
  - omnifocus
  - python
  - pythonista
  - x-callback-url
---
A common headache of mine: what&#8217;s the most efficient way to copy a URL in one iOS app and quickly create a relevant task for it in <a href="https://www.omnigroup.com/omnifocus" target="_blank">OmniFocus</a>?

<a href="http://www.bachyaproductions.com/connected-1-mindset-of-2001/" target="_blank">My earlier post on an episode of Connected</a> is a great example: I had to copy the podcast URL from <a href="https://overcast.fm/" target="_blank">Overcast</a>, switch over to OmniFocus, create a task with a relevant name (i.e., one that wasn&#8217;t just the URL itself), and save it. Adding to the friction of this experience is that I did it while trying to rush out the door.

Thus, I set out to create a cleaner method.<!--more-->

## TL;DR

Create a smart Launch Center Pro action that creates detailed tasks from clipboard URLs.

## The End Goal

Upon copying a URL, the workflow should run with a <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a> action that:

  1. allows the user to select what &#8220;type&#8221; the new task will be (e.g., a reminder to email someone about this URL, a reminder to create a blog post about this URL, or a custom one).
  2. selects the task-creation method (either <a href="http://support.omnigroup.com/omnifocus-mail-drop" target="_blank">Mail Drop</a> or the OmniFocus URL scheme) to use.
  3. finally, creates an OmniFocus task that has the type, the name of the URL&#8217;s page, and includes the URL in the task note.

## The Software Participants

  * Launch Center Pro
  * <a href="http://omz-software.com/pythonista/" target="_blank">Pythonista</a>
  * <a href="http://agiletortoise.com/drafts/" target="_blank">Drafts</a>
  * OmniFocus for iOS
  * Mail Drop

## The Setup

### Step #1. Download the Pythonista Script

The Pythonista script is a fairly simple one; I&#8217;ll let the comments speak for themselves:

{% gist 5c806bb14b9dd8a78268 %}

### Step #2. Download the Drafts Mail Drop Action

{% highlight HTML %}
drafts://x-callback-url/import_action?type=email&name=Email to OmniFocus&to=xxxxx.xxxxx@sync.omnigroup.com&cc=&bcc=&subjecttype=1&subject=&markdown=1&background=1&fromprefix=&template=[[body]]
{% endhighlight %}

You&#8217;ll notice that in the Pythonista script, the Mail Drop method makes use of a Drafts action. <a href="http://www.bachyaproductions.com/ios-url-actions-the-up-to-date-guide/#lcp-task-omnifocus" target="_blank">I&#8217;ve discussed this before</a> – when sending tasks to OmniFocus via Mail Drop, I prefer using Drafts because it allows transmission of the email in the background (something Launch Center Pro does not do).

At any rate, this Drafts action is straightforward:

  * The first line of the draft (the title) gets used as the task title in OmniFocus.
  * The remaining lines of the draft (the body) get used as the task note in OmniFocus.

The only part you should have to change is the &#8220;To&#8221; address; make sure to use **your** Mail Drop address.

### Step #3. Download the Launch Center Pro Action

  <a target="_blank" href="https://launchcenterpro.com/ynyrw2">Import in Launch Center Pro</a>

The Launch Center Pro action is also straightforward:

  1. First, prompt the to pick a task &#8220;type&#8221; (meaning, the text that will appear in the OmniFocus task title *before* the title of the URL). There are some defaults in place – &#8220;Blog post&#8221; and &#8220;Email&#8221; – as as well as the opportunity to enter a custom type.
  2. Second, prompt the user to pick a delivery method (either Mail Drop or the OmniFocus iOS app).
  3. Launch the Pythonista script provide (as arguments) the URL (from the clipboard) and the delivery method.
  4. Once the task is created, return control to Launch Center Pro.

(Feel free to customize the list of task types to fit your purposes.)

**With all this in place, let&#8217;s test, shall we?**

## The Test

As an example, let&#8217;s use something comparable to what I opened with: let&#8217;s pretend that I want to remember to email someone about the first episode of <a href="http://relay.fm/inquisitive" target="_blank">Inquisitive</a> (after listening to it in Overcast).

First, I pop open the share sheet in Overcast (while on that episode):

<img class="clarify-step-image" src="{{ site.baseurl }}/assets/2014/08/3d58041f-7a5f-408f-9149-8d35ee407cb6.png" alt="" width="654" height="1150" />

In Launch Center Pro, I run the &#8220;Task From URL&#8221; action:

<img class="clarify-step-image" src="{{ site.baseurl }}/assets/2014/08/452257c2-ae3d-4720-8163-98c8633f785b.png" alt="" width="654" height="1150" />

I select the &#8220;Email&#8221; task type:

<img class="clarify-step-image" src="{{ site.baseurl }}/assets/2014/08/e18d60ae-6675-45b6-878a-76694ef28d2b.png" alt="" width="654" height="1150" />

I choose the delivery mechanism – for the purposes of this test, I&#8217;ll choose &#8220;Mail Drop&#8221;:

<img class="clarify-step-image" src="{{ site.baseurl }}/assets/2014/08/9ebaee76-f9e2-4e3d-b5d0-a14c007ea3fa.png" alt="" width="654" height="1150" />

The action runs and control returns to Launch Center Pro. A quick jump over to OmniFocus shows that my task has arrived successfully:

<img class="clarify-step-image" src="{{ site.baseurl }}/assets/2014/08/7a55dc6c-25cf-452b-807b-079c2c89f036.png" alt="" width="654" height="1150" />

## Wrap Up

I continue to be amazed at how useful Pythonista (and its sister app, <a href="http://omz-software.com/editorial/" target="_blank">Editorial</a>) are capable of. In so many workflows, the default tools of the individual apps – great though they may be – aren&#8217;t enough; in those instances, the power of Python shines through these two outstanding apps.

Enjoy!

**UPDATE (9/2/14):** *Updated the script to handle URLs that reject &#8220;bot-like&#8221; requests.*
