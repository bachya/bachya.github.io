---
title: 'CLIUtils Update: Validator and Behavior Plugins'
author: Aaron
layout: post
permalink: /cliutils-update-validator-behavior-plugins/
dsq_thread_id:
  - 2615385356
categories:
  - Tech
tags:
  - cli
  - cliutils
  - osx
  - ruby
---
I just added some cool functionality to CLIUtils: plugins for custom Validators, Behaviors, and Pre-Post Actions.

(*fair warning: if you&#8217;re not familiar with CLIUtils yet, I recommend you check out the <a title="CLIUtils Github Page" href="https://github.com/bachya/cliutils" target="_blank">Github page</a>)*

To date, Validators and Behaviors were built into CLIUtils itself. Although these built-ins stay, developers can now create their own Validators and Behaviors via easy plugins. Nice!

Also, I&#8217;ve introduced the concept of Pre-Post Actions, which are CLI messages and custom actions that can be executed before *and* after a preference prompt is delivered. These, too, are implemented as plugins so that developers can define their own.

The full changelog for this release can be found <a title="Github History" href="https://github.com/bachya/cliutils/blob/master/HISTORY.md" target="_blank">here</a>. For more information, check out the <a title="CLIUtils Wiki" href="https://github.com/bachya/cliutils/wiki" target="_blank">wiki</a> (specifically, <a title="Defining Custom Validators, Behaviors, and Pre Post Actions" href="https://github.com/bachya/cliutils/wiki/Defining-Custom-Validators%2C-Behaviors%2C-and-Pre-Post-Actions" target="_blank">the section on custom Validators, Behaviors, and Actions</a>) and <a title="CLIUtils YARD Documentation" href="http://rubydoc.info/github/bachya/cliutils/master/frames" target="_blank">YARD documentation</a>.

Enjoy!
