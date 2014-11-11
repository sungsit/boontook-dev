# TODO

Make font generating script more portable and reusable :

1. Generate OTF from multiple layers SFD file `genfont.py`

   Usage: `python2 ./genfont.py <sfd file> <font family> <font extension>`

  `python2 ./genfont.py boontook-master.sfd BoonTook otf`

2. Hint OTF with [AFDKO](http://www.adobe.com/devnet/opentype/afdko.html) autohint

  `./hintotf.sh`

3. Generate TTF from hinted OTF with Freetype [ttfautohint](http://www.freetype.org/ttfautohint/)

  `./hintttf.sh`

4. Generate WOFF, WOFF2 (EOT and SVG? No, I suppose not) with [sfnt2woff](https://people.mozilla.org/~jkew/woff/), [woff2_compress](https://code.google.com/p/font-compression-reference/), [mkeot](http://www.w3.org/Tools/eot-utils/) or [eotlitetool](https://github.com/briangonzalez/eotlitetool.py)

  `./ttf2webfont.sh`
