#!/bin/bash

# Set the GTK theme to dark
export GTK_THEME=Adwaita-Dark:grey

# Calculate 30% wider size for the first Zenity window
original_width=370
original_height=370
smaller_width=$(awk "BEGIN {printf \"%.0f\n\", $original_width * 0.5}")
smaller_height=$(awk "BEGIN {printf \"%.0f\n\", $original_height * 0.7}")
bigger_width=$(awk "BEGIN {printf \"%.0f\n\", $original_width * 1.3}")
geometry="${smaller_width}x${smaller_height}"

# Set the GTK theme to dark
export GTK_THEME=Orchis-Grey:dark

# Path to the LUKS-encrypted image file
img_file="/home/x/PERSISTENCE/3MB-VAULT.img"

# Mount point for the decrypted virtual disk
mount_point="/media/root/3MB-VAULT"

# Text file to open when unlocked
text_file="$mount_point/Notes.txt"

# Prompt for the encryption password using zenity
password=$(zenity --password --title="Enter Encryption Password" --text="Please enter the encryption password for $img_file")

# Create a mount point if it doesn't exist
sudo mkdir -p "$mount_point"

# Mount the decrypted virtual disk
echo "$password" | sudo cryptsetup luksOpen "$img_file" vault
if [ $? -ne 0 ]; then
    zenity --error --text="Failed to open LUKS-encrypted image. Exiting."
    exit 1
fi

sudo mount /dev/mapper/vault "$mount_point"

# Check if the mount was successful
if [ $? -ne 0 ]; then
    zenity --error --text="Failed to mount the decrypted virtual disk. Exiting."
    exit 1
fi

# Open the specified text file with mousepad
sudo l3afpad /media/root/3MB-VAULT/Notes.txt

# Set a timer to unmount the image after 5 minutes (300 seconds)
(
    sleep 300
    sudo umount "$mount_point"
    sudo cryptsetup luksClose vault
    echo "Disk unmounted after 5 minutes."
) &

# Close the terminal
exit
