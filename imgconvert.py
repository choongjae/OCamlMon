"""
Python script for converting image files (png) into OCaml arrays of hexademical
color values, to be used in conjunction with the OCaml Graphics library to
generate sprites for OCamlMon.

Authors: CJ Lee, Kimmy Lin, Sabrina Li
"""

from PIL import Image

def rgb_to_hex(r, g, b, a):
    if a == 0:
        hex = '"transp"'
    else:
        hex = '"0x{:02x}{:02x}{:02x}"'.format(r, g, b)
    return hex

def list_to_array(lst):
    arr = ['[', '\n']
    for row in lst:
        arr.append('[')
        # arr.append('|')
        for col in row:
            arr.append(col)
            arr.append(',')
        # arr.append('|')
        arr[-1] = ""
        arr.append(']')
        arr.append(',')
        arr.append('\n')
    # arr.append('|')
    arr[-1] = ""
    arr.append(']')
    return "".join(arr)

if __name__ == "__main__":
    input = input("Image file: ")
    img = Image.open(input)
    pixels = img.convert('RGBA')
    size = img.size

    lst = []
    for row in range(size[0]):
        lst.append([])
        for col in range(size[1]):
            lst[-1].append(rgb_to_hex(*(pixels.getpixel((row, col)))))

    lst = list(map(list, zip(*lst)))

    result = list_to_array(lst)
    output = open("imgoutput.txt", "w")
    output.write(result)
