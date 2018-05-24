!#/bin/bash
mkdir ./epub
cd epub
unzip -a ../_book/_main.epub

cd media
#mogrify    -format jpg   *.png
mv file31.png ../
mv file32.png ../
ls *
for file in *.png
do
  echo converting $file
  prefix=$(echo $file | grep -E '(\w)+(\.png)' | grep -oE '^(\w)+')
  convert $file $prefix.jpg
  mv $prefix.jpg $prefix.png
done
cp ../file31.png .
cp ../file32.png .
cd ..
zip -r _main.epub *
mv _main.epub ../_book/_main.epub
cd ..
rm -rf ./epub
