---
title: WordPress, GitHub Gists, and RSS Feeds
author: Aaron
layout: post
permalink: /wordpress-github-gists-rss-feeds/
dsq_thread_id:
  - 2999641641
categories:
  - Tech
tags:
  - css
  - gist
  - github
  - html
  - javascript
  - rss
  - wordpress
---
The other day, I was looking at one of my posts in an RSS reader and noticed something interesting: it was missing all of its code snippets. Given that the post in question was code-related, missing snippets was a bad thing.

For several reasons, I save my larger snippets as <a title="GitHub" href="https://github.com/" target="_blank">GitHub</a> <a title="GitHub Gists" href="https://gist.github.com/" target="_blank">gists</a>:

  1. The code is externalized from my blog, which makes sharing individual snippets easier.
  2. Code formatting and presentation is taken care of GitHub (a small thing, but one less for me to manage).
  3. Because gists are GitHub repositories, others can suggest modifications and contribute as needed.
  4. WordPress has <a href="http://en.support.wordpress.com/gist/" target="_blank">nice, easy support for displaying gists</a>.

Upon closer review, however, I recognized the problem: WordPress uses Javascript to add the gist to its posts. RSS doesn&#8217;t support Javascript. Ugh.<!--more-->

## TL;DR

With one line of Javascript and a few lines of CSS, it is possible to augment gists in a self-hosted WordPress blog such that links to those gists appear in an RSS reader.

## The Preamble

To achieve a succinct solution, it is necessary to modify some of the core files of your WordPress installation; that&#8217;s a pretty large topic, so I&#8217;m not going to go into it at any length. Googling around should lead you in the right direction.

## The Process

### Step #1: Add the Javascript one-liner.

In `header.php`, add the following to the `<head>` section of the template:

{% highlight HTML %}
<script type="text/javascript">
  document.documentElement.className += " js";
</script>
{% endhighlight %}

This adds a CSS class of `js` to the `html` element. Note that, as you would expect, this line only executes if Javascript is available; the end result is that Javascript-friendly environments get the `js` class added to `html` and non-Javascript-friendly environments don&#8217;t.

### Step #2: Add the CSS.

Two lines of CSS come next:

{% highlight CSS %}
html.js .no_js, html .js { display: none }
html.js .js { display: block; }
{% endhighlight %}

The first line introduces a new class – `no_js` – that effectively hides any element it&#8217;s attached to. We&#8217;ll use that momentarily.

### Step #3: Replace existing gist URLs with some new HTML.

Now, simply replace every gist URL:

{% highlight HTML %}
https://gist.github.com/bachya/0d0051b3946ae5cdd6db
{% endhighlight %}

&#8230;with some new HTML:

{% highlight HTML %}
[gist 0d0051b3946ae5cdd6db /]
<div class=”no_js”>
  <a name=”0d0051b3946ae5cdd6db” href=”#0d0051b3946ae5cdd6db”>Click here to see the Gist.</a>
</div>
{% endhighlight %}

There are several things occurring in this HTML:

  1. I&#8217;m using the WordPress shortcode for embedding a gist (instead of pasting the gist URL). The benefit here is that the shortcode eschews the extra &#8220;padding&#8221; paragraphs that get wrapped around a gist created from a bare URL.
  2. Included next to the shorcode is a div that links back to this particular spot in the post (the idea being that touching this link in an RSS reader will lead the reader to a spot where they can actually view the snippet.

Thankfully, it works as expected:

[<img class="alignnone size-large wp-image-2072" src="{{ site.baseurl }}/assets/2014/09/2014-09-08-12.33.24-576x1024.png" alt="Smarter Gists in RSS Feeds"/>][1]

You might be wondering why I&#8217;m not using the `<noscript>` tag. The reasons are long, tedious, and well-summarized elsewhere<sup id="fnref-2030-1"><a href="#fn-2030-1" rel="footnote">1</a></sup><sup id="fnref-2030-2"><a href="#fn-2030-2" rel="footnote">2</a></sup> – I&#8217;ll leave that to your bedtime reading. <img src="http://www.bachyaproductions.com/wp-includes/images/smilies/simple-smile.png" alt=":)" class="wp-smiley" style="height: 1em; max-height: 1em;" />

## An Added Goody: Text Expansion

As you might expect, typing this HTML out every time is no good. Therefore, I created a simple <a href="http://www.trankynam.com/atext/" target="_blank">aText</a> snippet to get the job done: it takes either the ID or the URL of a gist and creates the necessary HTML.

{% gist 9b48ce3151ebf06e7955 %}

Enjoy!

----

<ol>
<li id="fn-2030-1">
  <a href="http://www.paulirish.com/2009/avoiding-the-fouc-v3/" target="_blank">http://www.paulirish.com/2009/avoiding-the-fouc-v3/</a>&#160;<a href="#fnref-2030-1" rev="footnote">&#8617;</a>
</li>
<li id="fn-2030-2">
<a href="https://stackoverflow.com/questions/2170484/shouldnt-we-use-noscript-tag" target="_blank">https://stackoverflow.com/questions/2170484/shouldnt-we-use-noscript-tag</a>&#160;<a href="#fnref-2030-2" rev="footnote">&#8617;</a></li>
</ol>

[1]: {{ site.baseurl }}/assets/2014/09/2014-09-08-12.33.24.png
