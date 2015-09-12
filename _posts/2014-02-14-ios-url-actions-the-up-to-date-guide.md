---
title: 'URL Actions for iOS: My Up-to-Date Guide'
author: Aaron
layout: post
permalink: /ios-url-actions-the-up-to-date-guide/
dsq_thread_id:
  - 2300276420
categories:
  - Tech
tags:
  - buffer
  - dolphin
  - drafts
  - editorial
  - ifttt
  - instapaper
  - launch-center-pro
  - omnifocus
  - pinboard
  - pushbullet
  - toodledo
  - waze
  - wemo
  - write
  - x-callback-url
---
There&#8217;s one area (in my opinion) where Android clearly beats the pants off of iOS: application sharing (that is, an app&#8217;s ability to share data/status/etc. with other apps).

Unfortunately, iOS plays in a rather locked down playground; sharing between apps is limited to a set of strictly defined behaviors. This is rarely ideal.

Long ago, developers began to poke holes in this strict environment. By exploiting the fact that an app can have it&#8217;s own <a title="Implementing Custom URL Schemes" href="https://developer.apple.com/library/ios/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/AdvancedAppTricks/AdvancedAppTricks.html#//apple_ref/doc/uid/TP40007072-CH7-SW18" target="_blank">URL scheme</a>, it became possible to pass data back and forth between apps. The development of the <a href="http://x-callback-url.com/" target="_blank">x-callback-url standard</a> only added to the toolkit, allowing developers to define what should happen when a URL scheme request succeeds, fails, or is canceled.

I&#8217;ve come up with several uses of URL actions that improve my workflow on iOS. Instead of constantly publishing new posts about them, I&#8217;m going to keep adding to this one. Note that in general, I don&#8217;t include *every* workflow I&#8217;ve come up with; there are many that are straightforward and contain no blinding insight of my own. Rather, I include the ones that might be a bit more uncommon and not so out-of-the-box.

<!--more-->

## [Mobile Bookmarklets][1]

  * [Append Current URL to Evernote Note (via Drafts)][2]
  * [Send Current URL to Buffer][3]
  * [Send Current URL to Drafts][4]
  * [Send Current URL to Instapaper][5]
  * [Send Current URL to MacBook][6]
  * [Send Current URL to OmniFocus][7]
  * [Send Current URL to Pinboard (via Pinner)][8]
  * [Send Current URL to Pushbullet][9]
  * [Send Current URL to Readability][10]
  * [Send Current URL to Toodledo (via Drafts)][11]
  * [Shorten URL (via Short Menu)][12]

## [Drafts URL Actions][13]

  * [Send to MacBook][15]
  * [Send to Write][15]

## [Launch Center Pro Actions][16]

  * [Add to Markdown List in Dropbox][17]
  * [Add to Trello Grocery List][18]
  * [Copy GIF to Clipboard or Message][19]
  * [Delayed Communication][20]
  * [Drive to Location in Waze][21]
  * [Fenced Event (Actual Events)][22]
  * [Fenced Event (Reminder)][23]
  * [Find Pinboard Pins by Tag][24]
  * [Generic Search][25]
  * [Mega Maps][26]
  * [Multiple New Tasks in OmniFocus][27]
  * [New Task in OmniFocus][28]
  * [New Task in OmniFocus (via URL)][29]
  * [Send Clipboard to Editorial][30]
  * [Send Clipboard to Pushbullet][31]
  * [Smarter Tweetbot User Search][32]
  * [Toggle WeMo Switch][33]
  * [URL Encode/Decode Text][34]
  * [Work with Scanned Text][35]

# <a name="mobile-bookmarks"></a>Mobile Bookmarklets

Each URL action below is a bookmark stored within my mobile browser. Simply paste this text into your bookmark URL and you&#8217;re good to go. Note that in order to use these actions, you must have the &#8220;destination&#8221; apps installed on your device. Also note that my URL schemes assume Safari is your browser; it should be fairly trivial to change them to accommodate Dolphin, Chrome, etc.

## <a name="bookmark-append-to-evernote"></a>Append Current URL to Evernote Note (via Drafts)

Makes use of a Drafts action called &#8220;Add to Evernote Note&#8221;, which uses Drafts to append to an Evernote note.

**Required Apps:** Browser, <a href="http://agiletortoise.com/drafts" target="_blank">Drafts</a>

<code>javascript:window.location=&#8217;drafts://x-callback-url/create?text=&#8217; + encodeURIComponent(window.location) + &#8216;&action=Add%20to%20Evernote%20Note&#8217; + &#8216;&x-success=http://&#8217; + encodeURIComponent(window.location) + &#8216;&x-error=http://&#8217; + encodeURIComponent(window.location)</code>

* * *

## <a name="bookmark-buffer"></a>Send Current URL to Buffer

Sends the current URL to Buffer.

**Required Apps:** Browser, <a href="http://bufferapp.com" target="_blank">Buffer</a>

<code>javascript:window.location=&#8217;bufferapp://?t=&#8217; + document.title + &#8216; &#8216; + encodeURIComponent(window.location) + &#8216; | &#8216;</code>

* * *

## <a name="bookmark-drafts"></a>Send Current URL to Drafts

Sends the current URL to Drafts (in the form of the URL&#8217;s title, a newline, and the URL itself).

**Required Apps:** Browser, <a href="http://agiletortoise.com/drafts/" target="_blank">Drafts</a>

<code>javascript:window.location=&#8217;drafts://x-callback-url/create?text=&#8217; + encodeURIComponent(document.title) + &#8216;%0A&#8217; + encodeURIComponent(window.location)</code>

* * *

## <a name="bookmark-instapaper"></a>Send Current URL to Instapaper

Sends the current URL to Instapaper.

**Required Apps:** Browser, <a href="http://instapaper.com" target="_blank">Instapaper</a>

<code>javascript:window.location=&#8217;x-callback-instapaper://x-callback-url/add?url=&#8217; + encodeURIComponent(window.location) + &#8216;&x-success=http://&#8217; + encodeURIComponent(window.location) + &#8216;&x-error=http://&#8217; + encodeURIComponent(window.location)</code>

* * *

## <a name="bookmark-command-c"></a>Send Current URL to MacBook

Sends the current URL to OS X via Command-C.

**Required Apps:** Browser, <a href="http://danilo.to/command-c" target="_blank">Command-C</a>

<code>javascript:window.location=&#8217;command-c://x-callback-url/copyText?deviceName=&text=&#8217; + encodeURIComponent(window.location) + &#8216;&x-success=http://&#8217; + encodeURIComponent(window.location) + &#8216;&x-error=http://&#8217; + encodeURIComponent(window.location)</code>

* * *

## <a name="bookmark-omnifocus"></a>Send Current URL to OmniFocus

Sends the current URL to OmniFocus (with the document title acting as the task title and the URL as the task note).

**Required Apps:** Browser, <a href="https://www.omnigroup.com/omnifocus/" target="_blank">Omnifocus</a>

<code>javascript:window.location=&#8217;omnifocus:///add?name=URL: &#8216; + encodeURIComponent(document.title) + &#8216;¬e=&#8217; + encodeURIComponent(window.location)</code>

* * *

## <a name="bookmark-pinboard-pinner"></a>Send Current URL to Pinboard (via Pinner)

Sends the current URL to Pinboard via Pinner.

**Required Apps:** Browser, <a title="Pinner" href="http://pinnerapp.net/" target="_blank">Pinner</a>

<code>javascript:window.location=&#8217;pinner://x-callback-url/bookmark?href=&#8217; + encodeURIComponent(window.location) + &#8216;&title=&#8217; + encodeURIComponent(document.title) + &#8216;&x-success=http://&#8217; + encodeURIComponent(window.location)</code>

* * *

## <a name="bookmark-pinboard-pinswift"></a>Send Current URL to Pinboard (via Pinswift)

Sends the current URL to Pinboard via Pinswift.

**Required Apps:** Browser, <a title="Pinswift" href="http://pinswiftapp.com/" target="_blank">Pinswift</a>

<code>javascript:window.location=&#8217;pinswift://x-callback-url/add?url=&#8217; + encodeURIComponent(window.location) + &#8216;&x-success=http://&#8217; + encodeURIComponent(window.location) + &#8216;&x-cancel=http://&#8217; + encodeURIComponent(window.location)</code>

* * *

## <a name="bookmark-pushbullet"></a>Send Current URL to Pushbullet

Sends the current URL to Pushbullet as a link.

**Required Apps:** Browser, <a title="Pushbullet" href="https://www.pushbullet.com" target="_blank">Pushbullet</a>

<code>javascript:window.location=&#8217;pushbullet://compose?type=link&title=&#8217; + encodeURIComponent(document.title) + &#8216;&url=&#8217; + encodeURIComponent(window.location)</code>

* * *

## <a name="bookmark-readability"></a>Send Current URL to Readability

Adds the current URL to Readability.

**Required Apps:** Browser, <a title="Readability" href="https://www.readability.com/" target="_blank">Readability</a>

<code>javascript:window.location=&#8217;readability://add/&#8217; + window.location</code>

* * *

## <a name="bookmark-toodledo"></a>Send Current URL to Toodledo (via Drafts)

Makes use of a Drafts action called &#8220;List in Reminders&#8221; (which, as the name suggests, adds your URL as a new Reminder). Given that I have Reminder Syncing enabled, this adds my URL to Reminders and opens the Toodledo app for a nice, quick sync.

**Required Apps:** Browser, <a href="http://agiletortoise.com/drafts" target="_blank">Drafts</a>, <a href="https://itunes.apple.com/us/app/toodledo-to-do-list/id292755387?mt=8" target="_blank">Toodledo</a>

<code>javascript:window.location=&#8217;drafts://x-callback-url/create?text=&#8217; + encodeURIComponent(window.location) + &#8216;&action=List%20in%20Reminders&x-success=toodledo://&#8217;</code>

* * *

## <a name="bookmark-shortmenu"></a>Shorten URL (via Short Menu)

Takes the current URL, shortens it (via Short Menu), then places that shortened URL on the clipboard.

**Required Apps:** Browser, <a href="http://appiculous.com/short-menu-ios/" target="_blank">Short Menu</a>

<code>javascript:window.location=&#8217;shortmenu://x-callback-url/shortenURL?longURL=&#8217; + encodeURIComponent(window.location) + &#8216;&x-success=http://&#8217; + encodeURIComponent(window.location)</code>

* * *

# <a name="drafts"></a>Drafts URL Actions

I have no words to adequately describe Drafts. It is an indispensable part of my toolkit (for, among other reasons, its ability to send text to any URL action).

## <a name="drafts-command-c"></a>Send to MacBook

<a target="_blank" href="drafts://x-callback-url/import_action?type=URL&name=Send%20to%20MacBook&url=command-c%3A%2F%2Fx-callback-url%2FcopyText%3FdeviceName%3D%26text%3D%5B%5Bdraft%5D%5D" title="Import Into Drafts">Import Into Drafts</a>

Sends the selected draft to OS X via Command-C.

**Required Apps:** <a href="http://agiletortoise.com/drafts" target="_blank">Drafts</a>, <a href="http://danilo.to/command-c" target="_blank">Command-C</a>

<code>command-c://x-callback-url/copyText?deviceName=&text=[[draft]]</code>

* * *

## <a name="drafts-write"></a>Send to Write

<a target="_blank" href="drafts://x-callback-url/import_action?type=URL&name=Send%20to%20Write&url=writeapp%3A%2F%2Fx-callback-url%2Fnote%3Ftitle%3D%5B%5Btitle%5D%5D%26content%3D%5B%5Bbody%5D%5D" title="Import Into Drafts">Import Into Drafts</a>

Sends the selected draft to Write. Uses the first line as the title of the document and the remaining lines as the body.

**Required Apps:** <a href="http://agiletortoise.com/drafts" target="_blank">Drafts</a>, <a href="http://writeapp.net/" target="_blank">Write</a>

<code>writeapp://x-callback-url/note?title=[[title]]&content[[body]]</code>

# <a name="lcp"></a>Launch Center Pro Actions

I&#8217;ve finally gotten to the point where I have a collection of Launch Center Pro actions that are worth sharing. Note that I&#8217;m not going to put *every* action I have; I&#8217;m going to withhold the ones that can be built using the default action builder in LCP. Also note that I&#8217;ve not included &#8220;Install&#8221; links for some of the more specialized ones; in those cases, it will take less effort for you to copy/paste/change than to install mine and have to rip them apart.

## <a name="lcp-markdown-list"></a>Add to Markdown List in Dropbox

<a target="_blank" href="https://launchcenterpro.com/32grjr" title="Import Into Launch Center Pro">Import Into Launch Center Pro</a>

Takes multiple lines of entered text and appends them to a Dropbox text file as Markdown list items (i.e., they get prefixed with a `*`). Simply download the action, replace the token text below with valid entries for your circumstance, and you should be good to go.

**Required Apps:** <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>, <a href="http://blackfoggames.com/TextTool/index.html" target="_blank">TextTool</a>, <a title="Dropbox" href="https://www.dropbox.com/" target="_blank">Dropbox</a>

<code>texttool://x-callback-url/transform?text=[prompt-return:Question(s)]&method=list&style=asterisk&x-success=&#123;&#123;launch://dropbox/append?text=[[output]]&path=&#123;&#123;YOUR PATH GOES HERE&#125;&#125;&name=&#123;&#123;YOUR FILENAME GOES HERE&#125;&#125;&#125;&#125;</code>

* * *

## <a name="lcp-groceries-trello"></a>Add to Trello Grocery List

Adds a provided item to one Trello list out of a predefined set. I use this to quickly add grocery items to the correct list (e.g., Apples to Safeway). Note that the easiest way to get the List ID from Trello is to take a look at the JSON of your board; you can find it in the menu on the right in Trello.

I encourage you to check out <a title="How I Manage Groceries with Trello, Launch Center Pro, Pythonista, and IFTTT" href="http://www.bachyaproductions.com/groceries-trello-launch-center-pro-pythonista-ifttt/" target="_blank">my comprehensive writeup</a> on how I use this method to manage my grocery lists.

**Required Apps:** <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>, <a href="http://trello.com/" target="_blank">Trello</a>

<code>trello://x-callback-url/createCard?shortlink=[BOARD-SHORTLINK-GOES-HERE]&name=[prompt:Item]&list-id=[list:Grocery Stores|Safeway=[SAFEWAY LIST ID|CostCo=[COSTCO LIST ID]|Target=[TARGET LIST ID]]</code>

* * *

## <a name="lcp-gif-clipboard"></a>Copy GIF to Clipboard or Message

<a target="_blank" href="http://ift.tt/W12S2d" title="Import Into Launch Center Pro">Import Into Launch Center Pro</a>

Provides two options: copy a user-chosen animated GIF (from Giphy) to the clipboard or send it in a message.

**Required Apps:** <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>

<code>[list:Options|Message GIF=http://launchmessaging?to=[contact]&attach=photo:gif|Copy GIF=launch://clipboard?attach=photo:gif]</code>

* * *

## <a name="lcp-delayed-comm-due"></a>Delayed Communication

<a target="_blank" href="http://ift.tt/1lXthmD" title="Import Into Launch Center Pro">Import Into Launch Center Pro</a>

Sends a delayed SMS/Message, email, or phone call. Sets a reminder for a later date/time and when that time arrives, provides a link to initiate the appropriate action (e.g., revise and send the email).

**Required Apps:** <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>, <a href="http://www.dueapp.com/" target="_blank">Due</a>

**Inspiration:** <a href="http://blog.jeffreykishner.com/2014/01/10/schedule-a-text-x-minutes-from-now-with-due-and-launch-center-pro.html" target="_blank">Schedule a Text x Minutes From Now with Due and Launch Center Pro</a>

<code>[list:Type|Delayed Call=due://x-callback-url/add?title=&#123;&#123;tel[contact]&#125;&#125;&minslater=[prompt-num:Minutes]|Delayed SMS=due://x-callback-url/add?title=&#123;&#123;launch://messaging?to=[contact]&body=[prompt:Message]&#125;&#125;&minslater=[prompt-num:Minutes]|Delayed Email=due://x-callback-url/add?title=&#123;&#123;launch://email?to=[contact]&subject=[prompt:Subject]&body=[prompt:Body]&#125;&#125;&minslater=[prompt-num:Minutes]]&lc-icon=due</code>

* * *

## <a name="lcp-waze"></a>Drive to Location in Waze

Automatically navigates to a predefined latitude/longitude in Waze. Simply add the coordinates to your favorite spots.

**Required Apps:** <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>, <a href="http://www.waze.com/" target="_blank">Waze</a>

<code>waze://?ll=[list:Locations|Open&#8230;|Home=00.00000,000.00000|Work=00.00000,000.00000]&navigate=yes</code>

* * *

## <a name="lcp-fenced-event-actual"></a>Fenced Event (Actual Events)

This is a more complex version of [the version below][23]. For more information, view my full post on it: <a title="True Fenced Events in Fantastical" href="http://www.bachyaproductions.com/true-fenced-events-fantastical/" target="_blank">True Fenced Events in Fantastical</a>

* * *

## <a name="lcp-fenced-event"></a>Fenced Event (Reminder)

<a target="_blank" href="https://launchcenterpro.com/s5vdv1" title="Import Into Launch Center Pro">Import Into Launch Center Pro</a>

Sometimes, I need to schedule event and schedule driving time to and from the event; this workflow reminds me to do that automatically: it creates an event in Fantastical and creates a reminder in OmniFocus (via a Drafts email action that uses a user&#8217;s Mail Drop email address) to add driving time around that event.

Notice the `!` in front of the `[clipboard]` element; this makes sure that `[clipboard]` gets resolved in this second iteration.

**Required Apps:** <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>, <a href="https://flexibits.com/fantastical-iphone" target="_blank">Fantastical</a>, <a href="http://agiletortoise.com/drafts" target="_blank">Drafts</a>, <a href="http://support.omnigroup.com/omnifocus-mail-drop" target="_blank">Mail Drop</a>

<code>launch://x-callback-url/clipboard?text=[prompt:Event]&x-success=&#123;&#123;fantastical2://x-callback-url/parse?sentence=[clipboard]&add=1&x-success=&#123;&#123;drafts://x-callback-url/create?text=&#123;&#123;Create time block around event: &#125;&#125;[!clipboard]&action=&#123;&#123;Email to OmniFocus&#125;&#125;&x-success=&#123;&#123;launch://&#125;&#125;&#125;&#125;&#125;&#125;&lc-icon=fantastical</code>

* * *

## <a name="lcp-pins-pinswift"></a>Find Pinboard Pins by Tag

<a target="_blank" href="http://ift.tt/1juwzDo" title="Import Into Launch Center Pro">Import Into Launch Center Pro</a>

Searches for pins by tag in Pinboard (via Pinswift); additionally, provides quick selection for favorite tags.

**Required Apps:** <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>, <a href="http://pinswiftapp.com/" target="_blank">Pinswift</a>

<code>pinswift:///t:[list:Tags|Search&#8230;=[prompt:Tags]|Favorite Tag 1=fav-tag-1]</code>

* * *

## <a name="lcp-generic-search"></a>Generic Search

<a target="_blank" href="http://ift.tt/1lmy29O" title="Import Into Launch Center Pro">Import Into Launch Center Pro</a>

Provides a means to search many different services from a single location.

Of particular note is the `+` in front of the prompt for Wikipanion. For some reason, using Wikipanion&#8217;s URL scheme in a list like this causes mutli-word searches to fail; the `+` forces LCP to encode the prompt one more time (as per <a title="2.3.1 Release Notes (Parsing Changes)" href="http://help.contrast.co/hc/en-us/articles/202600703-2-3-1-Release-Notes-Parsing-Changes-" target="_blank">this documentation</a>).

**Required Apps:** Browser, <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>, <a href="https://flexibits.com/fantastical-iphone" target="_blank">Fantastical</a>, <a href="http://agiletortoise.com/terminology/" target="_blank">Terminology</a>, <a href="http://www.wikipanion.net/" target="_blank">Wikipanion</a>, <a href="http://products.wolframalpha.com/iphone/" target="_blank">WolframAlpha</a>

<code>[list:Search|YouTube=http://www.youtube.com/results?q=[prompt:Query]|Fantastical=fantastical2://search?query=[prompt:Query]&scope=all|Terminology=terminology://x-callback-url/lookup?text=[prompt:Word]|Wikipedia=wikipanion:///[+prompt:Query]|WolframAlpha=wolframalpha:///?i=[prompt:Query]|Amazon=http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias=aps&field-keywords=[prompt:Query]|AlternativeTo=http://alternativeto.net/SearchResult.aspx?search=[prompt:Query]|NerdQuery=http://nerdquery.com/?media_only=0&search=1&category=-1&catid=&type=and&results=50&db=0&prefix=0&query=[prompt:Query]]</code>

* * *

## <a name="lcp-mega-maps"></a>Mega Maps

<a target="_blank" href="http://ift.tt/1p2slz6" title="Import Into Launch Center Pro">Import Into Launch Center Pro</a>

A wonderful action that allows users to search for locations or get directions (in either Apple or Google Maps).

**Required Apps:** <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>, Maps, <a href="https://itunes.apple.com/app/id585027354" target="_blank">Google Maps</a>

**Inspiration:** <a href="https://twitter.com/tahewett/status/490853838060937216" target="_blank">https://twitter.com/tahewett/status/490853838060937216</a>

<code>[list:Map App|Apple Maps=[list:Maps Actions|Search Location=http://maps.apple.com/?q=[prompt:Search Location&#8230;]|Directions=http://maps.apple.com/?daddr=[prompt:Destination]&saddr=[list:From Where&#8230;?|Current Location=|Other=[prompt:From Where&#8230;?]]]|Google Maps=[list:Google Maps Actions|Search Location=comgooglemaps://?q=[prompt:Search Location&#8230;]|Directions=comgooglemaps://?saddr=[list:From Where&#8230;?|Current Location=|Other=[prompt:From Where&#8230;?]]&daddr=[prompt:Destination]&directionsmode=[list:What kind of directions&#8230;?|Driving=driving|Walking=walking|Bicycling=bicycling|Transit=transit]]]&lc-icon=maps</code>

* * *

## <a name="lcp-multiple-tasks-omnifocus"></a>Multiple New Tasks in OmniFocus

<a target="_blank" href="http://ift.tt/X0ug0J" title="Import Into Launch Center Pro">Import Into Launch Center Pro</a>

Creates multiple new OmniFocus tasks within Launch Center Pro.

Previously, I was accomplishing this by sending multiple tasks to Drafts and using the `List in Reminders` action; this, in turn, would feed into OmniFocus&#8217; Reminders integration to add the tasks. The primary issue: it required that OmniFocus open in order to import those tasks. That caused too much friction; I like to stay (or end up) in LCP whenever possible.

Notice the use of the `+` symbol in the prompt; this forces multiple lines to be URL-encoded (as `%0A`) before being sent to Pythonista.

This action depends on <a title="MultiLineOmniFocus V2: Improved Launch Center Pro and Callback Support" href="http://n8henrie.com/2014/01/multilineomnifocus-v2-improved-launch-center-pro-and-callback-support-3/" target="_blank">a great Pythonista script written by Nathan Henrie</a>; make sure you read, understand, and set up that script before using this action.

**Required Apps:** <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>, <a href="http://support.omnigroup.com/omnifocus-mail-drop" target="_blank">Mail Drop</a>, <a title="Pythonista" href="http://omz-software.com/pythonista/" target="_blank">Pythonista</a>, <a title="Gmail" href="http://mail.google.com" target="_blank">Gmail</a>

**Inspiration:** <a title="MultiLineOmniFocus V2: Improved Launch Center Pro and Callback Support" href="http://n8henrie.com/2014/01/multilineomnifocus-v2-improved-launch-center-pro-and-callback-support-3/" target="_blank">MultiLineOmniFocus V2: Improved Launch Center Pro and Callback Support</a>

<code>pythonista://MultiLineOmniFocus?action=run&argv=[+prompt-return:Tasks]&argv=&#123;&#123;launch:&#125;&#125;#lc-icon=omnifocus</code>

* * *

## <a name="lcp-task-omnifocus"></a>New Task in OmniFocus

<a target="_blank" href="https://launchcenterpro.com/dl056k" title="Import Into Launch Center Pro">Import Into Launch Center Pro</a>

Provides a list to add three &#8220;types&#8221; of OmniFocus task:

  1. A standard task
  2. Multiple standard tasks at once
  3. A &#8220;Follow Up&#8221; task variant

Several things to note with this action:

  * Although OmniFocus on iOS comes with a URL scheme, this action doesn&#8217;t use it; in order to reduce the friction of jumping from LCP to OmniFocus – and given that OmniFocus doesn&#8217;t provide a URL scheme to return to LCP – this action uses IFTTT and OmniFocus Mail Drop.
  * The action works by using Drafts actions to send tasks into OmniFocus. For #1 and #3 above, an `Email to OmniFocus` action is used to send the task to OmniFocus via Mail Drop; for #2 above, the `List in Reminders` action is used to import each line of the draft into Reminders – naturally, this assumes that you have OmniFocus set up to import tasks from Reminders.

In both cases, the user is returned to LCP afterward.

**Required Apps:** <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>, <a href="http://support.omnigroup.com/omnifocus-mail-drop" target="_blank">Mail Drop</a>, <a href="https://www.ifttt.com" target="_blank">IFTTT</a>

**Inspiration:** <a href="http://n8henrie.com/2013/03/more-ways-to-send-tasks-to-omnifocus-with-launch-center-pro-and-drafts/" target="_blank">More Ways to Send Tasks to OmniFocus with Launch Center Pro and Drafts</a>

<code>[list:Type|Task=drafts://x-callback-url/create?text=[prompt:Title]%0A[prompt:Note]&action=&#123;&#123;Email to OmniFocus&#125;&#125;&x-success=&#123;&#123;launchpro://&#125;&#125;|Multiple Tasks=drafts://x-callback-url/create?text=[prompt-return:Tasks]&action=&#123;&#123;List in Reminders&#125;&#125;&x-success=&#123;&#123;launchpro://&#125;&#125;|Follow Up=drafts://x-callback-url/create?text=&#123;&#123;Follow up w/&#125;&#125;[prompt:Person]&#123;&#123; re: &#125;&#125;[prompt:Topic]%0A[prompt:Note]&action=&#123;&#123;Email to OmniFocus&#125;&#125;&x-success=&#123;&#123;launchpro://&#125;&#125;]&lc-icon=omnifocus</code>

* * *

## <a name="lcp-task-omnifocus-url"></a>New Task in OmniFocus (via URL)

This action creates a new OmniFocus task based on a passed URL. For more information, view my full post on it: <a title="OmniFocus Tasks from URLs on iOS" href="http://www.bachyaproductions.com/omnifocus-tasks-urls-ios/" target="_blank">OmniFocus Tasks from URLs on iOS</a>

* * *

## <a name="lcp-clipboard-editorial"></a>Send Clipboard to Editorial

<a target="_blank" href="http://ift.tt/1juLX2I" title="Import Into Launch Center Pro">Import Into Launch Center Pro</a>

Sends the text on the clipboard to a user-defined document in Editorial. Note that this version uses Dropbox as Editorial&#8217;s storage location; feel free to change that.

**Required Apps:** <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>, <a href="http://omz-software.com/editorial/" target="_blank">Editorial</a>

<code>editorial://new/[prompt:Filename]?root=&#123;&#123;dropbox&#125;&#125;&command=&#123;&#123;Paste as&#8230;&#125;&#125;</code>

* * *

## <a name="lcp-clipboard-pushbullet"></a>Send Clipboard to Pushbullet

<a target="_blank" href="http://ift.tt/1oKFlfw" title="Import Into Launch Center Pro">Import Into Launch Center Pro</a>

Sends the text on the clipboard to Pushbullet. The action provides options to send a note, a link, an address, or an image. Note that although Pushbullet has a URL scheme, this action uses IFTTT triggers for a more frictionless experience. Each of these triggers is connected to a corresponding IFTTT recipe.

**Required Apps:** <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>, <a href="https://www.ifttt.com" target="_blank">IFTTT</a>

<code>launch://ifttt/trigger?name=[list:Type|Note=Send Pushbullet Note|Link=Send Pushbullet Link|Address=Send Pushbullet Address|Image=Send Pushbullet Image]&value1=[clipboard]&lc-icon=pushbullet</code>

* * *

## <a name="lcp-wemo-ifttt"></a>Toggle WeMo Switch

<a target="_blank" href="http://ift.tt/1nixG8A" title="Import Into Launch Center Pro">Import Into Launch Center Pro</a>

Toggles a WeMo switch via an IFTTT recipe. Supremely useful, especially given that the WeMo iOS app doesn&#8217;t have a URL scheme.

**Required Apps:** <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>, <a href="https://www.ifttt.com" target="_blank">IFTTT</a>

<code>launch://ifttt/trigger?name=&#123;&#123;Toggle Dining Light&#125;&#125;&lc-icon=wemo</code>

* * *

## <a name="lcp-tweetbot-search"></a>Smarter Tweetbot User Search

<a target="_blank" href="https://launchcenterpro.com/kh4f85" title="Import Into Launch Center Pro">Import Into Launch Center Pro</a>

While traversing the web, I often run across Twitter users I want to start following. However, I have a fundamental problem: I don&#8217;t log into Twitter on Safari; I&#8217;d rather use Tweetbot.

This action assumes that I&#8217;ve copied either a Twitter username or a link to a Twitter profile (such as <a href="http://twitter.com/bachya" target="_blank">http://twitter.com/bachya</a>) to the clipboard; once in place, the action strips the username and searches for it in Tweetbot.

**Required Apps:** <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>, <a href="http://blackfoggames.com/TextTool/index.html" target="_blank">TextTool</a>, <a href="http://tapbots.com/software/tweetbot/" target="_blank">Tweetbot</a>

<code>texttool://x-callback-url/transform?text=[clipboard]&method=regex&search=&#123;&#123;https?://(.+\.)?twitter\.com/&#125;&#125;&replace=&x-success=&#123;&#123;tweetbot:///user_profile/[[output]]&#125;&#125;&lc-icon=tweetbot</code>

* * *

## <a name="lcp-url-encode"></a>URL Encode/Decode Text

<a target="_blank" href="http://ift.tt/1nbSD0b" title="Import Into Launch Center Pro">Import Into Launch Center Pro</a>

Converts user-prompted text by either URL encoding or decoding it and placing the result on the clipboard.

**Required Apps:** <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>

<code>[list:Action|URL Encode=launch://x-callback-url/clipboard?text=[prompt:Text]&x-success=&#123;&#123;launch://clipboard/convert?format=&#123;&#123;urlencode&#125;&#125;&#125;&#125;|URL Decode=launch://x-callback-url/clipboard?text=[prompt:Text]&x-success=&#123;&#123;launch://clipboard/convert?format=&#123;&#123;urldecode&#125;&#125;&#125;&#125;]</code>

## <a name="lcp-scanned-text"></a>Work with Scanned Text

<a target="_blank" href="https://launchcenterpro.com/mrffvb" title="Import Into Launch Center Pro">Import Into Launch Center Pro</a>

Opens Prizmo to scan some text; upon a successful scan, returns to LCP and prompts the user to copy the scanned text to the clipboard or send it to Pushbullet. Note that the Pushbullet route makes use of [an existing LCP action][31] (defined with an action ID of 116).

**Required Apps:** <a href="http://contrast.co/launch-center-pro/" target="_blank">Launch Center Pro</a>, <a title="Prizmo" href="http://www.creaceed.com/iprizmo" target="_blank">Prizmo</a>, <a title="Pushbullet" href="https://www.pushbullet.com/" target="_blank">Pushbullet</a>

**Inspiration:** <a title="Sharing Prizmo OCR to Drafts, Cloudier and Dropbox" href="http://philgr.com/blog/share-ocr-from-prizmo-to-drafts-cloudier-and-dropbox" target="_blank">Sharing Prizmo OCR to Drafts, Cloudier and Dropbox</a>

<code>prizmo://x-callback-url/captureText?language=en&destination=pasteboard&x-success=&#123;&#123;launch:&#125;&#125;&lc-callback=[list:Next Step?|Copy to Clipboard=launch://clipboard?text=[clipboard]|Pushbullet=[action:116]]&cancel=&#123;&#123;launch:&#125;&#125;</code>

 [1]: #mobile-bookmarks
 [2]: #bookmark-append-to-evernote
 [3]: #bookmark-buffer
 [4]: #bookmark-drafts
 [5]: #bookmark-instapaper
 [6]: #bookmark-command-c
 [7]: #bookmark-omnifocus
 [8]: #bookmark-pinboard-pinner
 [9]: #bookmark-pushbullet
 [10]: #bookmark-readability
 [11]: #bookmark-toodledo
 [12]: #bookmark-shortmenu
 [13]: #drafts
 [14]: #drafts-editorial
 [15]: #drafts-command-c
 [16]: #lcp
 [17]: #lcp-markdown-list
 [18]: #lcp-groceries-trello
 [19]: #lcp-gif-clipboard
 [20]: #lcp-delayed-comm-due
 [21]: #lcp-waze
 [22]: #lcp-fenced-event-actual
 [23]: #lcp-fenced-event
 [24]: #lcp-pins-pinswift
 [25]: #lcp-generic-search
 [26]: #lcp-mega-maps
 [27]: #lcp-multiple-tasks-omnifocus
 [28]: #lcp-task-omnifocus
 [29]: #lcp-task-omnifocus-url
 [30]: #lcp-clipboard-editorial
 [31]: #lcp-clipboard-pushbullet
 [32]: #lcp-tweetbot-search
 [33]: #lcp-wemo-ifttt
 [34]: #lcp-url-encode
 [35]: #lcp-scanned-text
