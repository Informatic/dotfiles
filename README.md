inf dotfiles
============

My cute little dotfiles repository. Feel free to reuse any part you like. For
best experience use [powerline-enabled font](https://github.com/Lokaltog/vim-powerline/blob/develop/fontpatcher/README.rst).

Usage
-----

	git clone --recursive this-repository ~/.dotfiles
	cd ~/.dotfiles
	./install

Cool features
-------------

`~/.bash_aliases.local` and `~/.bashrc.local` are meant to be machine-specific
scripts stored in different branches. I use these to keep `g` -> `gedit` alias 
on my working laptop for instance. (despite moving back to vim)

Requirements
------------

	# everyday work:
	sudo apt-get install git gitk git-cola vim-nox python-pip openssh-client mosh urxvt tmux python-virtualenv

	# eyecandy:
	sudo apt-get install ttf-mscorefonts-installer xfonts-terminus xfonts-terminus-oblique

	# tools requirements:
	sudo apt-get install scrot imagemagick python-pyinotify
