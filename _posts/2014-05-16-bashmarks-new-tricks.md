---
title: 'bashmarks: new tricks'
author: Aaron
layout: post
permalink: /bashmarks-new-tricks/
dsq_thread_id:
  - 2688619764
categories:
  - Tech
tags:
  - bash
  - bashmarks
  - cli
---
I was recently introduced to <a title="bashmarks" href="https://github.com/huyng/bashmarks" target="_blank">bashmarks</a>, a great&nbsp;command-line script for managing &#8220;favorite&#8221; directories and quickly getting back to them.

Unfortunately,&nbsp;the default implementation has one&nbsp;limiting factor (for me, at least): its command names (e.g., `l`, `d`, etc.) are aliases that I already use.

I could have simply modified the script to use aliases that I&nbsp;*don&#8217;t* use, but where&#8217;s the friendliness in that? I wanted to craft a solution that would be configurable and usable for others.

So, I created <a title="bashmarks" href="https://github.com/bachya/bashmarks" target="_blank">my own fork</a> (after deducing that the original bashmarks hasn&#8217;t been updated in some time and doesn&#8217;t seem to be merging pull requests).<!--more-->

## TL;DR

I&#8217;m forking bashmarks in order to add some needed functionality.

## The Fork

<a href="https://github.com/bachya/bashmarks">Open on Github</a>

In my version, simply a line like this&nbsp;`~/.bashrc` or `~/.zshrc`:

{% highlight Bash %}
export BASHMARKS_PREFIX="your-prefix-here"
{% endhighlight %}

This prefix is then used to call all the normal bashmarks functions.

For a real example, say I used this prefix:

{% highlight Bash %}
export BASHMARKS_PREFIX="bm"
{% endhighlight %}

Then, my aliases would look like this:

{% highlight Bash %}
bms <bookmark_name> - Saves the current directory as "bookmark_name"
bmg <bookmark_name> - Goes (cd) to the directory associated with "bookmark_name"
bmp <bookmark_name> - Prints the directory associated with "bookmark_name"
bmd <bookmark_name> - Deletes the bookmark
bml - Lists all available bookmarks
{% endhighlight %}

Easy, simple, and it gets the job done. Enjoy!
