---
title: 'Sifttter Redux Update: New Markdown Support'
author: Aaron
layout: post
permalink: /sifttter-redux-update-new-markdown-support/
dsq_thread_id:
  - 2629325853
categories:
  - Tech
tags:
  - cli
  - github
  - osx
  - sifttter redux
---
The original Sifttter&nbsp;allows only for bulleted list items. Tonight, I pushed an update to Sifttter Redux that allows for any level of Markdown to exist in a journal entry.

<a target="_blank" href="https://github.com/bachya/Sifttter-Redux" >Open on Github</a>

Whereas Sifttter focuses on entries that look like this:

`- April 21, 2014 at 8:33 PM - My entry goes here@done`

...Sifttter Redux now looks for entries that look like this:

{% highlight ERB %}
@begin
@date April 21, 2014 at 8:34 PM
**Any** type of *Markdown* can exist _here_.
@end
{% endhighlight %}

This allows your Sifttter data to contain more complex entries, such as tables, images, or anything else that you might direct IFTTT to produce.

To update your installation:

{% highlight Bash %}
$ gem update sifttter-redux
{% endhighlight %}

Finally,&nbsp;Sifttter Redux also&nbsp;includes a command that attempts to update your Sifttter files to the new format:

{% highlight Bash %}
$ srd upgrade
{% endhighlight %}

**Please make sure you back up your Sifttter files before running this command; although it, too, makes a backup, I don&#8217;t want your data to accidentally be hurt.**

Let me know if you have any questions!
