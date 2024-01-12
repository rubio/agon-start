#!/bin/bash
set -e
DATE=`date +%m-%d-%Y`
DOWNLOAD=download
FOLDERNAME=SD_card

cleanup () {
    rm -rf $FOLDERNAME
    rm -rf $DOWNLOAD
}

cleanup

#create folders
mkdir $DOWNLOAD
mkdir $FOLDERNAME
mkdir $FOLDERNAME/mos
mkdir $FOLDERNAME/utils
mkdir $FOLDERNAME/demos
mkdir $FOLDERNAME/demos/badapple
mkdir $FOLDERNAME/games
mkdir $FOLDERNAME/games/game-library
mkdir $FOLDERNAME/games/haunted_house
mkdir $FOLDERNAME/games/rokky
mkdir $FOLDERNAME/games/sokoban
mkdir $FOLDERNAME/docs
mkdir $FOLDERNAME/extras
mkdir $FOLDERNAME/extras/The-8bit-Noob/agon_demo_{01..08} -p

#Download full repos
cd $DOWNLOAD
git clone https://github.com/breakintoprogram/agon-bbc-basic.git
git clone https://github.com/lennart-benschop/agon-utilities.git
git clone https://github.com/lennart-benschop/agon-forth.git
git clone https://github.com/sijnstra/agon-projects.git
git clone https://github.com/envenomator/agon-sokoban.git
git clone https://github.com/nihirash/Agon-rokky.git
git clone https://github.com/breakintoprogram/agon-docs.wiki.git
git clone https://github.com/tomm/toms-agon-experiments.git
git clone https://github.com/DjPoke/Agon-Light-sprite-edition-suite.git
git clone https://github.com/breakintoprogram/agon-bbc-basic-adl.git
git clone https://github.com/envenomator/agon-flash.git
git clone https://github.com/avalonbits/aed.git
git clone https://github.com/eightbitswide/AgonLight-Game-Library.git
git clone https://github.com/learnagon/vdp_study.git
git clone https://github.com/The-8bit-Noob/Haunted_House.git
git clone https://github.com/The-8bit-Noob/AGON_DEMO_01_UDC1.git
git clone https://github.com/The-8bit-Noob/AGON_DEMO_02_UDC2.git
git clone https://github.com/The-8bit-Noob/AGON_DEMO_03_UDC3.git
git clone https://github.com/The-8bit-Noob/AGON_DEMO_04_SPRITES1.git
git clone https://github.com/The-8bit-Noob/AGON_DEMO_05_SPRITES2.git
git clone https://github.com/The-8bit-Noob/AGON_DEMO_06_SPRITES3.git
git clone https://github.com/The-8bit-Noob/AGON_DEMO_07_SPRITES4.git
git clone https://github.com/The-8bit-Noob/AGON_DEMO_08_DRAWTEXT1.git
curl -s https://api.github.com/repos/breakintoprogram/agon-bbc-basic/releases/latest \
| grep "browser_download_url.*bin" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
curl -s https://api.github.com/repos/breakintoprogram/agon-bbc-basic-adl/releases/latest \
| grep "browser_download_url.*bin" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
curl -s https://api.github.com/repos/breakintoprogram/agon-mos/releases/latest \
| grep "browser_download_url.*bin" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
curl -s https://api.github.com/repos/envenomator/agon-ez80asm/releases/latest \
| grep "browser_download_url.*zip" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
wget -q https://movievertigo.github.io/downloads/agonlight/badapple/agonlightbadapple.zip
cd ..

#root folder
echo -e "SET KEYBOARD 1\nLOAD bbcbasic.bin\nrun" > $FOLDERNAME/autoexec.txt
cp $DOWNLOAD/MOS.bin $FOLDERNAME/
crc32 $DOWNLOAD/MOS.bin > $FOLDERNAME/MOS.crc32
cp $DOWNLOAD/bbcbasic.bin $FOLDERNAME/
cp $DOWNLOAD/bbcbasic24.bin $FOLDERNAME/
cp -r $DOWNLOAD/agon-forth/forth16/ $FOLDERNAME/forth16

#games
cp $DOWNLOAD/agon-sokoban/binaries/* $FOLDERNAME/games/sokoban/
cp -r $DOWNLOAD/Agon-rokky/bin/* $FOLDERNAME/games/rokky/
cp -r $DOWNLOAD/Haunted_House/* $FOLDERNAME/games/haunted_house/
cp -r $DOWNLOAD/AgonLight-Game-Library/* $FOLDERNAME/games/game-library

#utils
cp $DOWNLOAD/toms-agon-experiments/agon-bench/bin/agon-bench.bin $FOLDERNAME/utils/

#docs
cp $DOWNLOAD/agon-docs.wiki/*.md $FOLDERNAME/docs/

#mos
cd $FOLDERNAME/mos
cp ../../$DOWNLOAD/agon-utilities/Nano/Release/Nano.bin .
cp ../../$DOWNLOAD/agon-utilities/Comp/Release/Comp.bin .
cp ../../$DOWNLOAD/agon-utilities/More/Release/More.bin .
cp ../../$DOWNLOAD/agon-utilities/Memfill/Release/Memfill.bin .
cp ../../$DOWNLOAD/agon-projects/hexdump/Release/hexdump.bin .
cp ../../$DOWNLOAD/agon-projects/hexdumpm/Release/hexdumpm.bin .
cp ../../$DOWNLOAD/agon-projects/strings/Release/strings.bin .
unzip ../../$DOWNLOAD/ez80asm_agon.zip
curl -s https://api.github.com/repos/envenomator/agon-flash/releases/latest \
| grep "browser_download_url.*bin" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
curl -s https://api.github.com/repos/envenomator/agon-hexload/releases/latest \
| grep "browser_download_url.*bin" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
curl -s https://api.github.com/repos/envenomator/agon-hexload/releases/latest \
| grep "browser_download_url.*dll" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
cd ../..

#demos
cd $FOLDERNAME/demos/badapple
unzip ../../../$DOWNLOAD/agonlightbadapple.zip
cd ../../..

#extras
cd $FOLDERNAME/extras
cp -r ../../$DOWNLOAD/Agon-Light-sprite-edition-suite .
cp -r ../../$DOWNLOAD/vdp_study .
cp -r ../../$DOWNLOAD/AGON_DEMO_01*/* The-8bit-Noob/agon_demo_01/
cp -r ../../$DOWNLOAD/AGON_DEMO_02*/* The-8bit-Noob/agon_demo_02/
cp -r ../../$DOWNLOAD/AGON_DEMO_03*/* The-8bit-Noob/agon_demo_03/
cp -r ../../$DOWNLOAD/AGON_DEMO_04*/* The-8bit-Noob/agon_demo_04/
cp -r ../../$DOWNLOAD/AGON_DEMO_05*/* The-8bit-Noob/agon_demo_05/
cp -r ../../$DOWNLOAD/AGON_DEMO_06*/* The-8bit-Noob/agon_demo_06/
cp -r ../../$DOWNLOAD/AGON_DEMO_07*/* The-8bit-Noob/agon_demo_07/
cp -r ../../$DOWNLOAD/AGON_DEMO_08*/* The-8bit-Noob/agon_demo_08/
cd ../..

find $FOLDERNAME -name .git | xargs rm -rf 
zip -r $FOLDERNAME.zip $FOLDERNAME/

