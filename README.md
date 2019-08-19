# Scrabblehax v1.1
Scrabblehax is a Sony PSP savegame exploit for the game "Scrabble". This exploit will allow users to run unsigned code on the Sony PSP handheld system.
This github repo contains the source code of the Binary-Loader, ColorFlasher payload(by Frankler), and the exploitable savedata.
###
###

## Requirements:
* A Sony PSP/Vita
* A physical/digital copy of the game, Scrabble
* USB to go into USB-Mode for the PSP/Vita (To inject the save)
###
###

## Installing the exploit:
1. Boot your PSP into USB-Mode.
2. Navigate to the `/PSP/SAVEDATA/` directory.
3. Extract and copy the `ULUS10412` folder (from the `Release_v1.1.zip` archive) into the `/PSP/SAVEDATA/` directory.
###
###

## Triggering the exploit:
* Navigate to the scrabblehax profile (1st profile slot).
* Press the `X` button to `Continue`.
* Navigate to `OPTIONS` menu.
* Select the to `PROFILES`
* Watch the magic happpen :D
###
###

### Building:
* You'll need to set up the environment for `PSPSDK` (Windows users can simply setup the environment for `PSPSDK` and run the `.bat` files)

## Support:
* USA version of the game 
* Should work on any PSP handheld model
* 5.0.5 or lower PSP firmware.
###
###

## FAQ:
1. __Q:__ Why?
    - __A:__ Because why not? I wanted to learn more about MIPS Exploitation and exploit a Sony device :)
    
2. __Q:__ What can I do with this exploit?
    - __A:__ Run unsigned custom homebrew binaries (Something small yet but simple)

3. __Q:__ Does this work on a PSVita?
    - __A:__ I'm not sure but I can use some testers to confirm this for me :)

4. __Q:__ CanI install CFW using this exploit?
    - __A:__ You actually could but there's so much better exploits out there that can do that.

5. __Q:__ Will you do a writeup on your exploit?
    - __A:__ If you look in `NOTES.txt`, it's not that detailed but it's a straight-forward wrieup.


## Special Thanks to:
* [wololo](https://twitter.com/frwololo): Writeup to finding exploitable PSP games. (You can find it [here](http://wololo.net/2014/04/18/pspvita-how-to-find-your-own-exploits/))
* [qwikrazor87](https://twitter.com/qwikrazor87): Binary-Loader
* [Flankler](https://twitter.com/freakler94): Color Flash Payload
* TheOct0: Hardware PSP tester foe the exploit
###
## Exploit screenshot:
<img src="https://cdn.discordapp.com/attachments/346332428589334529/446484573715562506/Capture.JPG" width="320">
