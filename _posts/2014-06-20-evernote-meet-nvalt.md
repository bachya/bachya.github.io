---
title: Evernote, Meet nvALT
author: Aaron
layout: post
permalink: /evernote-meet-nvalt/
dsq_thread_id:
  - 2776882672
ptadn_textarea:
  - 'New Blog Post: {title} {link}'
ptadn_disable_post:
  - 0
categories:
  - Productivity
  - Tech
tags:
  - evernote
  - gtd
  - hazel
  - html
  - ios
  - markdown
  - marked
  - nvalt
  - omnifocus
  - osx
  - write
---
I have a confession to make: my love of Evernote is not ironclad. It&#8217;s wonderful in many ways, no doubt, but lately, it seems like too much for simple note taking. In my ideal world, Evernote would continue to be my archival tool and would be joined by a lightning fast, multi-platform text editing experience.

I stewed on this for a long time. Truth be told, I felt like I was betraying Evernote by even considering the idea. [I&#8217;ve put a huge chunk of my life into Evernote][3]. Sacrilege doesn&#8217;t begin to cover it, right?

But I thought about it. *Really* thought about it. And I began to realize that steadfast loyalty to any one product is probably not a good idea. So, I started to consider what I truly use Evernote for.<!--more-->

## TL;DR

After many years of loyalty to Evernote, nvALT is making a strong case as a replacement.

## The Separation of Concerns

Evernote is great as an archival tool. I use it to keep a digital filing cabinet of everything I might want down the road (e.g., [I use it to make sure I have archived copies of my blog posts][4]).

As a pure text editor/note taker, Evernote isn&#8217;t so great. It&#8217;s rich-text-based WYSIWYG editor is a tad clunky (and has remained largely the same over time). The HTML rendering at its core remains completely rigid and discourages true control over a note&#8217;s content. Most frustrating of all, even after many iterations, the workflow of &#8220;Open up Evernote to start taking notes&#8221; takes *way* too long on nearly every platform.

Productivity matters to me, and those wasted seconds – spent waiting for Evernote to get its act together before I can start working in it – became too frustrating to bear. And so, the search began for a companion to Evernote. I had clear criteria for success; this editor:

  * needed to excel at quick, effortless note taking.
  * needed to have [MultiMarkdown][5] support.
  * needed to be able to store its notes as plain text (so apps like [Hazel][6] could become available).
  * needed to have a companion workflow on iOS.
  * needed to be able to quickly send notes to Evernote for archival.

If a tool could fulfill these points, I would allow it into my heretofore-Evernote-dominated life.

## nvALT

I quickly came across [Brett Terpstra's][7] [nvALT][8], a fork of the [Notational Velocity][9] text-based note editor that provides &#8220;some additional features and interface modifications, including MultiMarkdown functionality.&#8221;

nvALT wasn&#8217;t a new name to me; I&#8217;d heard it before. I&#8217;d seen the [numerous][10] [stories][11] of how beloved nvALT was. Frankly, I didn&#8217;t get it. But in a new world – one in which Evernote couldn&#8217;t reign supreme as my text editor – I finally took notice of it.

I decided to take the plunge.

### Criteria #1: Quick, Effortless Note Taking

![nvALT Main Screen][12]

When it comes to quick note taking, nvALT works well. Creating and editing text is a frictionless experience. The experience is made even better by a robust set of key combinations that makes the mouse irrelevant.

That very little needs to be said about nvALT&#8217;s text editing says everything you need to know.

### Criteria #2: MultiMarkdown Support

nvALT&#8217;s exists because, among other reasons, Notational Velocity *didn&#8217;t* support MultiMarkdown (or Markdown itself, for that matter). nvALT comes with a built-in instance of MultiMarkdown (version 3 as of this writing), but users can override that with their own implementation if desired.

### Criteria #3: Text-based Storage

![nvALT's Text-based Storage Options][13]

Among other storage options, nvALT allows users to store its notes as single text files. Easy and simple.

### Criteria #4: iOS Workflow

Because nvALT can store its notes in text files anywhere on the OS X filesystem (including places like Dropbox), it is automatically compatible with many iOS text editors.

My favorite is [Editorial][14] because integration with nvALT is so simple. More on that in a moment.

### Criteria #5: Easy Export to Evernote

nvALT can export HTML and Evernote can ingest HTML. Simple!

## The Workflow

With nvALT having passed my criteria, I&#8217;ve developed a workflow that, I think, works well. It&#8217;s simple, effective, with me everywhere I go, and makes me happy.

Allow me to share the details. A quick note: I&#8217;m only a week or so into this workflow. It&#8217;s entirely possible that I will need to revise it (perhaps heavily) down the road. It&#8217;s not the biggest deal, but it&#8217;s worth mentioning.

### Marked 2

nvALT comes with a preview mechanism, but it&#8217;s not great; it has no live updating, can&#8217;t suggest alternate words, or do many other advanced-yet-still-necessary activities.

![nvALT Preview Window][15]

To overcome this, I turn to another Brett Terpstra app: [Marked][16]. In Brett&#8217;s own words:

> Marked is a previewer for Markdown files. Use it with your favorite text editor and it updates every time you save. With robust features for previewing, reviewing and exporting beautiful documents, you can work in plain text while reveling in rich formatting.

Marked runs right along nvALT, allowing for so many great features:

  * Live preview of the note I&#8217;m working on
  * Readability statistics
  * Keyword marking
  * Support for multiple editors (so, if I want to use, say, MacVim with Marked, I can)
  * Much, much more

![Running nvALT with Marked][17]

Together, nvALT and Marked make up my primary note-taking experience on OS X.

### Cross-Platform

As I alluded to before, I use Editorial as my iOS companion to nvALT. I&#8217;ve configured both apps to store their data in the same Dropbox folder (`/Apps/Editorial`, for what it&#8217;s worth). This means that notes developed on one end seamlessly appear on the other.<sup id="fnref-1445-1"><a href="#fn-1445-1" rel="footnote">1</a></sup>

![nvALT Songs on Editorial][18] ![Note List on nvALT][19]

This is a simple thing, but it ends up being worth everything. If I&#8217;m on the go, I have access to my entire note database; conversely, anything I do on the go will be waiting for me when I get back.

### Export to Evernote

When the time comes to archive a note, Evernote is the place. Unfortunately, Evernote doesn&#8217;t support Markdown, so a straight copy and paste is out.<sup id="fnref-1445-2"><a href="#fn-1445-2" rel="footnote">2</a></sup> Lucky for me, Evernote *does* support the ability to import HTML into a note (in a rather roundabout way).

[I&#8217;ve written about Hazel before][20]. Given that my nvALT structure is based on text files, Hazel is an obvious addition to the workflow. In particular, I&#8217;m a fan of a rule set that automatically imports any files in a specific folder into Evernote:

!["Save To Evernote" Hazel Workflow][21]

The magic that makes this rule set work is an Applescript that imports file contents into Evernote:

{% gist 4f861098e52f95cbee22 %}

Here&#8217;s the best part: when an HTML file is imported into Evernote via this method, its contents are literally pasted into a note. So, using Marked to export an HTML version of the note allows Evernote to read and render it natively:

![Evernote-Imported Note][22]

### Tracking Todo Items

Long ago, I decided that I needed the ability to quickly create todos in my notes and have them synced to my task management system<sup id="fnref-1445-3"><a href="#fn-1445-3" rel="footnote">3</a></sup>. [I figured out a way to do that through Evernote][23], but obviously, it became necessary to apply that principle to nvALT.

My first step was to create an [aText][24] text snippet that denotes a todo. I chose the combination `,c`, which outputs `[ x ]` in my note. This gives me the ability for quick todo entry:

![Todos in nvALT][25]

Once I am ready, I make sure to prefix my note title with `@@`. Hazel then comes into play with a rule set that proactively monitors text files in `~/Dropbox/Apps/Write` prefixed with that `@@`:

![nvALT Todo Rule Set in Hazel][26]

As you can see, every text file that:

  * is prefixed with `@@`
  * contains `[ x ]`
  * hasn&#8217;t been edited in the last 5 minutes (important: this ensures that scanning isn&#8217;t attempted until I&#8217;m done writing)

&#8230;is processed by an Applescript that imports each `[ x ]` into my task manager:

{% gist 8346af91723446b8f24b %}

&#8230;and a Bash script<sup id="fnref-1445-4"><a href="#fn-1445-4" rel="footnote">4</a></sup> that (a) changes all instances of `[ x ]` to `[ ✓ ]` and (b) removes `@@` from the title of the text file (so that it&#8217;s no longer actively processed):

{% highlight Bash %}
sed -i " 's/\[\ x\ \]/\[\ ✓\ \]/g' $1
mv $1 ${1/@@/}
{% endhighlight %}

When all is said and done, my todos get entered into my todo system and my note changes to look like this:

![Processed Todos in nvALT][27]

With the file renamed, my Hazel rule will refrain from processing it (unless, of course, I add the `@@` prefix to the title once again).

## Onward

I&#8217;m really digging nvALT, Write, and Marked. They address the areas where Evernote is lacking without eliminating Evernote&#8217;s strong archival abilities. Moreover, my productivity (at least, thus far) has increased. That&#8217;s always a win.

**UPDATE (June 20, 2014):** *I had previously chosen [Write][1] as my iOS text-based note taking app. Since that time, I&#8217;ve switched to the more powerful [Editorial][2]. Just wanted you to be aware.*

----

<ol>
<li id="fn-1445-1">
  I know Notes on OS X and iOS does the same thing, but it&#8217;s not nearly as extensible as the nvALT/Write combination.&#160;<a href="#fnref-1445-1" rev="footnote">&#8617;</a>
</li>
<li id="fn-1445-2">
  Plus, who copies and pastes anymore?&#160;<a href="#fnref-1445-2" rev="footnote">&#8617;</a>
</li>
<li id="fn-1445-3">
  The astute reader will notice that despite <a href="http://www.bachyaproductions.com/tag/toodledo/" title="Toodledo Posts on Bachya Productions">my many posts on Toodledo</a>, I&#8217;ve experimented with Omnifocus. More on that in a future post.&#160;<a href="#fnref-1445-3" rev="footnote">&#8617;</a>
</li>
<li id="fn-1445-4">
I probably could do all of this in a single Applescript, but frankly, I&#8217;m tired of struggling with this supposedly &#8220;easy&#8221; language. As I see it, use the tools that allow you to get the job done!&#160;<a href="#fnref-1445-4" rev="footnote">&#8617;</a></li>
</ol>

[1]: http://writeapp.net/
[2]: http://omz-software.com/editorial/
[3]: http://wp.me/p4hQ7V-ah "Productivity, Part 3: Material Archiving"
[4]: http://wp.me/p4hQ7V-kA "Using vim and Evernote for Blogging Bliss"
[5]: http://fletcherpenney.net/multimarkdown/ "MultiMarkdown"
[6]: http://www.noodlesoft.com/ "Hazel"
[7]: brettterpstra.com
[8]: http://brettterpstra.com/projects/nvalt/ "nvALT"
[9]: http://notational.net/ "Notational Veloctiy"
[10]: http://bettermess.com/plain-text-primer-nvalt-101/ "Plain Text Primer: nvALT 101"
[11]: http://www.cutemachine.com/writing-2/publishing-workflow-with-nvalt-and-multimarkdown/ "Publishing Workflow with nvALT and MultiMarkdown"
[12]: {{ site.baseurl }}/assets/2014/06/Screen-Shot-2014-06-18-at-7.24.41-PM.png
[13]: {{ site.baseurl }}/assets/2014/06/Screen-Shot-2014-06-18-at-7.42.30-PM.png
[14]: http://omz-software.com/editorial/ "Editorial"
[15]: {{ site.baseurl }}/assets/2014/06/Screen-Shot-2014-06-18-at-8.17.33-PM.png
[16]: http://marked2app.com/ "Marked 2"
[17]: {{ site.baseurl }}/assets/2014/06/Screen-Shot-2014-06-18-at-8.23.23-PM.png
[18]: {{ site.baseurl }}/assets/2014/06/2014-06-18-20.33.18.png
[19]: {{ site.baseurl }}/assets/2014/06/Screen_Shot_2014-06-18_at_8_34_23_PM.png
[20]: http://www.bachyaproductions.com/hazel-productivity-nerds-best-friend/ "Hazel: A Productivity Nerd’s Best Friend on OS X"
[21]: {{ site.baseurl }}/assets/2014/06/Screen-Shot-2014-06-18-at-8.57.42-PM.png
[22]: {{ site.baseurl }}/assets/2014/06/Screen-Shot-2014-06-18-at-9.02.10-PM.png
[23]: http://www.bachyaproductions.com/toodledo-tasks-via-evernote-checkboxes/ "Toodledo Tasks via Evernote Checkboxes (v.1)"
[24]: http://www.trankynam.com/atext/ "aText"
[25]: {{ site.baseurl }}/assets/2014/06/Screen-Shot-2014-06-19-at-10.31.01-PM.png
[26]: {{ site.baseurl }}/assets/2014/06/Screen-Shot-2014-06-19-at-10.35.46-PM.png
[27]: {{ site.baseurl }}/assets/2014/06/nvALT.png
