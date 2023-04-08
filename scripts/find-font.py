import subprocess
from fontTools.ttLib import TTFont
import os
import pyperclip


initial_rofi_command = r'rofi -dmenu -p character\s:'
initial_rofi_process = subprocess.Popen(
    initial_rofi_command.split(),
    stdout=subprocess.PIPE
)
initial_rofi_output, _ = initial_rofi_process.communicate()
search_char = initial_rofi_output.decode()[:-1]

fonts = []

for root, dirs, files in os.walk("/usr/share/fonts/"):
    for file in files:
        if file.endswith(".ttf"):
            fonts.append(os.path.join(root, file))


# def chars_in_font(unicode_chars, font):
#     for cmap_table in font['cmap'].tables:
#         if cmap_table.isUnicode():
#             cmap_table_containes = True
#             for unicode_char in set(unicode_chars):
#                 if ord(unicode_char) in cmap_table.cmap:
#                     cmap_table_containes = False
#     return cmap_table_containes


def and_chars_in_font(unicode_chars, font):
    if len(unicode_chars) == 0:
        return False

    if len(unicode_chars) == 1:
        return char_in_font(unicode_chars, font)

    for char in set(unicode_chars):
        if not char_in_font(char, font):
            return False
    return True


def or_chars_in_font(unicode_chars, font):
    if len(unicode_chars) == 0:
        return False

    if len(unicode_chars) == 1:
        return char_in_font(unicode_chars, font)

    for char in set(unicode_chars):
        if char_in_font(char, font):
            return True
    return False


def char_in_font(unicode_char, font):
    for cmap in font['cmap'].tables:
        if cmap.isUnicode():
            if ord(unicode_char) in cmap.cmap:
                return True
    return False


def test(string):
    fonts_with_chars = ''

    for fontpath in fonts:
        font = TTFont(fontpath)   # specify the path to the font in question
        if len(string) == 0:
            continue
        elif and_chars_in_font(string, font):
            fonts_with_chars += fontpath + '\n'

    rofi_command =\
        f'echo "{fonts_with_chars}"'\
        + f'| rofi -dmenu -p "fonts containing all of {string}"'
    process = subprocess.Popen(
        rofi_command,
        shell=True,
        stdout=subprocess.PIPE
    )
    output, error = process.communicate()
    return output.decode()


pyperclip.copy(test(search_char))
