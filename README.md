Tim's Config Files
==================

Configuration settings that I find useful. Probably not useful to you?


## Install vimrc, bash profile, and configure git

```
git clone https://github.com/TimothyJones/timconfig.git
timconfig/install.sh
```

## Configure apps

* [Intellij settings](intellij.md)

## Misc commands

See [this gist](https://gist.github.com/TimothyJones/25670501d11b43a7e06039ffed887898), written to cut down on repeat google searches.

Use `ssh` everywhere for github (useful for `go get <private repo>`)

```
git config --global url."git@github.com:".insteadOf "https://github.com/"
```
