#!/usr/bin/env bash

# Usage:
#   yt-download link1 link2 link3 ...
#   yt-download links.txt   # if the first argument is a file, it reads links from it

# Exit on errors
set -e

# Read links from file or arguments
if [[ -f "$1" ]]; then
  mapfile -t LINKS < "$1"
else
  LINKS=("$@")
fi

TOTAL=${#LINKS[@]}
if [[ $TOTAL -eq 0 ]]; then
  echo "No links provided!"
  echo "Usage: yt-download link1 link2 ... OR yt-download links.txt"
  exit 1
fi

echo "Downloading $TOTAL videos..."

# Process each link
count=0
for link in "${LINKS[@]}"; do
  count=$((count + 1))
  echo -e "\n\n  Downloading ($count/$TOTAL): $link"
  yt-dlp --embed-thumbnail -f bestaudio -x --audio-format mp3 --audio-quality 320k "$link"
done

echo -e "\nAll downloads complete!"
exit 0
