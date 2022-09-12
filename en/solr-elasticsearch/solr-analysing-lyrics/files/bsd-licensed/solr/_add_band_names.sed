#! /usr/bin/sed -Ef 

# This source code is under the BSD License
# Copyright 2022 Pierre S. Caboche

s/^(\s*"(.*)",(.*),?)/\2 \& \& \3 \\\\/
/^$/d

s/^(松任谷由実) & &/\1 \& Matsutōya Yumi \&/
s/^(ゆず) & &/\1 \& Yuzu \&/
s/^(サザンオールスターズ) & &/\1 \& Southern All Stars \&/
s/^(徳永英明) & &/\1 \& Tokunaga Hideaki \&/
s/^(人間椅子) & &/\1 \& Ningen Isu \&/
s/^(都はるみ) & &/\1 \& Miyako Harumi \&/
s/^(石川さゆり) & &/\1 \& Ishikawa Sayuri \&/
s/^(米津玄師) & &/\1 \& Younezu Kenshi \&/
s/^(ザ・クロマニヨンズ) & &/\1 \& The Cro-Magnons \&/
s/^(ザ・ハイロウズ) & &/\1 \& The High-Lows \&/
s/^(カネコアヤノ) & &/\1 \& Kaneko Ayano \&/
s/^(ゴールデンボンバー) & &/\1 \& Golden Bomber \&/
s/^(いきものがかり) & &/\1 \& Ikimonogakari \&/
s/^(河島英五) & &/\1 \& Kawashima Eigo \&/


## add emphasis
s/^([^&]*)& ([^&]*) &/\1\& \\emph{\2} \&/
 

