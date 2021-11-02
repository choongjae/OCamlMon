from PIL import Image

def rgb_to_hex(r, g, b):
    hex = '0x{:02x}{:02x}{:02x}'.format(r, g, b)
    if hex == '0x000000':
        hex = 'transp'
    return hex

def list_to_array(lst):
    arr = ['[', '|', '\n']
    for row in lst:
        arr.append('[')
        arr.append('|')
        for col in row:
            arr.append(col)
            arr.append(';')
        arr.append('|')
        arr.append(']')
        arr.append(';')
        arr.append('\n')
    arr.append('|')
    arr.append(']')
    return "".join(arr)

if __name__ == "__main__":
    input = input("Image file: ")
    img = Image.open(input)
    pixels = img.convert('RGB')
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