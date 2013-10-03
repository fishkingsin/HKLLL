#build_icon.sh
convert Default@4x.png -resize "1024x1024^" -gravity center -crop 1024x1024+0+0 +repage temp.png
convert temp.png -gravity center -pointSize 350 -stroke  none -font ./HelveticaNeueUltraLight.ttf  -fill white    -annotate 0 'MECLL'  temp_label.png
convert temp_label.png -resize 152x152 Icon_152.png
convert temp_label.png -resize 144x144 Icon@4x.png
convert temp_label.png -resize 114x114 Icon@2x.png
convert temp_label.png -resize 120x120 Icon_120.png
convert temp_label.png -resize 72x72 Icon_72.png
convert temp_label.png -resize 76x76 Icon_76.png
convert temp_label.png -resize 29x29 Icon_29.png
convert temp_label.png -resize 58x58 Icon_58.png
convert temp_label.png -resize 80x80 Icon_80.png
convert temp_label.png -resize 50x50 Icon_50.png
convert temp_label.png -resize 100x100 Icon_100.png
convert temp_label.png -resize 40x40 Icon_40.png

rm temp.png temp_label.png
