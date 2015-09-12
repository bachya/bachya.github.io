---
title: Markdown to Evernote, Slightly Modified
author: Aaron
layout: post
permalink: /markdown-evernote-slightly-modified/
dsq_thread_id:
  - 2296729792
categories:
  - Tech
tags:
  - applescript
  - evernote
  - markdown
  - osx
  - textmate
---
I recently started liking <a href="http://daringfireball.net/projects/markdown/" target="_blank">Markdown</a>. I had no reason to like it – nothing was prompting me to like it. Over time, however, I began to love the elegant simplicity it offers.

One problem, however: my note-taking best&nbsp;friend&nbsp;<a href="http://www.evernote.com" target="_blank">Evernote</a>&nbsp;doesn&#8217;t support Markdown; it only supports rich text. The dream of somehow accommodating Markdown into my life<span style="line-height: 1.5em;">&nbsp;seemed to die a fiery death.</span>

*Wrong.* If there&#8217;s one thing I can say about myself, it&#8217;s that such a conundrum serves only to motivate me (in an obsessive, stop-everything-until-I figure-it-out manner).

I took a quick stock of my assets:

  * Evernote
  * Textmate 2 (my long-loved programming text editor which, incidentally, supports Markdown)
  * Google

I began to assemble an idea:&nbsp;*What if I hammered out quick text notes in Textmate 2 (to get the benefits of Markdown) and found a way to send the results to Evernote?*<!--more-->

## TL;DR

A quick tweak allows the sending of markdown &#8220;checkboxes&#8221; to Evernote as Evernote checkboxes.

## The Setup

A quick Google search landed me on <a href="http://blog.timlockridge.com/blog/2013/02/03/using-textmate-and-markdown-with-evernote-configuring-a-workflow/" target="_blank">this blog post by Tim Lockridge</a>. In it, Tim describes a great Textmate bundle action that sends the current document – as Markdown – to Evernote. It&#8217;s a great action that does it&#8217;s job well.

When I stress tested it, however, I came across something interesting – sending this Markdown from Textmate:

[<img class="alignnone size-full wp-image-99" src="{{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-21-at-9.09.17-PM.png" alt="A Markdown Note in Textmate 2" width="634" height="105" />][1]

&#8230;produced this Evernote note:

[<img class="alignnone size-full wp-image-100" src="{{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-21-at-9.10.44-PM.png" alt="Markdown Note in Evernote 1" width="551" height="427" />][2]

I had expected the action to turn that <span style="font-size: 13px; line-height: normal; font-family: Courier;">[ ]</span> into an Evernote checkbox. <a href="http://www.bachyaproductions.com/2014/01/toodledo-tasks-via-evernote-checkboxes/" target="_blank">Given my propensity for using checkboxes in Evernote</a>, I needed to fix that.

## The Short Version

Here&#8217;s my modified bundle:

{% gist 7ec805ed001f048876ec %}

This bundle will correctly send `<en-todo/>` as a checkbox that Evernote can interpret. For example, this Markdown:

[<img class="alignnone size-full wp-image-111" src="{{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-21-at-9.44.14-PM.png" alt="ENML Markdown Checkbox" width="177" height="83" />][3]

&#8230;produces this Evernote note:

[<img class="alignnone size-full wp-image-112" src="{{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-21-at-9.44.55-PM.png" alt="Correct Checkbox Import" width="551" height="427" />][4]

## The Long Version (in case you&#8217;re curious)

I dug into the action a bit and found this line of Ruby:

{% highlight ruby %}
osa_cmd = "tell application #{quote 'Evernote'} to create note with html #{quote escape contents}"
{% endhighlight %}

Noticing the reference to <span style="font-size: 13px; line-height: normal; font-family: Courier;">html</span>, I figured that sending the HTML equivalent of an Evernote checkbox:
[<img class="alignnone size-full wp-image-102" src="{{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-21-at-9.21.43-PM.png" alt="Markdown Note with HTML Checkbox" width="803" height="79" />][5]

<p class="brush:xml">
  &#8230;would suffice.
</p>

[<img class="alignnone size-full wp-image-104" src="{{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-21-at-9.23.41-PM.png" alt="Markdown in Evernote 2" width="551" height="427" />][6]

Well shucks – that&#8217;s not helpful.

I dug further into in the Evernote Applescript Dictionary and found that in addition to an <code>HTML Content</code> property, each Evernote note has an <code>ENML Content</code> property:

> **ENML content** (text, r/o) : The note&#8217;s content in ENML representation.

*What in the world is ENML?*, I thought. More digging led to <a href="http://dev.evernote.com/doc/articles/enml.php" target="_blank">this definition on the Evernote Developer Portal</a>:

> ENML is the markup language used by Evernote to represent the content of notes. Because ENML is a superset of XHTML, it&#8217;s easy to present rich content in Evernote notes.

More playing with Applescript revealed the ENML definition of a checkbox (which, thank goodness, is much simpler):

<code>&lt;en-todo/&gt;</code>

Bingo. All that remained was to change the reference to HTML in the Ruby script (line 110, to be exact) to reference ENML:

{% highlight ruby %}
wsa_cmd = "tell application #{quote 'Evernote'} to create note with enml #{quote escape contents}"
{% endhighlight %}

## Final Thoughts

Obviously, typing out `<en-todo/>`&nbsp;all the time is a hassle. I recommend using a good text expander – such as my personal favorite, <a href="http://www.trankynam.com/atext/" target="_blank">aText</a> – to speed up the process. In my case, any time I type **,ent** (for **E**ver**n**ote **T**odo), I get my magic ENML.

In the long run, we&#8217;ll see if this method of taking quick text notes remains a part of my toolkit. For now, I&#8217;ll chalk this up to an enjoyable exercise – one that hopefully provides value to others!

 [1]: {{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-21-at-9.09.17-PM.png
 [2]: {{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-21-at-9.10.44-PM.png
 [3]: {{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-21-at-9.44.14-PM.png
 [4]: {{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-21-at-9.44.55-PM.png
 [5]: {{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-21-at-9.21.43-PM.png
 [6]: {{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-21-at-9.23.41-PM.png
