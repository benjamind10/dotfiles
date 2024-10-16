#!/bin/bash

# This script is called by ranger to display images in kitty
# Kitty's kitten icat will display the image at the specified coordinates

kitty +kitten icat --transfer-mode=file --silent --stdin no --align left --place $2x$3@$4@$5 "$1"
