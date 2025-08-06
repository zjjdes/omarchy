#!/bin/bash

if [ -z "$OMARCHY_BARE" ]; then
  yay -S --noconfirm --needed \
    gnome-calculator gnome-keyring libreoffice obs-studio
    # obsidian-bin signal-desktop kdenlive \
    # xournalpp localsend-bin

  # Packages known to be flaky or having key signing issues are run one-by-one
  for pkg in spotify zoom; do # pinta typora
    yay -S --noconfirm --needed "$pkg" ||
      echo -e "\e[31mFailed to install $pkg. Continuing without!\e[0m"
  done

  # yay -S --noconfirm --needed 1password-beta 1password-cli ||
  #   echo -e "\e[31mFailed to install 1password. Continuing without!\e[0m"
fi

# Copy over Omarchy applications
source ~/.local/share/omarchy/bin/omarchy-refresh-applications || true
