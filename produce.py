import os

name = 'lucid'
values = {
    # Scheme name
    "g:colors_name": name,
    # Color definitions
    's:gui00': '233', # Default background
    's:gui01': '237', # Lighter background (status bars)
    's:gui02': '241', # Selection background
    's:gui03': '246', # Comments, invisibles
    's:gui04': '250', # Dark foreground (status bars)
    's:gui05': '255', # Default foreground
    's:gui06': '254', # Light foreground (rarely used)
    's:gui07': '242', # Light background (rarely used)
    's:gui08': '131', # Debug, identifiers, diff delete
    's:gui09': '173', # Numbers, booleans, constants
    's:gui0A': '222', # Classes, labels
    's:gui0B': '143', # Strings, diff add
    's:gui0C': '109', # Escapes, regexp
    's:gui0D': '139', # Function, include, directory
    's:gui0E': '139', # Keywords, storage, diff change
    's:gui0F': '131', # Delimiters, specialchar
}

COLORS_DIR = os.path.join(os.path.dirname(__file__), 'colors')
TEMPL_PATH = os.path.join(os.path.dirname(__file__), 'template.vim')

colorscheme = open(TEMPL_PATH).read()
for key, value in values.items():
    colorscheme = colorscheme.replace('{'+key+'}', value)

outfilename = os.path.join(COLORS_DIR, name+'.vim')
open(outfilename, 'w').write(colorscheme)
