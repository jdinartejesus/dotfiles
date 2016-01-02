# dotfiles

## Installations

1 - Install RCM (Dotfiles Manager)
> https://github.com/thoughtbot/rcm

OS X:

```
brew tap thoughtbot/formulae
brew install rcm
```

Ubuntu:

```
sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
sudo apt-get update
sudo apt-get install rcm
```

2 - Clone the Repository

```
cd ~/
git clone git@github.com:jdinartejesus/dotfiles.git .dotfiles
```

3 - Create the Symlinks

- lsrc - *show configuration files*
- rcup -v - *update and install dotfiles*

```
lsrc
rcup -v
```
