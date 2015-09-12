---
title: Better Hotlist Update for Toodledo
author: Aaron
layout: post
permalink: /better-hotlist-update/
categories:
  - Tech
tags:
  - toodledo
---
Not long after I published <a href="/productivity-part-2-todo-management/">my guide to using Toodledo</a>, I realized something was incomplete with my Better Hotlist: it didn&#8217;t take into account tasks that could technically be started on a particular date *and* have a hard due date.

A great example: what if I have a task that can be started today, but isn&#8217;t technically due until next Tuesday? I would want that to show up on the Better Hotlist starting today and stay there until it got done (hopefully on or before the due date).

Fortunately, Toodledo&#8217;s Saved Searches are flexible enough to get the job done:

[<img class="size-large wp-image-468 " alt="Updated Better Hotlist" src="{{ site.baseurl }}/assets/2014/02/Screen-Shot-2014-02-20-at-11.01.43-AM-1024x358.png" width="650" height="227" />][2]

Here&#8217;s what each of the conditions does – remember, if a task meets any of these criteria, it will show up:

  * **Starred yes:** shows any task that I&#8217;ve starred (which, [as you might remember][1], indicates a task with no hard deadline that I would like to focus on).
  * **Due Date is Today:** shows any task that is due today.
  * **Due Date is before Today:** shows any overdue task.
  * **Folder is &#8220;No Folder&#8221;:** shows a task in my &#8220;inbox&#8221; (i.e., any task I&#8217;ve not yet processed).
  * **Folder is &#8220;4. Waiting/Delegated&#8221; and Start Date was not in the last 3 days: **shows any task that I&#8217;ve delegated and have not heard back on in more than 3 days.
  * **Folder is not &#8220;4. Waiting/Delegated&#8221; and Start Date is after Yesterday:** shows any non-delegated task that became actionable yesterday; by my procedure, these tasks will always have due dates.

My continuing goal is to make the Better Hotlist where I spend 90+% of my time in Toodledo; with this small addition, every possible task scenario (that I&#8217;ve discovered thus far) is covered in one spot.

 [2]: {{ site.baseurl }}/assets/2014/02/Screen-Shot-2014-02-20-at-11.01.43-AM.png
