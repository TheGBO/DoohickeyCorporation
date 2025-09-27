#!/bin/bash

# Assemble bootloader
nasm -f bin boot.asm -o boot.bin

# Run in QEMU (try different disk interfaces)
qemu-system-x86_64 boot.bin