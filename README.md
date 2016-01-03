# dotfiles

## Installations

1 - Install RCM (Dotfiles Manager)
> https://github.com/thoughtbot/rcm

OS X:

```
$ brew tap thoughtbot/formulae
$ brew install rcm
```

Ubuntu:

```
$ sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
$ sudo apt-get update
$ sudo apt-get install rcm
```

`TODO - Include RCM installer on OSX/Ubuntu`

2 - Clone the Repository

```
$ cd ~/
$ git clone git@github.com:jdinartejesus/dotfiles.git .dotfiles
```

3 - Create the Symlinks

- lsrc    - *Show configuration files*
- rcup -v - *Update and install dotfiles*
- mkrc    - *Move files into a dotfile*
- rcdn    - *Remove dotfiles*

```
$ lsrc
$ rcup -v
```

4 - Install Apps and Packages

```
TODO - Run brew (OSX) or apt-get (Ubuntu)
$ bash ~/.install/run.sh
```
