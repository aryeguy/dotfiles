# <img src="media/dotfiles.png" width="321" height="62" alt="dotfiles">
> Full glory!

## Overview
My config files, mainly Vim & Zsh aimed at working in Windows (7/8) and Ubuntu & OSX.

## Key Features
- Uses [NeoBundle](https://github.com/Shougo/neobundle.vim) as package manager.
- Uses [Unite](https://github.com/Shougo/unite.vim) as an all-around explorer.
- Zsh with [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh).
- Awesome **shell prompt** based on [pure](https://github.com/sindresorhus/pure)
- Geared towards portability.
- Equipped to handle web development (HTML/CSS/Js/Frameworks/etc...)
- NERDTree/CtrlP for browsing (but soon enough will use Unite for that too)

## Goals

- As Object-Oriented as possible
- As lazy-loaded as possible (due to 75+ Vim packages)
- Shell install scripts for windows and Linux
- OS agnostic
- Highly commented

![](media/prompt.png)

## Installation

- Git clone this repository into your `~/.dotfiles`
```sh
$ git clone https://github.com/pgilad/dotfiles.git ~/.dotfiles
```

- Change your shell to `zsh` (`chsh -s /bin/zsh`)

### Windows

- Run `install/install.cmd`. If it fails - you will need Administrator permission for it.

### Ubuntu & OSX

- Run `install/install.sh`

### OSX Optional Setup

- Make sure your OSX version is latest
- Install XCode
- `brew bundle ~./dotfiles/install/Brewfile`
- `brew bundle ~/.dotfiles/install/Caskfile`

### What happens during install & load

- Files from `link` are linked to `~/`.
- Files from `source` are sourced on profile load.

To source local files put them in `~/local/`:

- Files in `~/local/` with pattern `filename.local` (hidden files included) are sourced on profile load.

#### Customizing iTerm2 Themes:

- Clone [iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes)
- Import your favorite theme in iTerm2 -> Profiles -> Colors -> Import Theme
- Profit$$

## Local gitconfig

To adjust `.gitconfig` to your user.name and E-mail, add a `~/.gitconfig.local` file.
Anything you add here will override the general `.gitconfig`. This is mostly useful for setting
your E-mail and name for git.

```
[user]
    name = Dan Croak
    email = dan@thoughtbot.com
```

## Vim

![](media/vim.png)

- Main file is `_vimrc`.
- Bundles files (bundled using `NeoBundle`) is `bundles.vim`.
- Update bundles using `NeoBundleUpdate`.
- Custom snippets are in the directory `mysnippets` and are auto-loaded according to filetype.

```vim
"@author Gilad Peleg
"@license MIT 2014
"@website https://github.com/pgilad/dotfiles

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif
" Note: Vim is old
set nocompatible

let g:config =  {
            \ 'baseDir': '~/.dotfiles/vim/rc/',
            \ 'loadFiles': {},
            \ 'bundlesPath': '~/vimfiles/bundle/',
            \ 'spellDir' : '~/.dotfiles/vim/spell/',
            \ 'spellFile' : '~/.dotfiles/vim/spell/en.utf-8.add',
            \ 'undoDir' : '~/.cache/undo/',
            \ 'env' : {
            \   'windows': has('wind16') || has('win32') || has('win64'),
            \   'cygwin': has('win32unix'),
            \   'mac': has('mac'),
            \   'unix': has('unix') && !has('gui_macvim')
            \ }
            \}

" map leader keys
let g:mapleader = ","
let g:maplocalleader = ","

set guioptions=Mc
" set guioptions+=a " visual select auto-copy to clipboard

if has('syntax')
    syntax off
    filetype plugin indent off
endif

" How to quickly load the files:
" Mapping     |  File
" ---------------------------
" <leader>eg  |  Gui
" <leader>eb  |  Bundles
" <leader>es  |  Settings
" <leader>em  |  Mappings
" <leader>ea  |  autoCommands
for fileToLoad in ['bundles', 'settings', 'mappings', 'autoCommands']
    " set filename
    let b:filePath = g:config.baseDir . fileToLoad . '.vim'
    " set file object in config
    let g:config.loadFiles[fileToLoad] = b:filePath
    " source script
    silent execute 'source ' . fnameescape(expand(b:filePath))
endfor

set secure
```

## Zsh

- Uses Oh-My-Zsh alongside customization and completion

## Thanks (in no particular order)

- [Shougo's dotfiles](https://github.com/Shougo/shougo-s-github)
- [Cowboy's dotfiles](https://github.com/cowboy/dotfiles)
- [Mathias's dotfiles](https://github.com/mathiasbynens/dotfiles)
