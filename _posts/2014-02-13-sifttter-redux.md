---
title: 'Sifttter Redux: Automate IFTTT to Day One'
author: Aaron
layout: post
permalink: /sifttter-redux/
dsq_thread_id:
  - 2295060320
categories:
  - Tech
tags:
  - cli
  - day-one
  - ifttt
  - raspberry-pi
  - sifttter-redux
---
A while back, <a href="/link-mash-january-28-2014/">I mentioned Sifttter</a>, a method for getting IFTTT data into a Day One Journal. It&#8217;s an elegant solution, but one aspect of it bothered me from the start: I couldn&#8217;t schedule Sifttter to run without leaving my MacBook on at night. I didn&#8217;t like that.

I wanted a solution that ran on its own. After configuring it, my ideal script would run every night at 11:55pm, grab the necessary data from IFTTT, and put it in my Day One journal, all without me having to manually kick off a process.

Today, I&#8217;m proud to introduce that solution: <a href="http://github.com/bachya/Sifttter-Redux" target="_blank">Sifttter Redux.</a> It uses the same base as Sifttter, but adds key functionality on top of it:

  * Interactive logging of today&#8217;s events or events in the past
  * &#8220;Catch Up&#8221; mode for logging several days&#8217; events at once
  * Packaged as a command line app, complete with documentation and help
  * Easy installation on cron for automated running

<!--more-->

## TL;DR

Sifttter Redux is an app that automatically syncs various services&#8217; data (Foursquare, Last.FM, etc.) to a Day One journal.

## Setting Up Sifttter Redux

### Set up IFTTT Recipes

<a href="http://craigeley.com/post/72565974459/sifttter-an-ifttt-to-day-one-logger" target="_blank">Craig&#8217;s original set-up guide</a> can be followed for Sifttter Redux, as well.

### Download and Configure Sifttter Redux

Full configuration instructions can be found on [the project&#8217;s GitHub page](http://github.com/bachya/Sifttter-Redux).

## Other Thoughts

This script has come a long way, but there are several features I&#8217;d like to add going forward. If there are bugs or features that you&#8217;d like to report, please use <a href="http://github.com/bachya/Sifttter-Redux/issues" target="_blank">the project&#8217;s Issues page</a>.

I&#8217;d like to extend a big thank-you to <a href="http://craigeley.com" target="_blank">Craig Eley</a> (and by extension, <a href="http://brettterpstra.com/" target="_blank">Brett Terpstra</a>) for their effort in advancing this idea. I see Sifttter Redux as a logical contribution to the work these two have already done and am grateful to have piggybacked on their ideas.

I&#8217;ve installed and tested this on my Raspberry Pi without issue. That said, this script should run on any *NIX system. Let me know in the comments if you have particular questions and I will help as best I can.

