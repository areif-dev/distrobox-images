# Distrobox Images 

A collection of my personal Distrobox images and related management scripts to make installing a new system quicker. 
## Images 

### Fedora Base 

Most of my images are based on Fedora, so this image provides sensible defaults for those other images in the repo. This image mostly just installs the packages that are required by Distrobox, so it would also be suitable for creating a standard Fedora Distrobox without needing to wait for Distrobox to install its dependencies. 

Images based on Fedora are built every day at 10:00 AM UTC. This is a few hours after official Fedora images are pushed to Quay, so all Fedora images should never be more than a day out of sync with upstream. 

### Fedora Dev 

This image provides tools for my development workflow. This includes support for Rust, Python, and NodeJS out of the box as well as my editor of choice, Neovim. Support for ZSH Autocomplete and the Starship prompt are also included. 
### Fedora Recreation 

An image that provides apps for entertainment. This includes the YouTube frontend FreeTube, Tidal-HiFi for music, as well as gaming focused programs like Steam, Heroic Games Launcher, and Discord. 

## Scripts

### Rebase 

`rebase.sh` is used to change the image that a Distrobox container is based on. It achieves this by deleting the existing Distrobox and creating another with the same name and the same home directory. All exported apps and binaries are preserved and will continue to function as before as long as the new image also includes the app or binary. 

#### Usage 

```bash 
Usage: ./rebase.sh <container-name> <new-image>

This script updates a Distrobox container to use a new image.

Arguments:
  <container-name>    The name of the existing Distrobox container.
  <new-image>         The name of the new image to use for the container.

Options:
  -h, --help          Display this help message and exit.
```
