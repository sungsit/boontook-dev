#!/usr/bin/env python

# An ugly script to generate @font-face stylesheet

import os
import fontforge

fontdir = './fonts/woff/'
css = open('./fonts/css/fonts.css', 'wb')
css.write( '@charset "UTF-8";\n\n')

for file in os.listdir(fontdir):
  if file.endswith('.woff'):

    print(file)
    name = file.strip('.woff')
    print(name)

    font = fontforge.open(fontdir+file)

    css.write('@font-face {\n')
    css.write('  font-family: "' + font.familyname + '";\n')
    css.write('  src: url(../woff2/' + font.fontname + '.woff2) format("woff2"),\n')
    css.write('       url(../woff/' + font.fontname + '.woff) format("woff");\n')
    css.write('  font-weight: normal;\n')
    if font.italicangle < 0:
        css.write('  font-style: oblique;\n')
    else:
        css.write('  font-style: normal;\n')
    css.write( '}\n')

    font.close()





# Loop fonts dir
# get font.familyname by fontforge
# print stylesheet

css.close()

'''
Ref

@font-face {
	font-family: 'MyFontFamily';
	src: url('myfont-webfont.eot?#iefix') format('embedded-opentype'),
         url('webfont.woff2') format('woff2'),
	     url('myfont-webfont.woff') format('woff'), 
	     url('myfont-webfont.ttf')  format('truetype'),
	}
'''