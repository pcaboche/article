#! /usr/bin/sed -Ef

# This source code is under the BSD License
# Copyright 2022 Pierre S. Caboche

s/"(lyrics|title)_jp":/"\1_txt_ja":/
s/"(band|lyrics_by|music_by)":/"\1_str":/

