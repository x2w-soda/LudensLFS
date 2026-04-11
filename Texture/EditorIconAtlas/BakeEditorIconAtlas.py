import os
import math
from PIL import Image
import cairosvg
import io
import re


def format_filename(filename):
    '''
    PascalCaseName.svg -> EDITOR_ICON_PASCAL_CASE_NAME
    '''
    base_name = os.path.splitext(filename)[0] # strip extension
    
    # "PascalCase" -> "Pascal_Case"
    # "ConsoleWindow" -> "Console_Window"
    words = re.sub(r'([a-z0-9])([A-Z])', r'\1_\2', base_name)
    
    return f"EDITOR_ICON_{words.upper()}"

def create_icon_atlas(in_folder, in_atlas_width, in_icon_size, out_file_path):
    svg_files = [f for f in os.listdir(in_folder) if f.endswith('.svg')]
    if len(svg_files) == 0:
        print("No SVG files found in the directory.")
        return

    num_icons = len(svg_files)
    num_icons_per_row = in_atlas_width // in_icon_size
    num_rows = math.ceil(num_icons / num_icons_per_row)

    atlas_width = in_atlas_width
    atlas_height = max(atlas_width, num_rows * in_icon_size)
    atlas = Image.new('RGBA', (atlas_width, atlas_height), (0, 0, 0, 0))

    print(f"creating icon atlas of size {atlas_width}x{atlas_height}")

    for index, filename in enumerate(svg_files):
        file_path = os.path.join(in_folder, filename)
        icon_name = format_filename(filename)
        
        png_data = cairosvg.svg2png(url=file_path, output_width=in_icon_size, output_height=in_icon_size)
        icon_image = Image.open(io.BytesIO(png_data))

        row = index // num_icons_per_row
        col = index % num_icons_per_row
        x = col * in_icon_size
        y = row * in_icon_size
        atlas.paste(icon_image, (x, y))
        print(f"{{ {icon_name}, Vec2({x}, {y}) }},")

    atlas.save(out_file_path)
    print(f"icon atlas saved to {out_file_path}")

if __name__ == "__main__":
    create_icon_atlas(
        in_folder='./',
        in_atlas_width=512,
        in_icon_size=48,
        out_file_path='EditorIconAtlas.png'
    )