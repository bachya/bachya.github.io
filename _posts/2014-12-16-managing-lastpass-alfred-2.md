---
title: Managing LastPass with Alfred 2
author: Aaron
layout: post
permalink: /managing-lastpass-alfred-2/
dsq_thread_id:
  - 3331524126
categories:
  - Tech
tags:
  - alfred
  - lastpass
---
I recently realized a gross inefficiency in my life: managing my LastPass vault. You&#8217;ll no doubt know of <a title="LastPass" href="http://www.lastpass.com/" target="_blank">LastPass</a>, the excellent cross-platform password manager.

It&#8217;s a wonderful tool and I love it dearly.&nbsp;However, it&#8217;s a tale of two experiences for me. When it comes to auto-logging-in to websites (LastPass&#8217; original, intended purpose) it works beautifully; however, when it comes to copying passwords/usernames/etc. out of the vault (for, say, the purpose of pasting them into applications that don&#8217;t support a LastPass integration, like nearly every iOS app), it&#8217;s a pain.

The pain comes from the fact that I have to:

  1. open my browser.
  2. click on the LastPass extension.
  3. enter my master password.
  4. click on the extension again.
  5. search for my site.
  6. copy my desired info.

The amount of friction is nauseating. Therefore, I set out to build something better.

<!--more-->

## TL;DR

<a title="LP Vault Manager" href="https://github.com/bachya/lp-vault-manager" target="_blank">LP Vault Manager</a> is an Alfred 2 workflow designed to manipulate a LastPass vault.

## The Tools

<a title="Alfred" href="http://www.alfredapp.com/" target="_blank">Alfred</a> is one of my champions when it comes to quick, easy, time-saving, productivity-boosting workflows. &nbsp;It popped to mind as an obvious choice for easier, more frictionless interaction with LastPass. Additionally, LastPass stepped up their game in October by <a title="Open Sourced LastPass Command Line Application Now Available" href="https://blog.lastpass.com/2014/10/open-sourced-lastpass-command-line-application-now-available.html/" target="_blank">releasing an open-source command line app to interact with a LastPass vault</a>.

Combine these two together with some&nbsp;flourish and style and you get&#8230;

## LP Vault Manager

<a href="https://github.com/bachya/lp-vault-manager/releases/download/v4.2/LastPass.Vault.Manager.alfredworkflow">Direct Download</a>

<a target="_blank" href="http://github.com/bachya/lp-vault-manager">Open on Github</a>

<a target="_blank" href="http://www.packal.org/workflow/lastpass-vault-manager">Open on Packal</a>

<img class="alignnone" src="https://raw.githubusercontent.com/bachya/lp-vault-manager/master/support/readme-images/lpvm.gif" alt="Using LastPass Vault Manager"/>

Introducing LP Vault Manager, an Alfred workflow designed to manipulate and interact with a LastPass vault. Currently, the workflow supports the following functionality:

  * Search a LastPass vault for items.
  * Instantly launch a vault item in the default browser.
  * Copy a vault item&#8217;s username and password.
  * Randomly generate a configurable number of passwords.

Instructions on how to use the workflow can be found in <a title="LP Vault Manager" href="https://github.com/bachya/lp-vault-manager" target="_blank">the GitHub repo</a>. I am planning more functionality, but I would love to hear what the community would like. Join <a title="LP Vault Manager: A Workflow for LastPass" href="http://www.alfredforum.com/topic/5293-lp-vault-manager-a-workflow-for-lastpass/" target="_blank">the discussion on the Alfred forum</a> or get your hands dirty and jump into <a title="LP Vault Manager" href="https://github.com/bachya/lp-vault-manager" target="_blank">the repo&nbsp;itself</a>.

Enjoy!
