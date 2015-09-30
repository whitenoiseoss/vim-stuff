# vim-stuff
This is my VIM stuff

## Installation Instructions (Ubuntu/Mint)
### Install CTAGS
```
sudo apt-get install exuberant-ctags
```

### Optional: TMUX
Optionally, if you would like to use tmux:
```
sudo apt-get install tmux
```
Alias on ZSH for starting tmux with 256bit color:
```
alias tmux='tmux -2'
```
If it still looks weird in TMUX, in your session do:
```
export TERM=screen-256color
```

### PIP Installations
This will install Python PEP8 and syntax checker, compatible with Syntastic:
```
sudo pip install pyflake8
```

## Getting Started

1. Clone this repository
2. Change vimrc file into your .vimrc in your home directory
  * ```cp vimrc ~/.vimrc```
3. Install the VIM setup
  * ```vim +PluginInstall +qall```
4. Launch VIM
  * ```vim```

## Important Stuff
### General
| Command | Effect |
|:--------:|:--------:|
| ```ctrl+z``` | Undo |
| ```ctrl+y``` | Redo |
| ```,c``` | Comment |
| ```,f``` | Find |
| ```,fn``` | Find next |
| ```,q``` | qall |
| ```F2``` | Cls/Func List |
| ```F3``` | NERDTree |

### Custom Commands
#### Python
* ```:WNpyfc```
  * Find a Python class definition across CWD
* ```:WNpyfm```
  * Find a Python method definition across CWD
  
#### JavaScript
* Coming Soon!

#### Puppet
* Coming Soon!

### Snippets
Coming Soon!

### TMUX Cheat Sheet
[TMUX Cheat Sheet](http://tmuxcheatsheet.com/)

## Automation Packages
Here's some packages you might find useful:

* rodjek/vim-puppet
* chase/vim-ansible-yaml
* t9md/vim-chef
