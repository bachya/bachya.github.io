---
title: Using vim and Evernote for Blogging Bliss
author: Aaron
layout: post
permalink: /using-vim-evernote-blogging-bliss/
dsq_thread_id:
  - 2748239442
ptadn_textarea:
  - 'New Blog Post: {title} {link}'
ptadn_disable_post:
  - 0
categories:
  - Tech
tags:
  - evernote
  - geeknote
  - markdown
  - sentinote
  - vim
  - wordpress
---
A while back, I had two separate "issues" pop up quite independently. First, being disenchanted with the text editors in my life, I began to learn vim. Second, I began to worry about my blog; although I was regularly backing up my WordPress settings, I didn't have archived hard copies of all my posts.

Rather esoterically, my mind began to blend the two issues together. *Aaron*, it said<sup id="fnref-1276-1"><a href="#fn-1276-1" rel="footnote">1</a></sup>, *what if we figured out a way to use vim to write blog posts AND create an archived copy in Evernote?* That would allow me to use all the beautiful power of vim, archive a copy of each post, and still get content into WordPress in an easy fashion. So, if anyone feels the need to be esoteric, here&#8217;s how I did it.<!--more-->

## TL;DR

vim is a perfect blogging tool and, when combined with Evernote&#8217;s archival abilities, is making a case to replace my current toolset.

## Step 1: Download and configure Geeknote.

The first bit of magic needed comes via [Geeknote][2]:

> Are you a geek? Do you like Evernote? Geeknote &#8211; is for you! Geeknote is an opensource Evernote console client for Linux, FreeBSD and Mac OS X. Use it for system administration needs, creating notes, notebooks, sync your local directories with Evernote notebooks. Use the power of command line!

Geeknote&#8217;s website has [excellent installation instructions to follow][3]. Of particular note, let’s change the default Geeknote editor to vim:

{% highlight Bash %}
$ geeknote settings –editor vim
{% endhighlight %}

Once completed, you can go ahead with the rest of the setup.

## Step 2: Install the Sentinote plugin for WordPress.

[Sentinote][4] provides WordPress the ability to talk with Evernote:

> Sentinote converts your notes into WordPress posts or pages. Keep using Evernote and when you’re ready to publish simply assign the “published” tag to your note. Tagging your notes lets you distinguish between posts and pages; set the note category; set the post format; assign a parent or just add normal post tags. Its like cyber magic!

Like Geeknote, Sentinote has [great installation instructions][5]. I&#8217;ll be waiting for you when you get back. <img src="http://www.bachyaproductions.com/wp-includes/images/smilies/simple-smile.png" alt=":)" class="wp-smiley" style="height: 1em; max-height: 1em;" />

## Step 3: Create a quick function for blog post creation

This step is entirely optional, but since we’re already on the command line, it’s useful to have a function that quickly creates blog posts:

{% gist bf398ed2acb9b8edbb66 %}

Simply run `bp`, enter a title for a blog post, and you’re off and running.

**With the pieces in place, here’s how my workflow functions.**

First, I run `bp`, which places me into a new vim session:

<img class="alignnone wp-image-1255 size-large" src="{{ site.baseurl }}/assets/2014/06/Screen Shot 2014-06-08 at 6.31.53 PM-1024x602.png" alt="New vim Session" width="648" height="380" />

Using vim’s excellence, I hammer out a blog post (in Markdown!) in record time:

<img class="alignnone wp-image-1253 size-large" src="{{ site.baseurl }}/assets/2014/06/Screen Shot 2014-06-08 at 6.41.23 PM-1024x602.png" alt="Completed Blog Post" width="648" height="380" />

With a quick `:wq`, Geeknote saves the Markdown as HTML into a new Evernote note (using the notebook and tags defined in the `bp` function):

<img class="alignnone wp-image-1254 size-large" src="{{ site.baseurl }}/assets/2014/06/Screen Shot 2014-06-08 at 6.42.58 PM-1024x619.png" alt="Blog Post in Evernote" width="648" height="391" />

When ready, I add the `published` tag and synchronize Evernote; this is the trigger that Sentinote picks up on to create a new WordPress post. I head over to WordPress and make sure that the post imported properly:

<img class="alignnone wp-image-1257 size-large" src="{{ site.baseurl }}/assets/2014/06/Screen Shot 2014-06-08 at 6.45.10 PM-1024x619.png" alt="Wordpress Blog Post" width="648" height="391" />

While here, I adjust things like tags, the post’s publication date, and any other info that Sentinote can’t influence directly. Once I’m done, I head back to Evernote, remove the `draft` tag, and re-synchronize. Within 5 minutes, my post becomes active:

<img class="alignnone wp-image-1256 size-large" src="{{ site.baseurl }}/assets/2014/06/Screen Shot 2014-06-08 at 6.46.42 PM-1024x619.png" alt="FInished Blog Post" width="648" height="391" />

**Esoteric? Yes. But it solves two problems at once and is undeniably cool.**

It certainly isn’t perfect<sup id="fnref-1276-2"><a href="#fn-1276-2" rel="footnote">2</a></sup>, but it gets the job done.

----

<ol>
<li id="fn-1276-1">
  This kind of thing happens all the time in my head.&#160;<a href="#fnref-1276-1" rev="footnote">&#8617;</a>
</li>
<li id="fn-1276-2">
There is some weirdness with Sentinote. Evernote isn&#8217;t nearly as good at rich text editing as WordPress, so I end up making changes in WordPress; unfortunately, it doesn&#8217;t seem those sync back to Evernote.&#160;<a href="#fnref-1276-2" rev="footnote">&#8617;</a></li>
</ol>

[1]: http://www.vim.org/ "vim"
[2]: http://www.geeknote.me/ "Geeknote"
[3]: http://www.geeknote.me/install/ "Geeknote Installation Instructions"
[4]: http://sentinote.com/ "Sentinote"
[5]: http://sentinote.com/documentation/ "Sentinote Documentation"
[6]: {{ site.baseurl }}/assets/2014/06/Screen Shot 2014-06-08 at 6.31.53 PM.png
[7]: {{ site.baseurl }}/assets/2014/06/Screen Shot 2014-06-08 at 6.41.23 PM.png
[8]: {{ site.baseurl }}/assets/2014/06/Screen Shot 2014-06-08 at 6.42.58 PM.png
[9]: {{ site.baseurl }}/assets/2014/06/Screen Shot 2014-06-08 at 6.45.10 PM.png
[10]: {{ site.baseurl }}/assets/2014/06/Screen Shot 2014-06-08 at 6.46.42 PM.png
