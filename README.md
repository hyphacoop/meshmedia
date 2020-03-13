meshmedia
=========

TODO description

## Set Up

1. Make sure you have a Raspberry Pi 3B+ or 4

1. Flash an SD card with [Raspbian Buster Lite](https://www.raspberrypi.org/downloads/raspbian/).

1. Create an empty file named **ssh** to enable SSH when the Pi boots:

    ```
    $ touch /path/to/sd/boot/ssh
    ```

1. Plug the Pi into your router so it has connectivity to the Internet. SSH into the Pi with `ssh pi@raspberrypi.local` and password **raspberry**.

    **Optional:** There are other ways to connect, such as connecting the Pi to your computer and sharing Internet to it. If you have multiple Pi's connected to your router, find their IPs with `nmap -sn 192.168.X.0/24` (where 192.168.X is your subnet) and SSH to the local IP assigned to the Pi you want to address `ssh pi@192.168.X.Y`.  

    **Note:** After the install the node will be renamed to `meshmedia`.

1. In your SSH session, run `passwd` and change your login password. It is very important to choose a strong password so others cannot remotely access your Pi.

1. Run the following, then let the installation complete.

    ```
    $ wget https://raw.githubusercontent.com/hyphacoop/meshmedia/master/install && chmod +x install && ./install
    ```