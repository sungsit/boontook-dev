#!/usr/bin/env bash

# Autohinting with Adobe FDK.
# Copyright (c) 2014, Sungsit Sawaiwan

otfpath='./fonts-unhinted/otf'
hintedpath='./fonts/otf'

# creat hinted dir if not exist
if [ ! -d $tffpath ] ; then
  mkdir -p $hintedpath
fi

# clear old hinted fonts
oldhinted=$hintedpath/*.otf
rm $oldhinted

for font in $(find . -depth -name *.otf | grep $otfpath)
  #do autohint -q -c -r -o $hintedpath/$(basename $font .otf)'-hinted.otf' $font
  do autohint -q -c -r -o $hintedpath/$(basename $font .otf)'.otf' $font
done
