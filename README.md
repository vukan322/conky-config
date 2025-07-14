# Custom Conky for a Vertical Side Monitor
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Built with Conky](https://img.shields.io/badge/Built_with-Conky-blue?logo=conky&logoColor=white)](https://github.com/brndnmtthws/conky)
[![Distro: Ubuntu](https://img.shields.io/badge/Distro-Ubuntu-blue?logo=ubuntu&logoColor=white)](https://ubuntu.com/)

This is a personal Conky setup designed specifically for a vertical monitor used as a secondary display. The layout is optimized to place important, at-a-glance information in the primary viewing area.

This configuration uses Lua scripting to provide advanced features and a clean, portable setup without external shell scripts.

## Preview

**Main View**
![Main View](screenshots/screenshot.png)

**Full Screen Context**
![Full Screen Context](screenshots/screenshot-fullscreen.png)

## Features

* Large, centered clock with the current date.
* Two-column layout that separates custom information from system stats.
* Lua helper scripts for financial countdowns (rent, bills, new month).
* Live list of the Top 5 Processes by CPU and RAM usage, with a separate 3-second update interval.
* Detailed system monitoring (CPU, RAM, Storage).
* Dedicated NVIDIA GPU monitoring section with usage, temperature, VRAM, power draw, and clock speed
* Portable configuration that uses the $HOME variable, requiring no hardcoded user paths.

## Dependencies

* **Conky**: `v1.10` or newer.
* **NVIDIA Drivers**: The `nvidia-smi` command must be installed and available in your system's PATH.
* **Fonts**: `DejaVu Sans Mono` is used by default, but can be easily changed in `conky.conf`.

## Installation & Usage

This configuration is portable and can be placed in any directory.

#### 1. Install Dependencies

First, make sure you have Conky local machine:
```bash
sudo apt update
sudo apt install conky-all
```

#### 2. Get the Files

Clone this repository to your local machine:
```bash
git clone https://github.com/vukan322/conky-config.git
```

#### 3. Move to your Directory

Now, move into the newly created directory:
```bash
cd conky-config
```

#### 4. Run Conky

To run the configuration, point Conky to the conky.conf file using the -c flag.
```bash
conky -c conky.conf
```

## License

This project is licensed under the MIT License - see the `LICENSE` file for details.
