#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

curl -Lo /etc/yum.repos.d/atim-starship-fedora-"${RELEASE}".repo https://copr.fedorainfracloud.org/coprs/atim/starship/repo/fedora-"${RELEASE}"/atim-starship-fedora-"${RELEASE}".repo

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install tmux kcm_systemd plymouth-kcm starship solaar solaar-udev neovim libburn cdrskin xorriso ifuse usbmuxd host-spawn kleopatra

# this would install a package from rpmfusion
rpm-ostree install vlc

# Remove packages from base
rpm-ostree override remove firefox firefox-langpacks    

#### Example for enabling a System Unit File
systemctl enable podman.socket
systemctl enable cups-browsed.service
systemctl enable usbmuxd.service
