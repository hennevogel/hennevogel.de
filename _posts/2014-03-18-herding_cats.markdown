---
image: herd_of_cats.jpg
tags: ruby rails
title:	'Distributing Free Software: Herding Cats'
---

The basic challenge of distributing Free Software is compiling that awesome open source code into machine code for different Linux distributions so it's easily consumable for users. Sounds simple, but it isn't. If you look at the dependencies of a typical Free Software project you will find thousands of other projects in the stack. They build on top of each other, have functional dependencies, sometimes they are interdependent, they conflict with each other and what not. In short: Building Free Software is like herding cats. And rightfully users of the software expect a steady, well behaved, streamlined herd of cats! The [Open Build Service (OBS)](http://openbuildservice.org) is the tool which makes this possible, it helps Free Software distributors to **automatically and consistently build binary packages** from free and open source code.

It goes like this: Engineers upload source code and build instructions to the OBS and the system compiles that into binary packages for different [distribution versions](https://en.wikipedia.org/wiki/Linux_distribution) and different [CPU architectures](https://en.wikipedia.org/wiki/Computer_architecture). The build instructions say how to compile the source code into machine code, defines the dependencies and the conflicting capabilities the software has in relation to other software, itemizes which files are needed to run it, and a whole lot of other meta data. The job of the OBS is to interpret all this information, to provide a build environment matching the requirements, the execution of the build, and of course the reporting of the outcome.

The end result are multiple binary packages out of one single source. The twist is: If other software depends on the package in some way, the OBS will trigger a rebuild of the depending package afterward. This ensures that changes propagate through the whole stack and that the user gets a consistent product to install.

## Updates: Nobody is perfect.
![A black swan](http://s0.geograph.org.uk/geophotos/02/77/15/2771576_8cf659ce.jpg)

[Some rights reserved](http://creativecommons.org/licenses/by-sa/2.0/ "Attribution-ShareAlike License") by [Colin Smith](http://www.geograph.org.uk/profile/3972)

Sadly, software is sometimes defective and people make mistakes.  Nobody is perfect.  That's why the second basic service a Free Software distributor delivers to its users is the art of exchanging pieces without breaking the whole: Updates. Your distributor does not want to interrupt you in going about your business, and to be able to do this he needs to **reproduce the software builds** at any given time in the long lifetime of the software.

The OBS helps distributors to achieve this by tracking who has made changes, when changes are made, and what has changed. The OBS also helps by utilizing a clean, virtualized build environment. This is how it goes: When an engineer triggers a build in the OBS by changing the software in it, the system saves the current state, gathers all the dependencies and kicks off a virtualized environment to execute the build. As the information on how to assemble the build environment is contained in the software and as all dependent software gets rebuilt too it makes every build reproducible.

And if something is reproducible it is predictable and that is what distributors aim for. If you can predict how all of the software projects in your stack influence each other, you can make sure that a change to a single piece can be managed through all of its dependencies, ensuring that the whole system of software continues to work after a change. This is how the OBS helps you as a user because updates from the OBS don't get in the way of your business.

## Collaboration: Unity is strength
![Collaborate](https://farm4.staticflickr.com/3328/5755219051_31e445fdd5_o.png)

[Some rights reserved](http://creativecommons.org/licenses/by-sa/2.0/ "Attribution-ShareAlike License") by [opensourceway](https://secure.flickr.com/photos/opensourceway/)

Now the software isn't the only herd of cats that needs taming. Each of the thousands of software projects is maintained by one or more developers that collaborate with each other, that's a whole bunch of awesome people! And this is the third basic challenge a Free Software distributor solves for its users. It brings together people who **collaborate on the integration of free and open source software**.

The OBS formalizes this collaboration into work flows that all engineers utilize. Everybody is using the same way to submit new software, to update existing software to a new version, to submit bug fixes and features. Everyone is using the same means to branch, study, change, and improve the software.

OBS simply helps Free Software engineers to harness the power of the open source development model. And this also helps the users because they get a tightly integrated software solution.

## There is more...
This is how Free Software distributors utilizes the Open Build Service for the benefit of the users: Build binary packages for a wide range of distributions and architectures from source code in an automatic, consistent, reproducible and collaborative way.

But there is more: OBS itself is free software. You can run, copy, distribute, study, change and improve it. The source code and the developers are on [github](https://github.com/openSUSE/open-build-service). As Free Software, it is able to keep up with the ever-evolving ecosystem, which constantly produces new distributions, new package formats, new architectures, software, standards and tools. At the current time, OBS supports more than 20 different distributions, half a dozen architectures and three different package formats. It can cryptographically sign your software and products, different instances of OBS can connect to each other and OBS can be used in conjunction with source code revision systems like git/github in continuous integration work flows.

## Do. Or do not. There is no try.

![The Master](https://farm3.staticflickr.com/2375/2797865377_eae687f4c4_o_d.jpg)

[Some rights reserved](https://creativecommons.org/licenses/by/2.0/ "Attribution 2.0 Generic License") by [Dov Harrington](https://www.flickr.com/photos/idovermani/)

Enough talk, let's get practical! You have Free Software that you want to make available? Here is how you can utilize the [Open Build Service reference server](https://build.opensuse.org/) which is freely available for developers to build packages for the most popular Linux distributions including openSUSE, Debian, Fedora, Ubuntu, Arch, Red Hat Enterprise Linux and SUSE Linux Enterprise.

## Build a package
Building packages is the most basic feature of the OBS. All you need to for that is a modern web browser (we recommend [firefox](http://getfirefox.com)) and an account on the [OBS reference server](https://build.opensuse.org/).

1. Create an account & log in<br>
Point your browser to [https://build.opensuse.org](https://build.opensuse.org) and click the ***Sign Up*** button in the upper right corner. Fill out the required information (please take note of [SUSE's Privacy Statement](https://www.suse.com/company/policies/privacy/)) and create your account. Once you're account is created, log into the OBS (the ***Log In*** link is also in the upper right corner).
2. Create your home project<br>
Every user in the OBS has it's own little space for building packages, called a *home project*, it always has the name of *home:USERNAME*, mine is [home:hennevogel](https://build.opensuse.org/project/show/home:hennevogel). You can navigate to your *home project* with the link in the, you've guessed it, upper right corner. As this is your first log in you have to create it and that's why you are greeted by a form, you can give your *home project* a nice title and a description of it's content and once you're done, click on ***Create Project***. In the next step you're greeted by your new shiny own little space on the OBS reference server to build your packages. Hooray!
![Your OBS home project](https://raw.githubusercontent.com/hennevogel/obs-tutorial/screenshots/02.home-project.png)
An OBS *project* can contain zero or more OBS *packages*. For now your *home project* is empty, that's boring so let's create your first package!
3. Create a package<br>
Find the *Create package* link and click on it. Another form creeps up on you. Fill in the information like this: **Name**: ctris. **Title**: Console based Tetris clone. **Description**: A colorized, small and flexible Tetris clone for the console. Once you're done press ***Save changes***. This will lead you to your new package.
![An empty OBS package](https://raw.githubusercontent.com/hennevogel/obs-tutorial/screenshots/04.empty_package.png)
An OBS package can contain multiple *files* that are needed to build it. But for now your *ctris package* is empty. Let's also change this.
4. Upload files<br>
Typically an OBS *package* consists of two parts: The source code archive and the build description. As this is a tutorial on how to use the OBS and not about getting you've started with packaging we have prepared some files for you. Please download the [source code archive](http://www.hackl.dhs.org/data/download/download.php?file=ctris-0.42.tar.bz2) and the [RPM build description](https://raw.githubusercontent.com/hennevogel/obs-tutorial/master/ctris.spec) onto your computer. Then use the ***Add file*** dialog to upload them to your OBS package. In the end the *Source Files* box should look like this
![enter image description here](https://raw.githubusercontent.com/hennevogel/obs-tutorial/screenshots/05.filled_package.png)
Now your OBS package contains everything it needs to produce RPM packages that your users could install, however nothing has happened yet! Did you notice the *Build Results* box next to your files? It tells you the last missing piece you need: The project this package belongs to currently has no *build targets* defined. Alright, let's change that, click on the ***build targets*** link in that box!
5. Add Build Targets<br>
***Build Targets*** are basically the Linux distributions that you want the package to be available for. Like Debian or Arch Linux. On the OBS reference server you're greeted by this impressive collection of build targets to choose from:
![Distributions to build for in the OBS](https://raw.githubusercontent.com/hennevogel/obs-tutorial/screenshots/06.add_build_target.png)
For this tutorial let's pick some RPM based distributions: openSUSE 13.2 and Fedora 22. After you have added the ***build targets*** you are redirected to the configuration for them, don't bother with that (yet) and click straight on the ***Overview*** link in the upper left corner.
6. Building<br>
Now the magic happens! Do you notice the ***Build Results*** box? If you did everything right it will have kicked of your first OBS build already. Your *ctris* package will be in the state *scheduled*, *building* or *succeeded*. If you click on those links the OBS will take you to log file of this build which you can inspect, follow and download. But log files are not what we are here for right? We want to download and play *ctris*! Let's do that, click on the ***Overview*** link again.
7. Download Binary Packages<br>
Once all four build targets are in the state *succeeded* you can click on the ***Download Package*** link which will lead you to this page that includes instructions on how to download and install the ctris package for Fedora and openSUSE.

![ctris package download page](https://raw.githubusercontent.com/hennevogel/obs-tutorial/screenshots/07.download_package.png)

That's how you can build and distribute binary packages for a wide range of distributions and architectures with the Open Build Service. Enjoy!

> Want to learn the basics of software packaging? The Linux distributions have great introductions to the [RPM](http://fedoraproject.org/wiki/How_to_create_an_RPM_package), [DEB](https://wiki.debian.org/IntroDebianPackaging) and [PKGBUILD ](https://wiki.archlinux.org/index.php/Creating_packages) formats that we suggest beginner packagers review. The [tutorial github repository](https://github.com/hennevogel/obs-tutorial) also contains build instructions for all kinds of different distributions.
