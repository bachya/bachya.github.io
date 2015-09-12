---
title: True Fenced Events in Fantastical
author: Aaron
layout: post
permalink: /true-fenced-events-fantastical/
dsq_thread_id:
  - 2976412703
categories:
  - Productivity
  - Tech
tags:
  - editorial
  - fantastical
  - launch center pro
  - python
  - pythonista
  - x-callback-url
---
A few months ago, I noticed a rather repetitive action that kept occurring: every time I scheduled certain events on my calendar (haircuts, chiropractic adjustments, dentist appointments, etc.), I would have to manually schedule &#8220;unavailable time&#8221; before and after the event (so that my calendar was blocked off during periods of travel).

Forgetting to do this was bad; too many times, I&#8217;ve forgotten to do it and had someone book my calendar immediately before or after such an appointment.

Manual repetition, as always, spells the need for some automation. So, I set about building my ideal workflow.<!--more-->

## TL;DR

Create events that are &#8220;fenced&#8221; (or surrounded) by &#8220;driving time&#8221; events in an automated fashion.

## The End Goal

I wanted to create Launch Center Pro action that automated this process. Ideally, this action would:

  1. prompt me to enter an event/date/time combo.
  2. prompt me to enter an amount of time (in minutes) for the &#8220;beginning fence&#8221; (that is, the time before the real event).
  3. prompt me to enter an amount of time (in minutes) for the &#8220;trailing fence&#8221; (that is, the time after the real event).
  4. create three events – one for the event itself and two for the fences – in Fantastical (with the main event taking the title originally entered and the fences taking some user-defined string, like &#8220;UNAVAILABLE&#8221;).
  5. return to Launch Center Pro.

## The Parameters

I also wanted this workflow to give users the ability to configure some parameters to their liking:

  * Allow users to specify whether Fantastical should automatically create the three events, or let users edit them first.
  * Allow users to specify what event names the leading and trailing fences should have.
  * Allow users to specify what the default event length should be.

## The Software Participants

  * <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>
  * <a href="https://flexibits.com/fantastical-iphone" target="_blank">Fantastical 2</a>
  * <a href="http://omz-software.com/editorial/" target="_blank">Editorial</a>

Editorial is the secret sauce; it&#8217;s the power of this solution. I initially considered Ole Zorn&#8217;s other app, <a href="http://omz-software.com/pythonista/" target="_blank">Pythonista</a>, to be the engine of the workflow, but ended up choosing Editorial for a few different reasons:

  * Editorial has robust support for triggering x-callback-url requests (which are necessary to create multiple events). Pythonista does not.
  * Editorial allows for an easier creation of a parameters interface.
  * Editorial allows for easier UI controls, such as messages.

## The Setup

Without further adieu, let&#8217;s get started.

### Step #1. Install pipista and shellista

The first step is to install two outstanding open source projects within Editorial: <a href="https://gist.github.com/pudquick/4116558" target="_blank">pipista</a> and <a href="https://gist.github.com/pudquick/4139094" target="_blank">shellista</a>. These scripts will allow more flexibility in downloading modules that aren&#8217;t included in the default Python implementation within Editorial.

Editorial doesn&#8217;t have the ability to easily install Python files, so to get pipista and shellista into Editorial, connect your iOS device to iTunes and manually drag those files into &#8220;Editorial Documents&#8221; under &#8220;File Sharing&#8221;:

<img src="{{ site.baseurl }}/assets/2014/08/step-1-install-pipista-and-shellista.png" alt=""/>

### Step #2. Download parsedatetime

With pipista installed, it is easy to download parsedatetime; merely open the console and import the pipista module:

{% highlight Python %}
>>>> import pipista
{% endhighlight %}

Then, download parsedatetime:

{% highlight Python %}
>>>> pipista.pypi_download('parsedatetime')
{% endhighlight %}

Assuming everything goes correctly, a parsedatetime tarball should be downloaded into Editorial&#8217;s local directory:

<img src="{{ site.baseurl }}/assets/2014/08/step-2-download-parsedatetime.png" alt=""/>

### Step #3. Unpack parsedatetime

Back in the console, import shellista and create a basic interactive shell:

{% highlight Python %}
>>>> import shellista
>>>> shell = shellista.Shell()
>>>> shell.prompt = '> '
>>>> shell.cmdloop()
{% endhighlight %}

Next, unpack the parsedatetime tarball and move the resulting folder into the `pypi-modules` folder:

{% highlight Python %}
>>>> gunzip parsedatetime-1.4.tar.gz
>>>> untar parsedatetime-1.4.tar
>>>> mv parsedatetime-1.4 pypi-modules
{% endhighlight %}

Once you&#8217;re done, you should have a `parsedatetime-x.x` folder inside your `pypi-modules` folder:

<img src="{{ site.baseurl }}/assets/2014/08/step-3-unpack-parsedatetime.png" alt=""/>

### Step #4. Install and Configure the Editorial Workflow

<a target="_blank" href="http://www.editorial-workflows.com/workflow/6467019901763584/f8SYU354KxI">Import Into Editorial</a>

Once the workflow is installed, open it up and toggle the dropdown titled &#8220;The Good Stuff.&#8221; These are the parameters that you can configure:

  * `Leading Event Name`: the name that will be given to the leading fence (defaults to &#8220;UNAVAILABLE&#8221;)
  * `Trailing Event Name`: the name that will be given to the trailing fence (defaults to &#8220;UNAVAILABLE&#8221;)
  * `Create events automatically?`: determines whether Fantastical will automatically create each event or allow the user to edit them first
  * `Default event length in Fantastical`: the default event length used in Fantastical (*these must match!*)

<img src="{{ site.baseurl }}/assets/2014/08/step-4-install-and-configure-the-editorial-workflow.png" alt=""/>

### Step #5. Install the Launch Center Pro Action

<a target="_blank" href="https://launchcenterpro.com/cjlj9x">Import Into Launch Center Pro</a>

Feel free to play around with this, but it shouldn&#8217;t need any configuration out of the box.

### Step #6. Let It Run

In this example, I&#8217;m going to schedule a meeting from 8pm to 9pm today, with a 15 meeting leading fence and a 30 minute trailing fence; this should produce the following events:

  * UNAVAILABLE, 8/17, 7:45pm – 8pm
  * Meeting, 8/17, 8pm – 9pm
  * UNAVAILABLE, 8/17, 9:00pm – 9:30pm

<video id="example\_video\_id_526322936" class="video-js vjs-default-skin" width="640" height="264" controls preload="auto" autoplay loop data-setup='[]'> <source src="{{ site.baseurl }}/assets/2014/08/fenced-events.mov" type='video/mp4' /> </video>

## Closing Thoughts

This is a very complex workflow; in particular, I spent much time attempting to mimic Fantastical&#8217;s natural datetime parsing. This is no easy feat (and it makes me really appreciate all the work the Flexbits folks put into Fantastical). Ultimately, there are edge cases with this parsing that may not work as expected; as you run into those, please let me know so I can fix them.

Early on, I created a pseudo <a href="https://gist.github.com/bachya/9168693a094124ccdf63" target="_blank">challenge</a> to see what others thought of this particular problem. Special thanks to all the folks who gave me encouragement and advice:

  * <a href="http://philgr.com/" target="_blank">Phillip Gruneich</a>
  * <a href="http://n8henrie.com/" target="_blank">Nathan Henrie</a>
  * <a href="http://www.geekswithjuniors.com/" target="_blank">Eric Pramono</a>
