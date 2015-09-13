---
title: How I Manage Groceries with Trello, Launch Center Pro, Pythonista, and IFTTT
author: Aaron
layout: post
permalink: /groceries-trello-launch-center-pro-pythonista-ifttt/
comments: true
dsq_thread_id:
  - 2976275770
categories:
  - Tech
tags:
  - ifttt
  - launch center pro
  - pythonista
  - trello
---
Growing up, my family kept a notecard in the kitchen that served as our grocery list. As time passed (and we needed to shop at more stores), more notecards were added to the stack. It was simple, but it worked. These times, however, demand a more technical solution to this age-old problem.

Getting married provided the impetus to find a solution. My wife and I both lead busy careers and on-the-go lifestyles; we needed a solution that would allow us to quickly access our grocery lists, adjust items in those lists, and go shopping when the opportunity struck.
<!--more-->

## TL;DR

Thanks to Trello, Launch Center Pro, Pythonista, and IFTTT, I have a simple, automated method for easily adding new grocery items to my lists (no matter where I am).

## Managing the Lists in Trello

We examined many tools in our quest to find something suitable for grocery list management: <a href="http://support.apple.com/kb/HT4970" target="_blank">Reminders</a>, <a href="http://realmacsoftware.com/clear/" target="_blank">Clear</a>, and many others. Although perfectly good apps, they failed to meet our criteria. Our ideal app should:

  * be able to create an unlimited amount lists.
  * allow for easy sharing of those lists between multiple individuals.
  * be cross-platform and web-accessible.
  * have a companion mobile app with a robust URL scheme.
  * have a published API.

As we researched, one app kept coming up again and again: <a href="https://trello.com/" target="_blank">Trello</a>. A longstanding member of my toolkit, Trello appeared to fit all of our needs: it wasn&#8217;t tied to any one platform, had a robust iOS app, was easy to for multiple users to use, etc. &#8220;Grocery management&#8221; wasn&#8217;t specifically advertised as a use for Trello, but with more and more thought, it stuck out as a clear choice.

We don&#8217;t get particularly fancy with our Trello setup. We merely create a list for every grocery store that we need and under it, we stack our items as cards:

[<img class="alignnone size-large wp-image-1888" src="{{ site.baseurl }}/assets/2014/08/570cb30d-33b8-46a6-8bba-0d1a6c01c4d4-1024x734.png" alt="Grocery Lists in Trello" width="648" height="464" />][1]

This setup is simple and easy to support. Either of us can add new items as needed and, when shopping, can merely swipe away cards via the iOS app:

[<img class="alignnone size-large wp-image-1889" src="{{ site.baseurl }}/assets/2014/08/b9a48461-ff8c-4767-8d32-974c3f970de9-582x1024.png" alt="Grocery Lists in Trello iOS" width="582" height="1024" />][2]

There&#8217;s only one &#8220;downside&#8221; to the Trello iOS app: adding items to it isn&#8217;t as quick as we&#8217;d like. From opening the app to adding an item, there are anywhere from 3-5 touches; it isn&#8217;t the *biggest* drawback, but it provides enough friction to be noticeable.

To fix this particular issue, I turned to an old friend.

## Quick Entry via Launch Center Pro

In late May, <a href="http://www.bachyaproductions.com/trello-updates-ios-app-url-scheme-support/" target="_blank">Trello introduced a URL scheme for its iOS app</a>. When this occurred, one app immediately popped to mind: <a href="http://contrast.co/contact-center/" target="_blank">Launch Center Pro</a>. All sorts of automated Trello actions became possible by using LCP&#8217;s ability to &#8220;speak&#8221; with Trello. My first task was to cut the friction; I wanted the ability to quickly add grocery items to my various lists without having to dig and drag in the Trello app. Fortunately, <a href="https://trello.com/c/cJfzOdDm/188-automate-with-url-scheme" target="_blank">Trello&#8217;s URL scheme documentation</a> provided an exact mechanism to do this:

{% highlight html %}
trello://x-callback-url/createCard?shortlink={board_shortlink}&list-id={list_id}&name=MyCardName&description=MyCardDescription
{% endhighlight %}

There are several key parts to this scheme:

  * `Board Shortlink`: this is the unique identifier of the board (in my case, &#8220;Groceries and Household&#8221;). This can be found by looking the board&#8217;s URL.
  * `List ID`: this is the unique identifier of the list that will receive the new card (if omitted, the card gets added to the first list). **More on this in a moment.**
  * `Name`: the name of the card to be added.
  * `Description`: the description of the card to be added.

Knowing this, I constructed the following URL for use in LCP:

{% highlight html %}
trello://x-callback-url/createCard?shortlink={MY-BOARD-SHORTLINK}&name=[prompt:Item]&list-id=[list:Grocery Stores|Vitamin Cottage=xxxx1234|Costco=xxxx1234|Target=xxxx1234|VitaCost=xxxx1234|Pharmaca=xxxx1234|Home Depot=xxxx1234]&x-success={{launch:}}
{% endhighlight %}

This is fairly straightforward. First, the action asks the user to input the name of the item:

[<img class="alignnone size-large wp-image-1890" src="{{ site.baseurl }}/assets/2014/08/quick-entry-via-launch-center-pro-582x1024.png" alt="Grocery Item via LCP" width="582" height="1024" />][3]

Then, the user is prompted to pick the list to add to:

[<img class="alignnone size-large wp-image-1891" src="{{ site.baseurl }}/assets/2014/08/499d9ea7-2f22-402e-ae1a-00214d358389-582x1024.png" alt="Grocery Lists via LCP" width="582" height="1024" />][4]

Once a list is chosen, the new card is added to the appropriate list in Trello:

[<img class="alignnone size-large wp-image-1892" src="{{ site.baseurl }}/assets/2014/08/92e5f03c-ea54-46f9-b1bd-50a0ea4198b3-582x1024.png" alt="New Grocery Item via LCP" width="582" height="1024" />][5]

Easy enough, yes, but I&#8217;ve skipped over one crucial piece of information: where did I get the unique IDs for the lists?

Sadly, finding these IDs is not as easy as finding the board&#8217;s short code; it involves opening the right-hand menu, selecting `Share, Print, and Export...` and selecting `Export JSON`. From here, you have to dig through the board&#8217;s JSON, which is filled with all the cards, checklists, etc., archived or open, that the board has (and all their associated metadata). It&#8217;s not the most pleasant process.

When I first created my &#8220;Groceries&#8221; action in LCP, I *did* all that manual work. Over time, however, my wife and I began to add new stores to the list; this necessitated more trips into the weeds of Trello&#8217;s JSON and the unpleasantness grew.

There had to be a better way.

## List Creation via Pythonista

In the beginning of 2014, Phil Gruneich published <a href="http://philgr.com/blog/update-launch-center-pro-list-of-pinboard-tags" target="_blank">a blog post on updating Launch Center Pro&#8217;s list with a user&#8217;s most-used Pinboard tags</a>:

> One of the coolest tricks from Launch Center Pro 2 is the [list] parameter, which allows you to create a prompt of options to pick. It&#8217;s great because services with a specific set of search queries doesn&#8217;t rely on your memory to be called, like your Pinboard tags. However, once in a while you must review and manually update your LCP&#8217;s lists and that&#8217;s a bummer, so I built a Pythonista script to update your Pinboard tags for you.

My mind began working; what would happen if I could take the same principle – of grabbing Trello data via its API – and use <a href="http://omz-software.com/pythonista/" target="_blank">Pythonista</a> to automatically build an LCP workflow?

Turns out, I could. This is what I ended up with:

{% gist 5eb49cd846b772e84524 %}

Before this script will work for you, you will need to fill the two variables at the top of the script:

  * `TRELLO_KEY`: your Trello developer key (generated from <a href="https://trello.com/1/appKey/generate" target="_blank">https://trello.com/1/appKey/generate</a>)
  * `BOARD_SHORTCODE`: the short code of the board that has the grocery lists

To see what this script does, let&#8217;s look at some screenshots. First, Pythonista&#8217;s web browser opens and prompts me to authorize access to my Trello account:

[<img class="alignnone size-large wp-image-1893" src="{{ site.baseurl }}/assets/2014/08/list-creation-via-pythonista-582x1024.png" alt="Pythonista Trello Authorization" width="582" height="1024" />][6]

Once authorized, Trello will offer up a token, which, once saved, will allow the Pythonista script to reach Trello&#8217;s API:

[<img class="alignnone size-large wp-image-1894" src="{{ site.baseurl }}/assets/2014/08/afd95fdb-bd6a-43e1-bde5-0ab482f4e4d7-582x1024.png" alt="Trello Token in Pythonista" width="582" height="1024" />][7]

I copy the token and close the web browser. Upon returning to the Pythonista console, I paste the token and touch `Return`. After a few brief seconds, Pythonista kicks me over to LCP, wherein I am presented with a new incoming action:

[<img class="alignnone wp-image-1895 size-large" title="New LCP Trello Actions" src="{{ site.baseurl }}/assets/2014/08/7f1d109b-82e6-45bd-a59c-0c14654e3fd2-582x1024.png" alt="New LCP Trello Actions" width="582" height="1024" />][8]

I merely tap on my existing &#8220;Groceries&#8221; action and replace it with this new iteration:

[<img class="alignnone size-large wp-image-1896" src="{{ site.baseurl }}/assets/2014/08/5f979db0-2e90-4277-ba10-e62d5814296e-582x1024.png" alt="Replacing Existing Grocery Action in LCP" width="582" height="1024" />][9]

This solution is almost perfect, but one item continued to nag me: would I really have to manually run this Pythonista script every so often (to grab my list changes)?

## Automation via IFTTT

With this particular workflow, it quickly became clear that I could automatically remind myself to run the Pythonista script every month via an IFTTT recipe:

<a id="embed_recipe-199674" class="embed_recipe embed_recipe-l_44" href="https://ifttt.com/view_embed_recipe/199674-update-grocery-store-list-in-lcp-every-month" target="_blank"><img style="max-width: 100%;" src="https://ifttt.com/recipe_embed_img/199674" alt="IFTTT Recipe: Update Grocery Store List in LCP every month connects date-time to launch-center" width="370px" /></a>

When this recipe runs, I receive a notification on my phone; touching that notification automatically runs the Pythonista script:

[<img class="alignnone size-large wp-image-1897" src="{{ site.baseurl }}/assets/2014/08/automation-via-ifttt-582x1024.png" alt="Grocery List Updating via IFTTT" width="582" height="1024" />][10]

## Closing Thoughts

This is yet another case where a trusty, reliable set of automation tools allowed me to create a workflow that is beneficial and time-saving. Especially exciting is Phil&#8217;s concept of using Pythonista to talk to outside web services; I&#8217;m already off and running on ideas for other such workflows.

Isn&#8217;t this fun? <img src="http://www.bachyaproductions.com/wp-includes/images/smilies/simple-smile.png" alt=":)" class="wp-smiley" style="height: 1em; max-height: 1em;" />

 [1]: {{ site.baseurl }}/assets/2014/08/570cb30d-33b8-46a6-8bba-0d1a6c01c4d4.png
 [2]: {{ site.baseurl }}/assets/2014/08/b9a48461-ff8c-4767-8d32-974c3f970de9.png
 [3]: {{ site.baseurl }}/assets/2014/08/quick-entry-via-launch-center-pro.png
 [4]: {{ site.baseurl }}/assets/2014/08/499d9ea7-2f22-402e-ae1a-00214d358389.png
 [5]: {{ site.baseurl }}/assets/2014/08/92e5f03c-ea54-46f9-b1bd-50a0ea4198b3.png
 [6]: {{ site.baseurl }}/assets/2014/08/list-creation-via-pythonista.png
 [7]: {{ site.baseurl }}/assets/2014/08/afd95fdb-bd6a-43e1-bde5-0ab482f4e4d7.png
 [8]: {{ site.baseurl }}/assets/2014/08/7f1d109b-82e6-45bd-a59c-0c14654e3fd2.png
 [9]: {{ site.baseurl }}/assets/2014/08/5f979db0-2e90-4277-ba10-e62d5814296e.png
 [10]: {{ site.baseurl }}/assets/2014/08/automation-via-ifttt.png
