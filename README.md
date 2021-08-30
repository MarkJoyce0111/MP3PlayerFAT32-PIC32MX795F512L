# MP3PlayerFAT32-PIC32MX795F512L
MP3 player for FAT32. PIC32MX795F512L on Mikroelektronika Easy Pic Fusion 7.
Mikroelektronika dont give an example of how to use modern SD cards ie FAT32 and VS1011E codec (chip), only FAT and old cards you can only get on ebay now days.
So for FAT32 format and any card here you go.
Notes
/*
 * Project name:
     MP3 (Demonstration of on-board audio module)
     Now for FAT32
 * Copyright:
     (c) Mikroelektronika, 2012.
 * Revision History:
     20120810:
       - initial release (FJ);
     20200920:
       - Fat 32 Mark Joyce 2020
 * Description:
     This project demonstrates communication with VS1011E mp3 codec.
     Program reads one mp3 file from SDHC and sends it to VS1011E for decoding
     and playing. SDHC and MP3_SCI share Hardware SPI module.
 * Test configuration:
     MCU:             P32MX795F512L
                      http://ww1.microchip.com/downloads/en/DeviceDoc/61156F.pdf
     Dev.Board:       EasyPIC Fusion v7 - ac:MP3
                      http://www.mikroe.com/easypic-fusion/
     Oscillator:      XT-PLL, 80.0000MHz
     Ext. Modules:    EasyTFT display - ac:EasyTFT
     SW:              mikroC PRO for PIC32
                      http://www.mikroe.com/mikroc/pic32/
 * NOTES:
     - Turn on SPI and AUDIO switches at switch SW13. (board specific)
     - Turn on microSD card switches at SW14. (board specific)
     - Turn on TFT backlight on SW11.1. (board specific)
     - Put PORTA switches in the pull-down position and turn on Button Press
       Level switch SW10 for PORTA&C.
     - Use RA1 and RA5 to increase volume for left and right channels,
       RA0 and RA4 do decrease volume for left and right channels, respecively.
     - MP3 file should have the following name : "hello_my_name_is_mark.mp3.mp3".
     Attention! Trap for new players.
     - ! The audio jack on the decoder is not compatable with all plugs (headphones etc), you may
          have to pull it out a bit to make a connection.
 */
