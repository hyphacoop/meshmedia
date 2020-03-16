meshmedia
=========

TODO description

## Set Up

1. You need to have a Raspberry Pi 3B+ or 4, and a microSD card.

1. Flash the microSD card with [Raspbian Buster Lite](https://www.raspberrypi.org/downloads/raspbian/). You can use a tool like [Etcher](https://www.balena.io/etcher/).

1. Create an empty file named **ssh** to enable SSH when the Pi boots:

    ```
    $ touch /path/to/sd/boot/ssh
    ```

1. Plug the Pi into your router so it has connectivity to the Internet. SSH into the Pi with `ssh pi@raspberrypi.local` and password **raspberry**.

    > **Optional**: There are other ways to connect, such as connecting the Pi to your computer and sharing Internet with it. If you have multiple Pis connected to your router, find their IPs with `nmap -sn 192.168.X.0/24` (where `192.168.X` is your subnet) and SSH to the local IP assigned to the Pi you want to connect to `ssh pi@192.168.X.Y`.

1. In your SSH session, run `passwd` and change your login password. It is very important to choose a strong password so others cannot access the Pi.

1. Run the following to install _meshmedia_:

    ```
    $ wget https://raw.githubusercontent.com/hyphacoop/meshmedia/master/install && chmod +x install && ./install
    ```

    Wait for the installation to complete. Your Raspberry Pi will reboot with the new hostname `meshmedia` and you can now connect to it at `ssh pi@meshmedia.local`.

1. Nearby devices can now connect to the new Access Point named `meshmedia` and watch videos on the IPFS network using its CID. For example, you can watch _A technical introduction to IPFS_ by _Hector Sanjuan_ with the URL `http://10.0.0.1/?vod=QmNtQiSK7dZbMCH89kgBLzgfMQP3UoWqT2QKWvjtVt2jTx`. You can try this with any video from the [Our Networks archive](https://2019.ournetworks.ca/recorded-talks/), and many others on the Internet, by replacing the CID in the URL.

## HLS Content

In addition to `mp4` files, _meshmedia_ can also play HLS playlists commonly used for live streamed content. For example, SSH into the Pi at `ssh pi@meshmedia.local` and download the Our Networks 2019 [live stream archive of September 22](https://github.com/ournetworks/ournetworks.ca/blob/master/livestream/live-2019-09-22.m3u8):

```
cd /var/www/html/
sudo wget https://2019.ournetworks.ca/livestream/live-2019-09-22.m3u8
```

Now you can watch the HLS content at `http://10.0.0.1/?m3u8=live-2019-09-22.m3u8`.

## Offline Content

You can easily store content for offline playback. SSH into the Pi at `ssh pi@meshmedia.local` and `ipfs pin add` the CID. For example,

```
ipfs pin add QmNtQiSK7dZbMCH89kgBLzgfMQP3UoWqT2QKWvjtVt2jTx
```

Now you can disconnect the Pi from the Internet and still be able to watch the content with the URL from before. You will also help to host and seed this content for others once your Pi is connected to the Internet.

## Attribution

This software is based on ongoing work by [Toronto Mesh](https://tomesh.net), drawing mostly from two repositories:
  - [prototype-cjdns-pi](https://github.com/tomeshnet/prototype-cjdns-pi/)
  - [IPFS Live Streaming](https://github.com/tomeshnet/ipfs-live-streaming/)

The video player uses code from [Video.js](https://videojs.com), graphics from [ipfs/artwork](https://github.com/ipfs/artwork), and loading animation from [jxnblk/loading](https://github.com/jxnblk/loading).

## License

This project is licensed under [GNU General Public License version 3 (GPL-3.0)](LICENSE).
