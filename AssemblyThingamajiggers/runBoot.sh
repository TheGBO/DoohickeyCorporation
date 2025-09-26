#!/bin/bash
set -e

# Assemble bootloader
nasm -f bin boot.asm -o boot.bin

# Assemble kernel  
nasm -f bin kernel.asm -o kernel.bin

# Create a 1.44MB floppy image
dd if=/dev/zero of=os.img bs=512 count=2880
dd if=boot.bin of=os.img conv=notrunc
dd if=kernel.bin of=os.img bs=512 seek=1 conv=notrunc

# Run in QEMU (try different disk interfaces)
qemu-system-x86_64 -fda os.img