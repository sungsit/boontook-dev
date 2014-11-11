#!/usr/bin/env bash

# Autohinting with Adobe FDK.
# Copyright (c) 2014, Sungsit Sawaiwan

ttfpath='./fonts/ttf'
woffpath='./fonts/woff'
woff2path='./fonts/woff2'
#eotpath='./fonts/eot'
sep='---------------------------------------------------------------'

# creat woff dir if not exist
if [ ! -d $woffpath ] ; then
  mkdir -p $woffpath
fi
if [ ! -d $woff2path ] ; then
  mkdir -p $woff2path
fi
#if [ ! -d $eotpath ] ; then
#  mkdir -p $eotpath
#fi

# clear old hinted fonts
rm $woffpath/*.woff
rm $woff2path/*.woff2
#rm $eotpath/*.eot
echo $sep

# Convert with fontforge
#for ttf in $ttfpath/*.ttf 
#  do fontforge -script any2woff.pe $ttf &&
#     mv $ttfpath/$(basename $ttf .ttf).woff $woffpath/.
#done

# Convert with sfnt2woff
for ttf in $ttfpath/*.ttf
  do sfnt2woff -v 1.0 -m woffmetadata.xml $ttf &&
     mv $ttfpath/$(basename $ttf .ttf).woff $woffpath/. &&
     echo 'Processing' $ttf '=>' $woffpath/$(basename $ttf .ttf).woff
done

echo $sep

# Convert ttf to woff2 with woff2_compress
for ttf in $ttfpath/*.ttf
  do woff2_compress $ttf &&
     mv $ttfpath/$(basename $ttf .ttf).woff2 $woff2path/.
done

echo $sep

# I don't mind IE<9 any more but in case you do.
#
# Convert ttf to eot with eotlitetool (doesn't seem to work)
#for ttf in $ttfpath/*.ttf
#  do python ./eotlitetool.py -o $(basename $ttf .ttf).eotlite $tff &&
     #mv $ttfpath/$(basename $ttf .ttf).eotlite $eotpath/$(basename $ttf .ttf).eot &&
#     echo 'Created ' $ttf 'to eot font.'
#done

# Convert ttf to eot with mkeot
#for ttf in $ttfpath/*.ttf
#  do mkeot $ttf '' '' > $eotpath/$(basename $ttf .ttf).eot &&
#     echo 'Processing' $ttf '=>' $eotpath/$(basename $ttf .ttf).eot
#done

#echo $sep
