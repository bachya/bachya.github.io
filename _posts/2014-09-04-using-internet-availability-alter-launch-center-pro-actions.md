---
title: Using Internet Availability to Alter Launch Center Pro Actions
author: Aaron
layout: post
permalink: /using-internet-availability-alter-launch-center-pro-actions/
comments: true
dsq_thread_id:
  - 2989679981
categories:
  - Tech
tags:
  - drafts
  - launch center pro
  - python
  - pythonista
---
The other night, I was close to sleep when I suddenly remembered a todo I needed to jot down into OmniFocus. I rolled over, grabbed my phone, and began to open Launch Center Pro when I realized something: my phone was on airplane mode.

You see, I use <a title="Sleep Cycle" href="http://www.sleepcycle.com/" target="_blank">Sleep Cycle</a> as my alarm. The app requires that I keep the phone near the corner of my bed; call me paranoid, but I don&#8217;t like the idea of electromagnetic waves (via wi-fi, Bluetooth, etc.) circulating near my head all night long. Therefore, I keep my phone in airplane mode.

On this auspicious night, however, airplane mode posed a problem. You might recall that <a title="New Task in OmniFocus" href="http://www.bachyaproductions.com/ios-url-actions-the-up-to-date-guide/#lcp-task-omnifocus" target="_blank">I like to use a combination of Drafts and Mail Drop to add tasks to OmniFocus with very little friction</a>. This works wonderfully as long as I have an internet connection on my phone, but is useless when I don&#8217;t have the internet. And late that evening, as I was trying to head to sleep, toggling off airplane mode to add a task seemed arduous.<sup id="fnref-1929-1"><a href="#fn-1929-1" rel="footnote">1</a></sup>

And so, as I drifted off to sleep (task forgotten), I began to dream of modifying my task entry workflow to adapt to an internet-free environment as needed.<!--more-->

## TL;DR

Using Pythonista, it is possible for different Launch Center Pro actions to be executed based on internet availability.

## The Goal

The goal is simple: use Pythonista (my ever-growing Swiss army knife of a companion) to figure out whether my iPhone had an active internet connection; depending on that outcome, trigger the proper workflow.

When the internet is available, I use my Drafts action:

{% highlight HTML %}
drafts://x-callback-url/create?text=My%20New%20Task%0AThe%20task%20note&action=Email%20to%20OmniFocus&x-success=launch%3A%2F%2F
{% endhighlight %}

When the internet isn&#8217;t available, I use the OmniFocus URL scheme:

{% highlight HTML %}
 omnifocus:///add?name=My%20New%20Task&note=The%20task%20note
{% endhighlight %}

## The Participants

  * <a title="Launch Center Pro" href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>
  * <a title="Pythonista" href="http://omz-software.com/pythonista/" target="_blank">Pythonista</a>
  * Other apps as needed

## The Base Pythonista Script

Let&#8217;s take a look at the script itself and dive into the details:

{% gist 6ebf4715a09bccee9300 %}

To start, the script looks for two arguments:

  * `argv[1]` is a string of JSON that defines `URL_On` and `URL_Off` (the URLs that should be triggered when networking is available and unavailable, respectively). The script expects that the URLs are encoded properly by the time they arrive here:

As an example:

{% highlight json %}
"{'URL On': 'drafts://x-callback-url/create?text={Title}%0A{Note}&action=Email%20to%20OmniFocus&x-success=launch%3A%2F%2F', 'URL OFf': 'omnifocus:///add?name={Title}&note={Note}'}"
{% endhighlight %}

(note the double quotes around the entire string and the single quotes around the key/value pairs; this is important and is covered [below][1].)

  * `argv[2]` is a string of JSON that defines &#8220;tokens&#8221; to insert into the URLs. Look at the example above; see the two instances each of `{Title}` and `{Note}`? Those are tokens: placeholders to get filled in by Launch Center Pro prompts. The tokens themselves are simply key/value pairs.

As an example:

{% highlight json %}
"{'Title': 'Test Task', 'Note': 'this is my note'}"
{% endhighlight %}

With these two arguments, the script creates the proper URLs. Finally, it uses a nice method to decide whether the internet is accessible<sup id="fnref-1929-2"><a href="#fn-1929-2" rel="footnote">2</a></sup>; based on the result, the correct URL launches.

## The Launch Center Pro Action

Here&#8217;s the Launch Center Pro Action to run this script:

<a target="_blank" href="http://ift.tt/Z9yrbv">Import Into Launch Center Pro</a>

I mentioned this above: the types and order of quotes matters. Launch Center Pro requires that arguments passed to Pythonista be wrapped in double quotes. Therefore, I use double quotes to wrap the two JSON strings themselves and single quotes to wrap individual keys/values *within* those strings.

That&#8217;s it. Notice the generality of the script; it&#8217;s built in such a way to allow any URL schemes to be passed to it. No matter what, the proper URL is triggered in both internet-laden and internet-free situations.

## The Caveats

This is a great solution, but there are some minor drawbacks:

  * It introduces a new element to every workflow that uses it: Pythonista. It&#8217;s not the biggest deal, but there&#8217;s another bounce in between your normal workflows.
  * It should appropriately encode input parameters, but I make no guarantees; I haven&#8217;t checked every possibility.

----

  <ol>
<li id="fn-1929-1">
  This should give you an idea of how far I&#8217;ve taken automation: a 30-second task seems arduous to me. :)&#160;<a href="#fnref-1929-1" rev="footnote">&#8617;</a>
</li>
<li id="fn-1929-2">
I read <a title="Wi-fi Connection Status" href="http://omz-forums.appspot.com/pythonista/post/5113330364579840" target="_blank">a post in the Pythonista forums</a> that mentioned a few methods for determining whether the internet was accessible, but this was the only one I could get to work consistently. What I wrote in the comments is true: I hope <code>google.com</code> never goes away&#8230;&#160;<a href="#fnref-1929-2" rev="footnote">&#8617;</a></li>
</ol>
