---
title: Scheduled Backups With DD-WRT and Windows 7
author: Aaron
layout: post
permalink: /scheduled-backups-dd-wrt-windows-7/
dsq_thread_id:
  - 2296729771
categories:
  - Tech
tags:
  - cron
  - dd-wrt
  - media center
  - windows
---
About a year ago, I built an <a href="http://xbmc.org/">XBMC</a>-based media center for our home; I was tired of our DVD stack and wanted something a little more modern. Almost immediately, however, a gnawing doubt crept in: what would we do if this new media center crashed/had its hard drive destroyed/etc.? Our entire collection would be toast. Naturally, I started to think about a backup strategy.

It was easy enough to add an external hard drive and use Windows Backup (which, for this use case, was more than sufficient); I merely set Windows to backup my media every night at 2am.

Being energy conscious (read: being cheap), however, I was concerned with leaving the media center on throughout the night. I knew it wasn&#8217;t *that* big of a deal, but I was bothered by the lacking elegance: the media center PC should only be turned on while being backed up. After that process occurs, it should shut itself off.<!--more-->

## TL;DR

Automatic backups of a media center PC are possible thanks to the amazing DD-WRT firmware.

## The Setup

As always, I took stock of what I had:

  * The media center PC
  * A DD-WRT powered router
  * Windows 7

Here&#8217;s how I accomplished a more elegant solution.

## Step #1: Enable Wake-On-LAN (WOL) (assuming your network card supports it).

WOL is a method for turning on your PC via sending &#8220;magic packets&#8221; to the PC&#8217;s network card. How-To-Geek has [a great guide on how to set WOL up][2], so I won&#8217;t go into that here. Assuming your PC checks out to the specification of that guide, proceed!

## Step #2: Configure DD-WRT to wake your PC up at a predefined time every day.

One of DD-WRT&#8217;s many features is the ability to support cron:

> Cron, also referred to as crond, is a service which can be turned on in DD-WRT systems. Cron is the standard system scheduler process within a system running Linux and other *nix variants. Older versions of DD-WRT Linux use the name and command cron; in newer builds the name cron has been changed to crond, however they work the same.

Check out [the CRON page on the DD-WRT wiki][3] for more information.

For our purposes, we are going to set up a cron job that wakes our PC at 1:55am every morning. To do this, simply navigation to &#8220;Administration >> Management&#8221;; look for the &#8220;Cron&#8221; section. Click the &#8220;Enable&#8221; radio button

[<img class="alignnone size-full wp-image-141" src="{{ site.baseurl }}/assets/2014/01/DD-WRT__build_18946M__-_Administration.jpg" alt="Enabling cron in DD-WRT" width="596" height="135" />][4]

You&#8217;ll need to identify the MAC address of the PC that you&#8217;re wanting to wake (you can do this via the Status tab in DD-WRT). In my case, I&#8217;m going to use XX:XX:XX:XX:XX:XX as a sample.

With that MAC address in hand, put this command into the &#8220;Additional Cron Jobs&#8221; text area:

<code>55 1 * * * root /usr/sbin/wol -i 192.168.1.255 XX:XX:XX:XX:XX:XX</code>

Let&#8217;s break down what this command means:

  * **55 1 \* \* *:** execute this command at 1:55am every day
  * **root:** execute this command as root
  * **/usr/sbin/wol -i 192.168.1.255 XX:XX:XX:XX:XX:XX:** the command itself (which sends WOL packets to the specified MAC address via our broadcast address)

Once you&#8217;re done, click &#8220;Apply Settings&#8221;. Your new cron job should be loaded and ready to go.

## Step #3: Over on the PC, configure a Scheduled Task for Windows Backup.

I&#8217;m going to assume you&#8217;ve already created a backup via Windows Backup (in my case, I merely back up our media files to an external drive).

Open Task Scheduler. In the left-hand pane of the main window, open &#8220;Task Scheduler Library >> Microsoft >> Windows >> WindowsBackup&#8221;.

[<img class="alignnone size-full wp-image-144" src="{{ site.baseurl }}/assets/2014/01/Windows_7_x64.jpg" alt="WindowsBackup Task Set" width="203" height="277" />][5]

Select this item and look for the task named &#8220;AutomaticBackup&#8221; in the top pane.

[<img class="alignnone size-full wp-image-145" src="{{ site.baseurl }}/assets/2014/01/Windows_7_x64_2.jpg" alt="AutomaticBackup Task" width="771" height="231" />][6]

Right click on this task and select &#8220;Properties&#8221;. In the window that appears, select the &#8220;Triggers&#8221; tab. You should see the schedule-based trigger that you defined when creating your backup.

[<img class="alignnone size-full wp-image-147" src="{{ site.baseurl }}/assets/2014/01/Windows_7_x64_3.jpg" alt="Action Triggers" width="630" height="230" />][7]

For our purposes here, we&#8217;re going to modify this trigger to execute at 2am every day; this way, it will fire shortly after the cron job boots the PC.

[<img class="alignnone size-full wp-image-148" src="{{ site.baseurl }}/assets/2014/01/Windows_7_x64_4.jpg" alt="Task Schedule" width="603" height="216" />][8]

With this set, we&#8217;re almost there.

## Step #4: Configure a Scheduled Task to shut the PC down when the backup finishes.

Interestingly enough, there&#8217;s not a straightforward way to shut the PC down after the backup finishes. Fortunately, there is a way to do it nonetheless.

Right click on the &#8220;WindowsBackup&#8221; folder in the left-hand pane and select &#8220;Create Basic Task.&#8221; Fill it in with the following info:

  * **Name:** Shutdown After Backup
  * **Trigger:** When a specific event is logged
  * **Log:** Microsoft-Windows-Backup/Operational
  * **Source:** Backup
  * **Event ID:** 4098 (this is the Event ID that fires when a backup successfully completes)
  * **Action:** Start a program
  * **Program/Script:** C:WindowsSystem32shutdown.exe
  * **Add arguments:** /s

[<img class="alignnone size-full wp-image-149" src="{{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-22-at-9.02.47-PM.png" alt="Finished Task" width="714" height="500" />][9]

Finish the task and save it.

* * *

At this stage, you should be all set – your PC will turn on at 1:55am every morning, back itself up at 2am, and shut itself down after everything is complete.

One thing to note: from what I can tell, 4098 represents a *successful* backup. I&#8217;m not sure what the error code is&#8230;I&#8217;m sure I&#8217;ll pay for that at some point, but for now, we won&#8217;t worry about it!

 [2]: http://www.howtogeek.com/70374/how-to-geek-explains-what-is-wake-on-lan-and-how-do-i-enable-it/
 [3]: http://www.dd-wrt.com/wiki/index.php/CRON
 [4]: {{ site.baseurl }}/assets/2014/01/DD-WRT__build_18946M__-_Administration.jpg
 [5]: {{ site.baseurl }}/assets/2014/01/Windows_7_x64.jpg
 [6]: {{ site.baseurl }}/assets/2014/01/Windows_7_x64_2.jpg
 [7]: {{ site.baseurl }}/assets/2014/01/Windows_7_x64_3.jpg
 [8]: {{ site.baseurl }}/assets/2014/01/Windows_7_x64_4.jpg
 [9]: {{ site.baseurl }}/assets/2014/01/Screen-Shot-2014-01-22-at-9.02.47-PM.png
