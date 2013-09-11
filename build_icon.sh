#build_icon.sh
convert Default@4x.png -resize "1024x1024^" -gravity center -crop 1024x1024+0+0 +repage temp.png
convert temp.png -gravity center -pointSize 350 -stroke  none -font ./HelveticaNeueUltraLight.ttf  -fill white    -annotate 0 'MECLL'  temp_label.png
convert temp_label.png -resize 144x144 Icon@4x.png
convert temp_label.png -resize 114x114 Icon@2x.png
convert temp_label.png -resize 57x57 Icon.png
rm temp.png temp_label.png
