#!/bin/bash
echo "Setting up Convert.";
# converting JPEG images Udana
find $1 -type f -and \( -iname "*.jpg" -o -iname "*.jpeg" \) \
-exec bash -c '
webp_path=$(sed 's/\.[^.]*$/.jpg.webp/' <<< "$0"); # to replace the extension
if [ ! -f "$webp_path" ]; then 
  cwebp -quiet -q 50 "$0" -o "$webp_path";
fi;' {} \;

# converting PNG images
#webp_path=$(sed 's/\.[^.]*$/.webp/' <<< "$0"); # to replace the extension
#webp_path=$.webp; #adding webp to the end

find $1 -type f -and -iname "*.png" \
-exec bash -c '
webp_path=$(sed 's/\.[^.]*$/.png.webp/' <<< "$0"); # to replace the extension
if [ ! -f "$webp_path" ]; then 
  cwebp -quiet -lossless "$0" -o "$webp_path";
fi;' {} \;