The VDP supports bitmaps and sprites via 'VDU 23, 27'

## Bitmaps

- `VDU 23, 27, 0, n`: Select bitmap n
- `VDU 23, 27, 1, w; h; b1, b2 ... bn`: Load colour bitmap data into current bitmap
- `VDU 23, 27, 2, w; h; col1; col2;`: Create an empty bitmap with 32 bit (rgba) colour col1,col2 into current bitmap
- `VDU 23, 27, 3, x; y;`: Draw current bitmap on screen at pixel position x, y

## Sprites

- `VDU 23, 27, 4, n`: Select sprite n
- `VDU 23, 27, 5`: Clear frames in current sprite
- `VDU 23, 27, 6, n`: Add bitmap n as a frame to current sprite
- `VDU 23, 27, 7, n`: Activate n sprites
- `VDU 23, 27, 8`: Select next frame of current sprite
- `VDU 23, 27, 9`: Select previous frame of current sprite
- `VDU 23, 27, 10, n`: Select the nth frame of current sprite
- `VDU 23, 27, 11`: Show current sprite
- `VDU 23, 27, 12`: Hide current sprite
- `VDU 23, 27, 13, x; y;`: Move current sprite to pixel position x, y
- `VDU 23, 27, 14, x; y;`: Move current sprite by x, y pixels
- `VDU 23, 27, 15`: Update the sprites in the GPU
- `VDU 23, 27, 16`: Reset the sprites and clear all data (Requires MOS 1.03 or above)