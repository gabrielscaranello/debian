# Debian Gnome Setup by Gabriel Scaranello

This is my Debian installation setup. 😍

This guide translates my personal installation, with packages that I use in my daily life. Use as an example, never as an absolute truth! 😉

> [!NOTE]
> All scripts and configurations have been tested on [Debian 12](https://www.debian.org/releases/bookworm/).  
> Even though it should work on other versions or other distros, it is not guaranteed that it will work.

## Commands

| Command                         | Description                                                       |
| :------------------------------ | :---------------------------------------------------------------- |
| `make all`                      | Executes all tasks defined in the scripts to configure the system |
| `make add-missing-repos`        | Adds missing repositories required for the system                 |
| `make copy-desktop-config`      | Copies the desktop configuration to user home                     |
| `make copy-timeshift-config`    | Copies the Timeshift configuration for system backup              |
| `make enable-services`          | Enables and starts system services                                |
| `make hide-desktop-apps`        | Hides unwanted applications from the desktop                      |
| `make install-flatpak-packages` | Installs Selected flatpak packages                                |
| `make install-gitflow-cjs`      | Installs GitFlow CJS                                              |
| `make install-gnome-extensions` | Installs GNOME extensions                                         |
| `make install-go`               | Installs Go language                                              |
| `make install-google-chrome`    | Installs Google Chrome                                            |
| `make install-jetbrains-mono`   | Installs JetBrains Mono font                                      |
| `make install-lazydocker`       | Installs LazyDocker                                               |
| `make install-lazygit`          | Installs LazyGit                                                  |
| `make install-neovim`           | Installs Neovim                                                   |
| `make install-nvidia-packages`  | Install Nvidia Driver Packages                                    |
| `make install-nvm`              | Installs NVM (Node Version Manager) to manage Node.js versions    |
| `make install-rust`             | Installs Rust using Rustup                                        |
| `make install-system-packages`  | Installs essential system packages                                |
| `make remove-unused-packages`   | Removes unused software packages                                  |
| `make setup-cursor-theme`       | Configures the mouse cursor theme                                 |
| `make setup-default-apps`       | Sets default applications                                         |
| `make setup-gtk-theme`          | Configures the GTK theme                                          |
| `make setup-icon-theme`         | Configures the system icon theme                                  |
| `make setup-look`               | Configures the system appearance, including themes and icons      |
| `make setup-swap`               | Configures the system swap partition or file                      |
| `make setup-wallpaper`          | Sets the desktop wallpaper                                        |
| `make usermod`                  | Modifies system user settings                                     |

## Links

- [My Dotfiles](https://github.com/gabrielscaranello/dotfiles)
