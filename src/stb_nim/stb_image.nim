import std/os
import std/strformat
const thisDir = currentSourcePath().parentDir()

{.emit: fmt"""
  #define STB_IMAGE_IMPLEMENTATION
  #include "{thisDir}/stb/stb_image.h"
""".}

const
  STBI_default* = 0
  STBI_grey* = 1
  STBI_grey_alpha* = 2
  STBI_rgb* = 3
  STBI_rgb_alpha* = 4

type
  stbi_io_callbacks = object
    read: proc(user: pointer, size: int): int {.cdecl.}
    skip: proc(user: pointer, n: int): void {.cdecl.}
    eof: proc(user: pointer): int {.cdecl.}

proc stbi_convert_iphone_png_to_rgb*(flag_true_if_should_convert: int): void {.cdecl, importc: "stbi_convert_iphone_png_to_rgb", header: "../stb/stb_image.h".}

proc stbi_failure_reason*(): cstring {.cdecl, importc: "stbi_failure_reason", header: "../stb/stb_image.h".}

proc stbi_hdr_to_ldr_gamma*(gamma: float): void {.cdecl, importc: "stbi_hdr_to_ldr_gamma", header: "../stb/stb_image.h".}
proc stbi_hdr_to_ldr_scale*(scale: float): void {.cdecl, importc: "stbi_hdr_to_ldr_scale", header: "../stb/stb_image.h".}
proc stbi_image_free*(retval_from_stbi_load: pointer): void {.cdecl, importc: "stbi_image_free", header: "../stb/stb_image.h".}

proc stbi_info_from_callbacks*(clbk: ptr stbi_io_callbacks, user: pointer, x: ptr int, y: ptr int, comp: ptr int): int {.cdecl, importc: "stbi_info_from_callbacks", header: "../stb/stb_image.h".}
proc stbi_info_from_file*(f: ptr File, x: ptr int, y: ptr int, comp: ptr int): int {.cdecl, importc: "stbi_info_from_file", header: "../stb/stb_image.h".}
proc stbi_info_from_memory*(buffer: cstring, len: int, x: ptr int, y: ptr int, comp: ptr int): int {.cdecl, importc: "stbi_info_from_memory", header: "../stb/stb_image.h".}

proc stbi_is_hdr*(filename: cstring): int {.cdecl, importc: "stbi_is_hdr", header: "../stb/stb_image.h".}
proc stbi_is_hdr_from_callbacks*(clbk: ptr stbi_io_callbacks, user: pointer): int {.cdecl, importc: "stbi_is_hdr_from_callbacks", header: "../stb/stb_image.h".}
proc stbi_is_hdr_from_file*(f: ptr File): int {.cdecl, importc: "stbi_is_hdr_from_file", header: "../stb/stb_image.h".}
proc stbi_is_hdr_from_memory*(buffer: cstring, len: int): int {.cdecl, importc: "stbi_is_hdr_from_memory", header: "../stb/stb_image.h".}

proc stbi_ldr_to_hdr_gamma*(gamma: float): void {.cdecl, importc: "stbi_ldr_to_hdr_gamma", header: "../stb/stb_image.h".}
proc stbi_ldr_to_hdr_scale*(scale: float): void {.cdecl, importc: "stbi_ldr_to_hdr_scale", header: "../stb/stb_image.h".}


proc stbi_load*(filename: cstring, x: ptr int, y: ptr int, comp: ptr int, req_comp: int): cstring {.cdecl, importc: "stbi_load", header: "../stb/stb_image.h".}
proc stbi_load_from_callbacks*(clbk: ptr stbi_io_callbacks, user: pointer, x: ptr int, y: ptr int, comp: ptr int, req_comp: int): cstring {.cdecl, importc: "stbi_load_from_callbacks", header: "../stb/stb_image.h".}
proc stbi_load_from_file*(f: ptr File, x: ptr int, y: ptr int, comp: ptr int, req_comp: int): cstring {.cdecl, importc: "stbi_load_from_file", header: "../stb/stb_image.h".}
proc stbi_load_from_memory*(buffer: cstring, len: int, x: ptr int, y: ptr int, comp: ptr int, req_comp: int): cstring {.cdecl, importc: "stbi_load_from_memory", header: "../stb/stb_image.h".}

proc stbi_loadf*(filename: cstring, x: ptr int, y: ptr int, comp: ptr int, req_comp: int): ptr float {.cdecl, importc: "stbi_loadf", header: "../stb/stb_image.h".}
proc stbi_loadf_from_callbacks*(clbk: ptr stbi_io_callbacks, user: pointer, x: ptr int, y: ptr int, comp: ptr int, req_comp: int): ptr float {.cdecl, importc: "stbi_loadf_from_callbacks", header: "../stb/stb_image.h".}
proc stbi_loadf_from_file*(f: ptr File, x: ptr int, y: ptr int, comp: ptr int, req_comp: int): ptr float {.cdecl, importc: "stbi_loadf_from_file", header: "../stb/stb_image.h".}
proc stbi_loadf_from_memory*(buffer: cstring, len: int, x: ptr int, y: ptr int, comp: ptr int, req_comp: int): ptr float {.cdecl, importc: "stbi_loadf_from_memory", header: "../stb/stb_image.h".}

proc stbi_set_flip_vertically_on_load*(flag_true_if_should_flip: int): void {.cdecl, importc: "stbi_set_flip_vertically_on_load", header: "../stb/stb_image.h".}
proc stbi_set_unpremultiply_on_load*(flag_true_if_should_unpremultiply: int): void {.cdecl, importc: "stbi_set_unpremultiply_on_load", header: "../stb/stb_image.h".}

proc stbi_zlib_decode_buffer*(obuffer: cstring, olen: int, ibuffer: cstring, ilen: int): int {.cdecl, importc: "stbi_zlib_decode_buffer", header: "../stb/stb_image.h".}


proc stbi_zlib_decode_malloc*(buffer: cstring, len: int, outlen: ptr int) {.cdecl, importc: "stbi_zlib_decode_malloc", header: "../stb/stb_image.h".}
proc stbi_zlib_decode_malloc_guesssize*(buffer: cstring, len: int, initial_size: int, outlen: ptr int) {.cdecl, importc: "stbi_zlib_decode_malloc_guesssize", header: "../stb/stb_image.h".}
proc stbi_zlib_decode_malloc_guesssize_headerflag*(buffer: cstring, len: int, initial_size: int, outlen: ptr int, parse_header: int) {.cdecl, importc: "stbi_zlib_decode_malloc_guesssize_headerflag", header: "../stb/stb_image.h".}
proc stbi_zlib_decode_noheader_buffer*(obuffer: cstring, olen: int, ibuffer: cstring, ilen: int) {.cdecl, importc: "stbi_zlib_decode_noheader_buffer", header: "../stb/stb_image.h".}
proc stbi_zlib_decode_noheader_malloc*(buffer: cstring, len: int, outlen: ptr int) {.cdecl, importc: "stbi_zlib_decode_noheader_malloc", header: "../stb/stb_image.h".}
