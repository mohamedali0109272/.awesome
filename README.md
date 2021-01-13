
<p align='center'>
	<img alt='awesome' src='https://raw.githubusercontent.com/mohamedali0109272/.awesome/master/awesome.png'/>
	<br/>
	<b>
		Welcome to the awesome dotfiles!
	</b>
</p>

### Starring

- [`archlinux`](https://www.archlinux.org/download/) as distribution
- [`fish`](https://fishshell.com/) as shell
- [`awesomewm`](https://awesomewm.org) as window manager
- [`st`](https://github.com/kovidgoyal/kitty) as terminal emulator
- [`picom-git`](https://github.com/yshui/picom) as compositor
- [`rofi`](https://github.com/davatorium/rofi) as application launcher
- [`inter-font`](https://github.com/rsms/inter/) as the setup font
- [`trivago`](https://www.youtube.com/watch?v=dQw4w9WgXcQ) as hotel

### Required dependencies

| Name | Description | Why/Where is it needed? |
| --- | --- | --- |
| [`awesome-git`](https://github.com/awesomeWM/awesome) |  Highly configurable framework window manager | Isn't it obvious? |
| [`rofi`](https://github.com/davatorium/rofi) | Window switcher, application launcher and dmenu replacement | Application launcher |
| [`picom-git`](https://github.com/yshui/picom) | A compositor for X11 | A compositor with kawase-blur |
| [`inter-font`](https://github.com/rsms/inter/) | A typeface specially designed for user interfaces | Setup font | 

### Installation and usage

1. Install the [required dependencies]
2. Clone this repository.

	```bash
	$ git clone https://github.com/mohamedali0109272/.awesome
	```

3. Make sure to create a backup if you have a current AwesomeWM configuration.
4. Copy the `.awesome` folder to your `"${HOME}"/.config/`. I'll just assume that you don't have an `awesome` folder in your `~/.config/`:

	```bash
	$ cd .awesome
	$ cp -r * $HOME/.config/awesome/
	```

4. Change the global configuration in `$HOME/.config/awesome/configuration/config.lua`.
5. Reload AwesomeWM by pressing <kbd>Super + Shift + r</kbd>.

### Core features

+ Notification Center
+ Dynamic Wallpaper
+ File/Web Searching like macOS' Spotlight
+ Application Dashboard
+ Brightness and Volume OSDs
+ Functional Trash Widget
+ Built-in Screen Recorder Widget
+ Built-in Calculator Widget
+ Email Widget
+ Weather Widget
+ Quake Terminal
+ Hardware Monitor
+ Blue Light Filter Widgets 
+ Lockscreen Module with Face Capture and PAM Integration
+ Easter eggs!<sup>Mostly bugs</sup>
+ Any many more!



## Credits

- [manilarome](https://github.com/manilarome/the-glorious-dotfiles)
- [material-awesome](https://github.com/material-shell/material-shell)
- [awesomewm devs](https://github.com/awesomeWM/awesome/graphs/contributors)
- The community of course

