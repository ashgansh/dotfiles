# Dotfiles
This repo not only contains the versionned dotfiles but also a way to bootstrap a new
system install.


## Install VIM and ansible

Clone this repo

```sh
cd dotfiles
sh ./install.sh
```

Clone ansible-personal and follow the instructions in that repo

## Importing gpg keys


### Exporting keys

```sh
gpg --armor --export > pgp-public-keys.asc
gpg --armor --export-secret-keys > pgp-private-keys.asc
gpg --export-ownertrust > pgp-ownertrust.asc
```

### Importing keys

```sh
gpg --import pgp-public-keys.asc
gpg --import pgp-private-keys.asc
gpg --import-ownertrust pgp-ownertrust.asc```
```

# Debuging

## i3
How to get i3 logs

`xinitrc`

```sh
exec i3 -V >> ~/.i3/i3log 2>&1
```
