# Quantumr8's dotfiles

This is mainly for my keepsake, but if you want you can get my dotfiles here.

![Screenshot of my windows terminal](https://i.imgur.com/jQ9EOZ2.png)

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don't want or need. Use this at your own risk!


### Additional downloads
- Zsh is required `sudo pacman -S zsh`
- Windows Terminal config [pastebin](https://pastebin.com/X2GbRtD8)
- I included the font I used here [`Hack bold`](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete.ttf) in ~/.fonts but you can use any nerd font.

### Using Git and stow script

You can clone this repository whenever you want. (I keep it in `~/.dotfiles` and use stow to link the config files.) The script will also install all the needed packages.


```bash
git clone https://github.com/quantumr8/dotfiles.git && cd dotfiles && source install.zsh
```

To update, `cd` into `dotfiles` repository and run:

```bash
source update.zsh
```


## System Specs

**OS:** Windows 10 Home x86_64

**WLS:** Arch linux

**Terminal:** Windows Terminal

**Programs:** Editor:neovim,vscode; Task:Gotop; Discord:discurses

Link to [wallpaper](https://wallhaven.cc/w/r2okx1)

