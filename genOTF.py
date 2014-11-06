#!/usr/bin/env python

# An ugly script to generate fonts from multi-layers SFD file.
# Copyright (c) 2014, Sungsit Sawaiwan
#
# argv[1] = sfd file
# argv[2] = font family name
# NOT implemented yet: argv[3] = desired font format (otf, ttf, woff, svg)

import sys,os
from datetime import datetime
import fontforge

fontfile = sys.argv[1]
font = fontforge.open(fontfile)

print sys.argv[2],'generated date:', datetime.now()
sep = '\n========================================================\n'

print sep
print 'SFD source file: ', fontfile

# Change copyright text here
font.copyright = 'Copyright (c) 2014, Sungsit Sawaiwan (http://sungsit.com | gibbozer [at] gmail [dot] com]), with Reserved Font Names "BoonTook".'
font.version = '1.0'

# Check some font properties

print sep

fontdir = './fonts/otf/'
feadir = './features/'
dirs = [fontdir, feadir]
for d in dirs:
  if not os.path.exists(d):
    os.makedirs(d)

# save full feature file
font.generateFeatureFile(feadir + sys.argv[2] + '.fea')


cnt = font.layer_cnt

i = 0
while (i < cnt):
  if i > 1: # Exclude first two layers (Back & Fore)
    layername = font.layers[i].name

    #font.layers[layername].select
    fullname = sys.argv[2] + ' ' + layername

    psname = fullname.replace(' ','-')
    font.fontname = psname
    font.fullname = fullname
    filename = psname

    if layername.endswith(' Oblique'):
      subfamily = layername.strip(' Oblique')
      font.italicangle = -9.0
      # import italic .fea
    else:
      subfamily = layername
      font.italicangle = 0.0

    font.familyname = sys.argv[2] + ' ' + subfamily

    otfname = filename + '.otf'
    # gen layer to font file
    font.generate(fontdir+otfname,layer=layername)

    # checking
    nfile = fontdir + otfname
    n = fontforge.open(nfile)

    # print some font prop 
    print 'Font family:', n.familyname
    print 'PS name:', n.fontname
    print 'Human name:', n.fullname
    print 'Font weight:', n.weight
    print 'OS2 weight:', n.os2_weight
    print 'Italic angle:', n.italicangle
    print 'File path:', nfile
    print 'Font version:', n.version
    n.close()

    print sep
  i += 1

print font.copyright

font.save(fontfile)
font.close()


