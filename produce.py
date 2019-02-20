import os

name = 'lucid'
values = {
    # Scheme name
    "g:colors_name": name,
    # Color definitions
    's:gui00': '234', # Default background
    's:gui01': '238', # Lighter background (status bars)
    's:gui02': '237', # Selection background
    's:gui03': '245', # Comments, invisibles
    's:gui04': '254', # Dark foreground (status bars)
    's:gui05': '253', # Default foreground
    's:gui06': '254', # Light foreground (rarely used)
    's:gui07': '234', # Light background (rarely used)
    's:gui08': '167', # Debug, identifiers, diff delete
    's:gui09': '116', # Numbers, booleans, constants
    's:gui0A': '110', # Classes, labels
    's:gui0B': '150', # Strings, diff add
    's:gui0C': '181', # Escapes, regexp
    's:gui0D': '216', # Function, include, directory
    's:gui0E': '110', # Keywords, storage, diff change
    's:gui0F': '181', # Delimiters, specialchar
}

COLORS_DIR = os.path.join(os.path.dirname(__file__), 'colors')
TEMPL_PATH = os.path.join(os.path.dirname(__file__), 'template.vim')

colorscheme = open(TEMPL_PATH).read()
for key, value in values.items():
    colorscheme = colorscheme.replace('{'+key+'}', value)

outfilename = os.path.join(COLORS_DIR, name+'.vim')
open(outfilename, 'w').write(colorscheme)
