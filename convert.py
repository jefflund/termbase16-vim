import glob
import re
import math
import os

SYS_RGB = [(0, 0, 0),
            (0xAA, 0, 0),
            (0, 0xAA, 0),
            (0xAA, 0x55, 0),
            (0, 0, 0xAA),
            (0xAA, 0, 0xAA),
            (0, 0xAA, 0xAA),
            (0xAA, 0xAA, 0xAA),
            (0x55, 0x55, 0x55),
            (0xFF, 0x55, 0xFF),
            (0x55, 0xFF, 0x55),
            (0xFF, 0xFF, 0x55),
            (0x55, 0x55, 0xFF),
            (0xFF, 0x55, 0xFF),
            (0x55, 0xFF, 0xFF),
            (0xFF, 0xFF, 0xFF)]
CUBE_RGB_VALS = [0, 95, 135, 175, 215, 255]

def to_rgb(code):
    if not (0 <= code <= 255):
        raise ValueError('Invalid rgb code')

    if code < 16:
        red, green, blue = SYS_RGB[code]
    elif code < 232:
        cube_red, code = divmod(code - 16, 36)
        cube_green, cube_blue = divmod(code, 6)
        red = CUBE_RGB_VALS[cube_red]
        green = CUBE_RGB_VALS[cube_green]
        blue = CUBE_RGB_VALS[cube_blue]
    else:
        gray = 8 + 10 * (code - 232)
        red, green, blue = gray, gray, gray

    return red, green, blue

COLORS = [to_rgb(code) for code in range(256)]

def convert_rgb(hex_str):
    R1, G1, B1 = [int(hex_str[i:i+2], base=16) for i in range(0, 6, 2)]
    def dist(code):
        R2, G2, B2 = COLORS[code]
        DR, DG, DB = R1-R2, G1-G2, B1-B2
        r = (R1+R2) / 2
        return math.sqrt((2+r/256) * DR**2 + 4*DG**2 + (2+(255-r)/256)*DB**2)
    return str(min(range(256), key=dist)).rjust(3, '0')

BASE16_DIR = os.path.join(os.path.dirname(__file__), 'base16')
COLORS_DIR = os.path.join(os.path.dirname(__file__), 'colors')
TEMPL_PATH = os.path.join(os.path.dirname(__file__), 'template.vim')
TEMPLATE = open(TEMPL_PATH).read()

for filename in glob.glob(os.path.join(BASE16_DIR, '*')):
    values = {}
    for line in open(filename):
        line = line.split()
        if line and line[0] == 'let':
            if line[1].startswith('s:gui0'):
                values[line[1]] = convert_rgb(line[-1][1:-1])
            elif line[1] == 'g:colors_name':
                values[line[1]] = 'term'+line[-1][1:-1]
    colorscheme = TEMPLATE
    for key, value in values.items():
        colorscheme = colorscheme.replace('{'+key+'}', value)

    outfilename = os.path.join(COLORS_DIR, 'term'+os.path.basename(filename))
    open(outfilename, 'w').write(colorscheme)
