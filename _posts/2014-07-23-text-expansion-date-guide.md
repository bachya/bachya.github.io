---
title: 'Text Expansion: My Up-to-Date Guide'
author: Aaron
layout: post
permalink: /text-expansion-date-guide/
ptadn_textarea:
  - 'New Blog Post: {title} {link}'
ptadn_disable_post:
  - 0
dsq_thread_id:
  - 2868272511
categories:
  - Productivity
  - Tech
tags:
  - atext
  - osx
  - textexpander
  - textexpander touch
---
<a title="Sync aText and TextExpander Touch with ExpandSync" href="http://www.bachyaproductions.com/sync-atext-textexpander-touch-expandsync/" target="_blank">I've written before about the power of text expansion</a>. Although it took me a long time to really get into the swing of typing snippets instead of full-blown words/sentences/etc., the cost has been well worth the result.

While listening to <a title="Mac Power Users 203: TextExpander" href="http://www.macpowerusers.com/2014/07/14/mac-power-users-203-textexpander/" target="_blank">a text expansion-laden episode of Mac Power Users</a> the other day, I realized that I have a lot of snippets I've collected; it's high time that I shared these out in a way consistent with my <a title="URL Actions for iOS: My Up-to-Date Guide" href="http://www.bachyaproductions.com/ios-url-actions-the-up-to-date-guide/" target="_blank">iOS url scheme guide</a>.

The primary thing to note: all of my snippets are from <a title="aText" href="http://www.trankynam.com/atext/support.html" target="_blank">aText</a>; as such, I offer download links that are compatible with aText. I imagine that the basic concepts relate equally well to <a title="TextExpander" href="http://smilesoftware.com/TextExpander/" target="_blank">TextExpander</a>, etc., but your mileage may vary.

<!--more-->

## Communication

<a href="/assets/2014/07/Communication.atext">Download</a>

These snippets are used to automate common phrases, statements, etc. that I use in emails, instant messages, etc.

**Abbreviation Prefix:** `,`

**Application Scope:** All Applications

**Expand:** Immediately

**Snippets:**

  * `,lmk` – expands into `Let me know if you have any questions.`
  * `,tkvm` – expands into `Thank you very much!`
  * `,igb` – expands into `I'll get back to you shortly.`
  * `,?` – expands into `I'm not sure what you're asking – could you give me some more detail?`

## Date/Time

<a href="/assets/2014/07/DateTime.atext">Download</a>

These snippets allow me to quickly enter commonly used dates and times, as well as some of their individual components

**Abbreviation Prefix:** `,`

**Application Scope:** All Applications

**Expand:** At delimiter (discard delimiter) (I ilke to stick with the same delimiter, so I use a `,`.)

**Snippets:**

  * `,d,` – expands into the current date in yyyy-MM-dd format
  * `,dd1,` – expands into `Monday`
  * `,dd2,` – expands into `Tuesday`
  * `,dd3,` – expands into `Wednesday`
  * `,dd4,` – expands into `Thursday`
  * `,dd5,` – expands into `Friday`
  * `,dd6,` – expands into `Saturday`
  * `,dd7,` – expands into `Sunday`
  * `,dm1,` – expands into `January`
  * `,dm2,` – expands into `February`
  * `,dm3,` – expands into `March`
  * `,dm4,` – expands into `April`
  * `,dm5,` – expands into `May`
  * `,dm6,` – expands into `June`
  * `,dm7,` – expands into `July`
  * `,dm8,` – expands into `August`
  * `,dm9,` – expands into `September`
  * `,dm10,` – expands into `October`
  * `,dm11,` – expands into `November`
  * `,dm12,` – expands into `December`
  * `,dnm,` – expands into next Monday's date (e.g., on 7/23/2014, `7/28/14`)
  * `,dnw,` – expands into next Wednesday's date (e.g., on 7/23/2014, `7/30/14`)
  * `,dnf,` – expands into next Friday's date (e.g., on 7/23/2014, `7/25/14`)
  * `,dns,` – expands into next Saturday's date (e.g., on 7/23/2014, `7/26/14`)

## Markdown

<a href="/assets/2014/07/Markdown.atext">Download</a>

These snippets allow me to quickly hammer out Markdown syntax (which can sometimes be a bear to type out manually).

Note that many of these snippets make use of a couple of special aText symbols:

  * `【|】` – this is aText's cursor token. By placing this in a snippet, the cursor is automatically placed in the desired place after expansion occurs.
  * `【clipboard】` – this is aText's clipboard token. The contents of the clipboard are automatically placed here during expansion.

**Abbreviation Prefix:** `,`

**Application Scope:** All Applications

**Expand:** Immediately

**Snippets:**

  * `,mh1` – expands into `# 【|】 #`
  * `,mh2` – expands into `## 【|】 ##`
  * `,mh3` – expands into `### 【|】 ###`
  * `,mref` – expands into `[【|】]: 【clipboard】`
  * `,mfn ` – expands into `[^【|】]: `
  * `,me ` – expands into `*【|】*`
  * `,mb ` – expands into `**【|】**`
  * `,mimg ` – expands into `!\[【|】\](【clipboard】)`

### Specialty Snippets

These snippets – borrowed and adapted from <a title="Quicker Markdown linking with TextExpander" href="http://www.leancrew.com/all-this/2014/07/quicker-markdown-linking-with-textexpander/" target="_blank">a post by Dr. Drang</a> – create Markdown links from the current tab/window of the three primary browsers that I use: Firefox, Chrome, and Safari. They come in two forms: dynamic (where the text of the link is grabbed from the title of the browser window/tab) and static (where you are prompted to enter the text).

#### Markdown Links from Firefox

`,ffdml` – Creates a dynamic (i.e., title included) Markdown link from the active window/tab in Firefox:

{% gist 59fbf1a6170cf4bde4e1 %}

`,ffsml` – Creates a static (i.e., no title included) Markdown link from the active window/tab in Firefox:

{% gist bfcfa57e641f74402c28 %}

#### Markdown Links from Chrome

`,chdml` – Creates a dynamic (i.e., title included) Markdown link from the active window/tab in Chrome:

{% gist 0d0051b3946ae5cdd6db %}

`,chsml` – Creates a static (i.e., no title included) Markdown link from the active window/tab in Chrome:

{% gist 1f1f8c7329f9a0002cd5 %}

#### Markdown Links from Safari

`,sdml` – Creates a dynamic (i.e., title included) Markdown link from the active window/tab in Safari:

{% gist ef93d306c5f6221d2c01 %}

`,ssml` – Creates a static (i.e., no title included) Markdown link from the active window/tab in Safari:

{% gist ef93d306c5f6221d2c01 %}

## Note Taking

  <a href="/assets/2014/07/NoteTaking.atext">Download</a>

These snippets allow me to add oft-used elements to my note-taking experiences in <a title="nvALT" href="http://brettterpstra.com/projects/nvalt/" target="_blank">nvALT</a>.

**Abbreviation Prefix:** `,`

**Application Scope:** nvALT

**Expand:** Immediately

**Snippets:**

  * `,c` – expands into `[ x ] `
  * `,t` – expands into `**Todos:**`
  * `,att` – expands into `**Attendees:**`

## Tasks

<a href="/assets/2014/07/Tasks.atext">Download</a>

These snippets allow me to add oft-used elements to OmniFocus.

**Abbreviation Prefix:** `,`

**Application Scope:** OmniFocus

**Expand:** Immediately

**Snippets:**

  * `,rte` – expands into `Respond to Email: `
  * `,cho` – expands into `Check out `
