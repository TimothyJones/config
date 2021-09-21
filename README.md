Tim's Config Files
==================

Configuration settings that I find useful. Probably not useful to you?


## Install vimrc, bash profile, and configure git

```
git clone https://github.com/TimothyJones/config.git
./config/install.sh
```

## Install apps

* [iterm2](https://iterm2.com/)
* [atom](https://atom.io/)
* [Intellij](https://www.jetbrains.com/idea/)
* [yEd](https://www.yworks.com/products/yed/download#download)

## Configure apps

* [Intellij settings](instructions/intellij.md)
* [atom plugins](instructions/atom.md)

## Misc commands

See [this gist](https://gist.github.com/TimothyJones/25670501d11b43a7e06039ffed887898), written to cut down on repeat google searches.

Use `ssh` everywhere for github (useful for `go get <private repo>`)

```
git config --global url."git@github.com:".insteadOf "https://github.com/"
```
