#!/bin/bash
# This script will help you show the hidden files, such as __MACOSX, on mac;
# You have to remove the hidden files before you submit the source file of your paper to the IEEE website. 
# The information is found at http://www.macworld.co.uk/how-to/mac-software/how-show-hidden-files-in-mac-os-x-finder-3520878/

# show all hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# hide the system files
defaults write com.apple.finder AppleShowAllFiles NO

# IEEE reply about the hidden files
# In the zip folder, the subfolder named _MACOSX contains a copy of your folder and files within. This is a hidden folder created by the MAC but is seen by other platforms like our automated system where it is seen to have 2 DVIs in a LaTeX zip file.  Once you've created a zip file you can remove the _MACOSX subfolder by running this command: zip -d filename.zip __MACOSX/\*
