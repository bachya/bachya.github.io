---
title: A Better Safari Bookmarklet with Launch Center Pro
author: Aaron
layout: post
permalink: /better-safari-bookmarklet-launch-center-pro/
dsq_thread_id:
  - 2976340188
ptadn_textarea:
  - 'New Blog Post: {title} {link}'
ptadn_disable_post:
  - 0
categories:
  - Tech
tags:
  - bookmarklet
  - launch center pro
  - omnifocus
  - safari
---
A while back, <a href="http://www.macstories.net/" target="_blank">Federico Viticci</a> created <a href="http://www.macstories.net/tutorials/safari-action-menu-in-launch-center-pro/" target="_blank">a method for a Launch Center Pro-based Safari bookmarklet</a>. Federico&#8217;s invention is a great one: by selecting a single mobile bookmarklet, he is able to send a URL from Safari to a Launch Center Pro list; from there, he can choose any number of actions to run that URL through.

<img src="http://313e5987718b346aaf83-f5e825270f29a84f7881423410384342.r78.cf1.rackcdn.com/1391530396-2014-02-04-at-17-12-36-.jpeg" alt="Federico Viticci's Safari Bookmarklet"/>

The beauty of this solution is in its &#8220;self-contained-ness.&#8221; It doesn&#8217;t need a preëxisting Launch Center Pro action; it generates a list on the fly.

Of course, it&#8217;s not a perfect solution. Federico, again, in his own words:

> Though my solution works, the code isn’t pretty. Until Apple improves the way apps can share information with each other, we’re stuck with hacks like URL schemes, JavaScript, and manual encoding. If you want to customize what I came up with, you’ll have to manually edit URL schemes and test everything on your own. If you’re not concerned about a bookmarklet’s prettiness, go ahead.

And later on:

> The solution that I employ to launch a list not based on an existing action is to “trick” Launch Center Pro into linking to itself. Using the launchpro://?url= URL scheme twice, you can tell Launch Center Pro to open a Launch Center Pro URL to display a list. I don’t know why I couldn’t simply launch the app and tell it to display a list without nesting two levels of URL schemes, but that’s how it is. You’re telling Launch Center Pro to open itself.

<!--more-->

## TL;DR

Create a single Safari bookmarklet that shuttles the current URL to a variety of preexisting Launch Center Pro actions.

## Taking A Shot

After reading Federico&#8217;s article, I began to look at <a href="http://www.bachyaproductions.com/ios-url-actions-the-up-to-date-guide/#mobile-bookmarks" target="_blank">my list of mobile bookmarklets</a>:

<img class="clarify-step-image" src="{{ site.baseurl }}/assets/2014/08/taking-a-shot.png" alt="" width="654" height="1150" />

They all serve a great purpose, sure, but in this new light, I saw several issues:

  1. They&#8217;re all very similar in terms of structure (read: I have to type the same repetitious stuff *every time* I make a bookmark).
  2. It&#8217;s a pain to type out mobile bookmarks on iOS (yes, LCP is a pain, too, but I find it not as troublesome). This, combined with #1, makes life hurt.
  3. They mimic a lot of similar functionality in Launch Center Pro; this means that when I change one, I automatically have double the work.

That&#8217;s an awful lot of repetition. Given this, and that Federico&#8217;s article dates back to February (meaning LCP has undergone several revisions since that time), I set out to make my version of this workflow.

## The Result

My bookmarklet looks a lot like Federico&#8217;s:

{% highlight HTML %}
javascript:window.location='launch://clipboard?text=' + encodeURIComponent(location.href) + '&lc-callback=' + encodeURIComponent('[list:' + location.href + '|Buffer=[action:151]|Clean Link=[action:149]|Drafts=[action:146]|OmniFocus=[action:145]|Pinboard=[action:129]|Pushbullet=[action:116]|Pythonista=[action:148]|Readability=[action:114]|Shorten URL=[action:150]]')
{% endhighlight %}

Can you spot the primary differences?

  1. I make use of the <a href="http://help.contrast.co/hc/en-us/articles/203351237-2-3-Release-Notes" target="_blank">lc-callback URL parameter</a> to stay within Launch Center Pro. This prevents me from having to use Federico&#8217;s &#8220;LCP calling itself&#8221; hack.
  2. Each action points to an <a href="http://help.contrast.co/hc/en-us/articles/203351237-2-3-Release-Notes" target="_blank">action tag</a>, and not a raw URL.

The inevitable question, then, on #2: why? What benefit does it offer?

First, some context.

## The Clipboard Group

To understand why action tags are so valuable, it is important to consider one of my LCP action groups – the &#8220;Clipboard&#8221; group:

<img class="clarify-step-image" src="{{ site.baseurl }}/assets/2014/08/the-clipboard-group.png" alt="" width="654" height="1150" />

These actions all follow a simple premise: they take the iOS clipboard contents (either a URL or other raw text) and pass it to the appropriate app. For instance, my &#8220;Task From URL&#8221; action <a href="http://www.bachyaproductions.com/omnifocus-tasks-urls-ios/" target="_blank">creates OmniFocus tasks from a URL</a>.

A revelation came: *these actions were nearly identical to my mobile bookmarklets*. The only true difference was the source of the data used in the action; the bookmarklets used data gleaned from Javascript, while the LCP actions used clipboard contents. I realized that this could be bridged by making use of LCP&#8217;s ability to store arbitrary data on the clipboard.

Take a closer look at my bookmarklet:

{% highlight HTML %}
launch://clipboard?text=' + encodeURIComponent(location.href) + '&lc-callback=...'
{% endhighlight %}

This part of the bookmarklet places the URL on the clipboard, *then* provides the user an opportunity to choose an action via a lc-callback list.

That&#8217;s great and all, but it still doesn&#8217;t explain what the LCP action tags within the bookmarklet do. The last link in the chain is understanding that each LCP task, once created, is given a unique ID that can be found at the bottom of its detail screen:

<img class="clarify-step-image" src="{{ site.baseurl }}/assets/2014/08/731fd4d9-1301-40bf-a7e7-05133b6cf7be.png" alt="" width="654" height="1150" />

Knowing this, take a look at all of my &#8220;Clipboard&#8221; actions and their corresponding Action IDs:

<img class="clarify-step-image" src="{{ site.baseurl }}/assets/2014/08/5c3834fb-183b-4c6e-90ac-1b1cd4f31c94.png" alt="" width="654" height="1150" />

Do you see the beauty? **By reusing Launch Center Pro actions, my bookmarklet (a) offloads its requests to existing actions (that I know work) and (b) doesn&#8217;t need manual adjustments beyond adding new actions to the list.**

This is crucial to me because I don&#8217;t always grab URLs directly from Safari. When I receive a URL in an email, I want to be able to act upon it without going into Safari first. When the URL *does* come from Safari, however, it uses the exactly same functionality. Reduced variability gives every developer happiness. <img src="http://www.bachyaproductions.com/wp-includes/images/smilies/simple-smile.png" alt=":)" class="wp-smiley" style="height: 1em; max-height: 1em;" />

## The New Bookmarklet

With this workflow, I can replace all of my existing Safari bookmarklets with a single one:

<img class="clarify-step-image" src="{{ site.baseurl }}/assets/2014/08/the-new-bookmarklet.png" alt="" width="654" height="1150" />

When I touch this bookmarklet, I get kicked over to Launch Center Pro and get the same opportunity to act upon it in the same way as Federico&#8217;s original bookmarklet (URL-in-the-list-title included):

<img class="clarify-step-image" src="{{ site.baseurl }}/assets/2014/08/64974317-7ce2-4a85-b691-7a6ffb83e45e.png" alt="" width="654" height="1150" />

*(Note the nice icons; like Federico, I like to include them; they aren&#8217;t perfect – ideally, they&#8217;d match the app icons – but they help me distinguish apps quickly.)*

The difference, of course, is that when I select an option, I launch the corresponding LCP action; thus, I get the same result without having to double the work.

## The One Bummer

You may have noticed one &#8220;Clipboard&#8221; action that I left out:

<img class="clarify-step-image" src="{{ site.baseurl }}/assets/2014/08/the-one-bummer.png" alt="" width="231" height="231" />

This action allows me to <a href="http://www.bachyaproductions.com/ios-url-actions-the-up-to-date-guide/#lcp-tweetbot-search" target="_blank">smartly search for Twitter users in Tweetbot by putting the link to their Twitter profile in the clipboard.</a> To use it with my new, single Safari bookmarklet, I would have to be able to highlight that Twitter URL and run my bookmarklet; unfortunately, <a href="http://media.agiletortoise.com/drafts/bookmarklet.html" target="_blank">this isn&#8217;t totally possible</a>:

> Mobile Safari limits what you can do with a bookmarklet &#8211; it will work for grabbing the URL always, but only the selected text per below limitations/exception. ***Specifically, [you] cannot grab selected text from a web page from a bookmarklet***. There is one exception to this rule. If you are on an iPad, go to Settings > Safari and enable &#8220;Always show bookmark bar&#8221;, and the Bookmarklet is in visible in your bookmark bar (not a submenu), when you tap it, it will capture the text selection properly.

Yes, I could create an iPad-friendly version of the bookmarklet, but when considering a solution that doesn&#8217;t work on all iOS devices, I come up short. My slight tech-OCD won&#8217;t allow that.

*Dear Apple: in the future, please allow all devices to programmatically grab selected text in Safari. #gracias*
