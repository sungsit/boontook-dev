#!/usr/bin/env bash

# Autohinting with Adobe FDK.
# Copyright (c) 2014, Sungsit Sawaiwan

otfpath='./fonts/otf'
ttfpath='./fonts/ttf'

# creat woff dir if not exist
if [ ! -d $tffpath ] ; then
  mkdir -p $ttfpath
fi

# clear old hinted fonts
rm $otfpath/*.ttf
rm $ttfpath/*.ttf

for font in $otfpath/*.otf 
  do fontforge -script ./any2ttf.pe $font
  #do echo $font $otfpath/ $ttfpath/
done

for ttf in $otfpath/*.ttf
  do ttfautohint -i -c -n -W -w D -f latn $ttf $ttfpath/$(basename $ttf) -v
# do $ttfpath/$(basename $otf .otf)
done

rm $otfpath/*.ttf
