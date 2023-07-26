# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

import stb_nim/stb_image

test "can load image":
  var
    width : int = 512
    height : int = 512
    channels : int = 0
    filename: cstring = cstring"testdata/image.png"
    img: cstring = stbi_load(filename, addr width, addr height, addr channels, 0);
  check not img.isNil
