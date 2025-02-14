# Distrobox Images 

A collection of Distrobox images and related management scripts to setup a desktop workstation with my personal selection of apps and development environments that is atomic and highly portable. This makes for a great alternative to Flatpak.

## Images 

### Fedora Base 

Most of my images are based on Fedora, so this image provides sensible defaults for those other images in the repo. This image mostly just installs the packages that are required by Distrobox, so it would also be suitable for creating a standard Fedora Distrobox without needing to wait for Distrobox to install its dependencies. 

Images based on Fedora are built every day at 10:00 AM UTC. This is a few hours after official Fedora images are pushed to Quay, so all Fedora images should never be more than a day out of sync with upstream. 

### Fedora Development

This image provides tools for my development workflow. This includes support for Rust, Python, and NodeJS out of the box as well as my editor of choice, Neovim. Support for ZSH Autocomplete and the Starship prompt are also included. 

### Fedora Recreation 

An image that provides apps for entertainment. This includes the YouTube frontend FreeTube and gaming focused programs like Steam, and Heroic Games Launcher. 

### Fedora Productivity

Installs various command line and graphical applications to aid in productivity tasks.

## Scripts

### rebase-distrobox 

Used to change the image that a Distrobox container is based on. It achieves this by deleting the existing Distrobox and creating another with the same name and the same home directory. All exported apps and binaries will be removed in this process. 

#### Usage 

```bash 
 Usage: rebase-distrobox <container-name> <new-image>

 This script updates a Distrobox container to use a new image.

 Arguments:
   <container-name>    The name of the existing Distrobox container.
   <new-image>         The name of the new image to use for the container.

 Options:
   -h, --help          Display this help message and exit.
```

### upgrade-all-distroboxes 

Rebases all current Distrobox containers on their 'latest' remote image. After rebasing, the program enters the distrobox and attempts to run `export-apps`.

#### Usage 

Just run `upgrade-all-distroboxes`. No arguments are accepted
