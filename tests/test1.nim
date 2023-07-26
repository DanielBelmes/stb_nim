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
    width : int
    height : int
    channels : int
    filename: cstring = cstring"testdata/image.png"
    img: cstring = stbi_load(filename, addr width, addr height, addr channels, STBI_default);
  check not img.isNil
