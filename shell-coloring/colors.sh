#!/bin/bash

# Function to convert hex color to RGB
hex_to_rgb() {
    hex=$1
    echo $((16#${hex:1:2})) $((16#${hex:3:2})) $((16#${hex:5:2}))
}

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <guifg> <guibg>"
    echo "Example: $0 #d8dee9 #2e3440"
    exit 1
fi

# Extract RGB values from the provided colors
fg_rgb=($(hex_to_rgb $1))
bg_rgb=($(hex_to_rgb $2))

# Print the test string with the provided colors
echo -e "\033[38;2;${fg_rgb[0]};${fg_rgb[1]};${fg_rgb[2]}m\033[48;2;${bg_rgb[0]};${bg_rgb[1]};${bg_rgb[2]}mHello\033[0m"
