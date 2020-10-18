import json
import shutil

import requests
from PIL import Image
from colr import color

# width, height
_term_size = shutil.get_terminal_size()
IMG_SIZE = (_term_size.columns, _term_size.lines)

PRINT_CHAR = 'X'


def get_shiba_address(shiba_count: int = 1) -> list[str]:
    """
    Have to go to the learn the home address(es) of our shiba(s).
    Calls shiba.online API, gets URL(s) to shibas, returns it as an array.
    :param shiba_count: number of shiba url's wanted
    :return: list of urls of shiba pics
    """
    shiba_content = requests.get(f'http://shibe.online/api/shibes?count={shiba_count}').content
    shibarray = json.loads(shiba_content)
    return shibarray


def summon_molten_shiba(shiba_url: str):
    """
    Downloads the shiba from the shiba_url as raw data.
    :param shiba_url: A single image url of a shiba
    :return: raw image data
    """
    summon = requests.get(shiba_url, stream = True)
    raw_shiba_juice = summon.raw
    raw_shiba_juice.decode_content = True
    return raw_shiba_juice


def open_shiba(raw_image) -> Image:
    """
    Opens raw image file w/ pillow, resizes it, and returns the image object
    :param raw_image: raw image
    :return: pillow image
    """
    return Image.open(raw_image).resize(IMG_SIZE).getdata()


def spit_out_shiba(shiba_image: Image):
    """
    Prints out shiba - gets pixel color of image, prints a char with that color, jumps to new line if width index hit.
    :param shiba_image: pillow image object
    """
    width, height = shiba_image.size
    [
        print(color(PRINT_CHAR, fore=pixel), end='\n' if (index + 1) % width == 0 else '')
        for index, pixel in enumerate(shiba_image)
    ]


def loop_all_shibas(shiba_count: int = 1):
    """
    Main shiba summoning func.
    :param shiba_count: count of shibas needed
    """
    urls = get_shiba_address(shiba_count)
    for shibaddress in urls:
        raw_shiba = summon_molten_shiba(shibaddress)
        shibimage = open_shiba(raw_shiba)
        spit_out_shiba(shibimage)
        print()

loop_all_shibas(1)

