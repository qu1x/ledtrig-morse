# ledtrig-morse

**Kernel module to send messages in Morse code via LED**

Forked from [OpenWrt][] and distributed as standalone package.

[OpenWrt]: https://github.com/openwrt/openwrt

## Installation

 1. Install Linux headers **and** sources (required for `drivers/leds/leds.h`):

    ```sh
    sudo apt-get install linux-headers-$(uname -r) linux-source
    ```

 2. Extract the Linux sources:

    ```sh
    sudo tar -C /usr/src -xJf linux-source-*.tar.xz
    ```

 3. Install and enter this module's sources:

    ```sh
    sudo mv ledtrig-morse-1.0.0 /usr/src
    cd /usr/src/ledtrig-morse-1.0.0
    ```

 4. Build and install this module:

      - Either via Make (must be manually rebuilt for each kernel update):

        ```sh
        sudo make install
        ```

      - Or via DKMS (will be automatically rebuilt for each kernel update):

         1. Install DKMS:

            ```sh
            sudo apt-get install dkms
            ```

         2. Install this module:

            ```sh
            sudo dkms install ledtrig-morse/1.0.0
            ```
