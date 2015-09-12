---
title: 'Siri, Toodledo, &#038; Todo 7: Syncing iOS Reminders'
author: Aaron
layout: post
permalink: /siri-toodledo-todo-7-ios-reminders/
dsq_thread_id:
  - 2299443933
categories:
  - Tech
tags:
  - appigo todo
  - gtd
  - ifttt
  - ios
  - siri
  - toodledo
---
Like many, I have a love/hate relationship with Siri. When she doesn&#8217;t work, I start twitching. However, when she does work, she is an invaluable addition. In my life, this manifests itself most powerfully in the area of task management.

As I&#8217;ve <a title="Toodledo Tasks via Evernote Checkboxes (v.1)" href="http://www.bachyaproductions.com/2014/01/toodledo-tasks-via-evernote-checkboxes/" target="_blank">written about before</a>, I love <a href="http://www.toodledo.com" target="_blank">Toodledo</a> for its powerful, yet streamlined take on the GTD method. That said, its iOS app has left me wanting for some time. Inconsistent syncing, a funky/confusing layout, and lacking polish all hurt the user experience.

I recently started using <a href="http://www.appigo.com/todo-task-and-to-do-list.html" target="_blank">Todo 7 by Appigo</a> as a replacement. For the most part, it makes up for the native Toodledo app&#8217;s shortcomings. That said, one choice by Appigo stings: they decided to make &#8220;Siri syncing&#8221; – the process by which a user can ask Siri to create an iOS Reminder and have that reminder synced to Todo – a paid-for feature in their <a href="http://www.appigo.com/todo-cloud-collaborative-to-do-app-service.html" target="_blank">Todo Cloud</a> product. The native Toodledo app does this by default.

Given that I often say, &#8220;Siri, remind me to&#8230;&#8221; while driving, being able to synchronize iOS Reminders with my todo app is a must. At the same time, although I am not one to begrudge a freemium model, I can&#8217;t justify paying for Todo&#8217;s cloud service when Siri integration is the only thing I need.<!--more-->

## TL;DR

With some IFTTT wizardry, it is possible to synchronize Siri reminders with Appigo Todo *without* having to use Appigo&#8217;s paid-for service.

## The Setup

What is an enterprising young developer to do? Will Siri fade into the background as part of my workflow? Will I be doomed to remember stuff in my head (a big no-no for GTD practitioners) while driving?

Fear not, folks. For this particular trick, we&#8217;ll make use <a href="http://ifttt.com" target="_blank">IFTTT</a>.

(If you&#8217;ve never heard of IFTTT – a service that links various apps together in a if-this-happens-then-do-this structure – the easiest way to learn is to head to their website and start browsing).

The recipe is simple: if a new iOS Reminder gets added (via Siri in my case, but really, manual entry works, too), create a Toodledo task. Simple, elegant, beautiful.

<a id="embed_recipe-144033" class="embed_recipe embed_recipe-l_99" href="https://ifttt.com/view_embed_recipe/144033-when-a-new-ios-reminder-is-added-create-a-task-in-toodledo-used-for-appigo-todo-siri-integration" target="_blank"><img style="max-width: 100%;" src="https://ifttt.com/recipe_embed_img/144033" alt="IFTTT Recipe: When a new iOS reminder is added, create a task in Toodledo. Used for Appigo Todo Siri integration. connects ios-reminders to toodledo" width="370px" /></a>

To prove that it works (or perhaps to appease Siri, wherever she is), allow me a quick demonstration.

First, we ask Siri to remind me to write a new blog post.

<img class="alignnone size-medium wp-image-282" src="{{ site.baseurl }}/assets/2014/02/2014-02-03-08.55.41-169x300.png" alt="New Reminder via Siri" width="169" height="300" />

Within seconds, I check Toodledo and find my newly created task.

<img class="alignnone size-full wp-image-283" src="{{ site.baseurl }}/assets/2014/02/Screen-Shot-2014-02-03-at-8.57.30-AM.png" alt="Task Created via Siri" width="392" height="64" />

## Final Thoughts?

With this new tie between Reminders and Toodledo, Siri isn&#8217;t the only beneficiary. In another workflow that is supremely beneficial, I have a <a href="http://agiletortoise.com/drafts/" target="_blank">Drafts</a> action that sends a list of items to Reminders. Now, those items are automatically synced to Toodledo.

Users should note that this workflow still works nicely even when not using Todo 7. The regular Toodledo app requires you to open it before it syncs any items from Reminders. Although understandable, this is inefficient for me; all to often, I&#8217;ve missed todos because they never synced (and they never synced because I went too long with the app closed).

Finally, I don&#8217;t begrudge Appigo for restricting Siri integration to Todo Cloud; in fact, I urge you to look at the product and buy it if it fits your needs. If Siri integration is all you&#8217;re lacking, however, this is a nice way to do it.
