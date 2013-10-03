#build-icon.sh
convert Default-Portrait~ipad.png -resize "1024x1024^" -gravity center -crop 1024x1024+0+0 +repage temp.png
convert temp.png -gravity center -pointSize 350 -stroke  none -font ./HelveticaNeueUltraLight.ttf  -fill white    -annotate 0 'MECLL'  temp-label.png
convert temp-label.png -resize 57x57 Icon.png
convert temp-label.png -resize 152x152 Icon-152.png
convert temp-label.png -resize 144x144 Icon-72@2x.png
convert temp-label.png -resize 114x114 Icon@2x.png
convert temp-label.png -resize 120x120 Icon-120.png
convert temp-label.png -resize 72x72 Icon-72.png
convert temp-label.png -resize 76x76 Icon-76.png
convert temp-label.png -resize 29x29 Icon-Small.png
convert temp-label.png -resize 58x58 Icon-Small@2x.png
convert temp-label.png -resize 80x80 Icon-80.png
convert temp-label.png -resize 50x50 Icon-Small-50.png
convert temp-label.png -resize 100x100 Icon-Small-50@2x.png	
convert temp-label.png -resize 40x40 Icon-40.png

rm temp.png temp-label.png
