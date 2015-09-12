---
title: Specialty Filing with Hazel
author: Aaron
layout: post
permalink: /specialty-filing-hazel/
dsq_thread_id:
  - 2852144234
ptadn_textarea:
  - 'New Blog Post: {title} {link}'
ptadn_disable_post:
  - 0
categories:
  - Productivity
  - Tech
tags:
  - bash
  - hazel
  - pdf
  - zsh
---
A while back, I explained <a title="Hazel: A Productivity Nerd’s Best Friend on OS X" href="http://www.bachyaproductions.com/hazel-productivity-nerds-best-friend/" target="_blank">how I use Hazel to automatically file important statements into Evernote</a>. The strategy I use relies on statement PDFs (which are automatically downloaded from my bank, apartment complex, etc.) containing URLs that describe where they came from; with this information, Hazel can automatically figure out which of my many rules to apply.

Recently, I came across a scenario that my current setup didn&#8217;t cover: what should happen to statements that are manually saved as PDFs (and thus, don&#8217;t carry any information about the URL they were downloaded from) and have generic filenames?<!--more-->

## TL;DR

Hazel can be used to file documents, even when they don&#8217;t carry specific metadata.

## The Process

Here&#8217;s an example: when I give money to my church online, they display an HTML statement of the transaction and tell me to save a copy for my own records. Given that I&#8217;m on OS X, I usually do this by going to `File >> Print` in my browser and choosing the option to save the page as a PDF. By default, the PDF inherits the filename of the HTML page (`Receipt`) and because I manually &#8220;printed&#8221; the PDF, it doesn&#8217;t contain a URL that Hazel can latch onto.

My first thought was to make use of the church&#8217;s website URL *inside* the PDF. Hazel comes with a `Contents` condition – perhaps that could be used to scan the contents of the PDF? Alas, it didn&#8217;t seem to work.

So, I went down the route of using some sort of command-line utility to convert the PDF to text (which I could scan easily); I eventually came to the following strategy, which works nicely.

## Step #1. Download Poppler

Assuming you are using <a title="Homebrew" href="http://brew.sh/" target="_blank">Homebrew</a>, this is trivial:

{% highlight Bash %}
$ brew install poppler
{% endhighlight %}

Alternatively, you can download the release itself from the <a title="Poppler" href="http://poppler.freedesktop.org/" target="_blank">Poppler website</a>.

Poppler is a "PDF rendering library based on the xpdf-3.0 code base." Of particular interest in this scenario is its inclusion of the `pdftotext` command-line tool.

## Step #2. Test a Sample PDF

It&#8217;s a good idea to make sure that Poppler is functioning correctly on your system. Open Terminal and navigate to a directory with a PDF that you want to scan; once there, run this command:

{% highlight Bash %}
$ pdftotext /path/to/test.pdf - | grep "text to search for"
{% endhighlight %}

(Obviously, make sure you replace `/path/to/test.pdf` and `text to search for` with values that actually make sense.)

This command performs two functions:

  1. Uses `pdftotext` to convert a PDF into text and send its output to Terminal&#8217;s standard output, or STDOUT (as denoted by the `-` at the end of the command).
  2. Uses `grep` to search for specific text within the overall output text.

Assuming it works (and assuming the PDF has the text you are searching for), you should see the relevant text appear in the terminal.

## Step #3. Create the Hazel Rule

Assuming everything has gone well thus far, it&#8217;s time to create the Hazel rule itself. Mine looks like this:

[<img class="alignleft size-full wp-image-1591" src="{{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-17-at-9.25.19-AM.png" alt="Hazel Rule Using pdftotext" width="681" height="527" />][1]

&nbsp;

The rule makes use of two conditions:

  1. `Passes shell script`. This condition has the shell script from step #2 above. Assuming the PDF has the text that is being searched for, this condition will pass.
  2. `Extension`. This condition ensures that we are only scanning PDFs.

Upon finding a PDF that fits the necessary criteria, the same 3 actions as described in <a title="Hazel: A Productivity Nerd’s Best Friend on OS X" href="http://www.bachyaproductions.com/hazel-productivity-nerds-best-friend/" target="_blank">my earlier guide</a> are used:

  1. `Rename`. This action renames the file to one that meets my preferences: \`YYYY-MM-DD &#8211; (Name of the Entity) &#8211; (Name of the Document)\`. Note that other than the date, everything else is hardcoded.
  2. `Run Applescript`. Runs an Applescript that saves the PDF into Evernote.
  3. `Move`. This action deletes the original PDF from my filesystem.

In case you need it once more, here&#8217;s the Applescript that I use to save the PDF into Evernote:

{% gist 4f861098e52f95cbee22 %}

Overall, this is working wonderfully so far. I may consider adding some extra conditions to make sure that skipped PDFs aren&#8217;t matched by Hazel over and over, but for now, I&#8217;m in business.

 [1]: {{ site.baseurl }}/assets/2014/07/Screen-Shot-2014-07-17-at-9.25.19-AM.png
