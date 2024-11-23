TAILS-OS-Virtual-Machine-Creator

This Bash script automates the process of downloading, configuring, and running a bootable Ventoy image with Tails OS. It includes downloading Ventoy, formatting a virtual disk image, adding the Tails OS ISO, and running the setup in a QEMU virtual machine.

Tails OS does not natively support booting its ISO file directly in a virtual machine. To work around this limitation, the script uses Ventoy to create a bootable virtual .img file and places the Tails ISO on it. When launching the virtual machine through QEMU, you can boot into Ventoy, select the Tails ISO, and choose "Boot With GRUB" from the Ventoy menu. Then, in the Tails bootloader, select "Boot from external hard drive" (the bottom entry). This method ensures the Tails ISO boots without any issues.

Features
Downloads and extracts the specified version of Ventoy.
Formats a virtual disk image using Ventoy with exFAT/MBR.
Downloads Tails OS and prepares it on the Ventoy partition.
Launches a QEMU virtual machine with the Ventoy image.
Cleans up temporary files after execution.

Dependencies:
Ensure the following dependencies are installed:
wget - for downloading files.
tar - for extracting Ventoy files.
dd - for creating the virtual disk image.
losetup - for managing loop devices.
mount - for mounting the Ventoy partition.
qemu-system-x86_64 - for running the virtual machine.
Root permissions (run the script as root).

Download & Execution:
(Run the script as root)
```bash
git clone https://github.com/GlitchLinux/TAILS-OS-QEMU-Autoscript.git
cd TAILS-OS-QEMU-Autoscript
sudo bash TAILS-OS-QEMU-Autoscript.sh
```
What it does:
Checks for root privileges: The script must be run as root to perform disk operations.
Deletes /tmp contents: Clears /tmp except for the script itself.
Downloads Ventoy and Tails OS:
Ventoy version: 1.0.96
Tails OS version: 6.9
Formats a virtual disk image:
Creates a 2GB .img file.
Configures it with Ventoy.
Prepares the Ventoy partition:
Mounts the exFAT partition.
Copies the Tails OS ISO to the partition.
Runs QEMU virtual machine:
Launches the VM with KVM acceleration and 2GB of RAM.
Cleans up:
Removes temporary files in /tmp after VM execution.
Notes
Ensure you have sufficient privileges and free space in /tmp.
The script is tested for Ventoy 1.0.96 and Tails OS 6.9. For other versions, modify the ventoy_version and iso_url variables.
Temporary files are created in /tmp and deleted after the script finishes.
Disclaimer
This script is provided "as is" without any warranty. Use at your own risk. Always double-check the operations involving your system and storage devices.

License
This project is licensed under the MIT License. See the LICENSE file for details.
