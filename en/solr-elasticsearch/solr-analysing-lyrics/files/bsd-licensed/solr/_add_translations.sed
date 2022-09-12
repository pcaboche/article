#! /bin/sed -Ef

# This source code is under the BSD License
# Copyright 2022 Pierre S. Caboche

/^$/d

s/^(\s*"(.*)",?([0-9]*)),?$/\2 \& \& \& \3 \\\\/

# English words -> do not add translation
s/^([a-zA-Z]*) & & &/\1 \& - \& - \&/	

/てる/d
s/^(人) & & &/\1 \& hito \& person \&/
s/^(誰) & & &/\1 \& dare \& who \&/
s/^(だれ) & & &/\1 \& dare \& 誰: who \&/
s/^(夢) & & &/\1 \& yume \& dream \&/
s/^(心) & & &/\1 \& kokoro \& heart, mind, spirit\&/
s/^(今) & & &/\1 \& ima \& now \&/
s/^(いま) & & &/\1 \& ima \& 今: now \&/
s/^(愛) & & &/\1 \& ai \& love \&/
s/^(何) & & &/\1 \& nani \&  what \&/
s/^(なに) & & &/\1 \& nani \& 何: what \&/
s/^(なん) & & &/\1 \& nan \& 何: what \&/
s/^(君) & & &/\1 \& kimi \& you, buddy, pal \&/
s/^(きみ|キミ) & & &/\1 \& kimi \& 君: you, buddy, pal \&/
s/^(僕) & & &/\1 \& boku \&  I, me (Pronoun, Male term) \&/
s/^(ぼく|ボク) & & &/\1 \& boku \&  僕: I, me (Pronoun, Male term) \&/
s/^(空) & & &/\1 \& sora \& sky \&/
s/^(日) & & &/\1 \& hi, nichi \& day \&/
s/^(見る) & & &/\1 \& miru \& to see \&/
s/^(みる) & & &/\1 \& miru \& 見る: to see \&/
s/^(いい) & & &/\1 \& ii \& good, excellent, fine, nice \&/
s/^(中) & & &/\1 \& naka \& inside \&/	
s/^(私) & & &/\1 \& watashi \& I, me (Pronoun, slightly formal or feminine) \&/
s/^(わたし) & & &/\1 \& watashi \& 私: I, me (Pronoun, slightly formal or feminine) \&/
s/^(あなた) & & &/\1 \& anata \& you \&/
s/^(来る) & & &/\1 \& kuru \& to come \&/
s/^(くる) & & &/\1 \& kuru \& 来: to come \&/
#	s/^(風) & & & ([0-9]*).*/\1 \& kaze \& wind \& \2 \\\\\n   \& fuu \& method, manner, way, style \& \\\\/
s/^(風) & & &/\1 \& kaze \& wind \&/
s/^(時) & & &/\1 \& toki \& time, hour, moment \&/
s/^(そう) & & &/\1 \& sou \& looking like \&/
s/^(どこ) & & &/\1 \& doko \& where, what place \&/
s/^(涙|泪|涕|なみだ) & & &/\1 \& namida \& tears \&/	
s/^(胸) & & &/\1 \& mune \& chest, breast, heart \&/
s/^(行く) & & &/\1 \& iku \& to go \&/
s/^(いく|ゆく) & & &/\1 \& iku \& 行く: to go \&/
s/^(あの) & & &/\1 \& ano \& that, those, the \&/
s/^(夜) & & &/\1 \& yoru \& evening, night \&/
s/^(恋) & & &/\1 \& koi \& (romantic) love \&/
s/^(一) & & &/\1 \& ichi \& one \&/
s/^(まま) & & &/\1 \& mama \& as it is, as one likes \&/
s/^(生きる) & & &/\1 \& ikiru \& to live, to exist \&/
s/^(自分) & & &/\1 \& jibun \& I, me, myself, yourself, oneself (Pronoun) \&/
s/^(明日) & & &/\1 \& ashita, asu \& tomorrow, (only "asu") the near future \&/
s/^(手) & & &/\1 \& te \& hand, arm \&/
s/^(知る) & & &/\1 \& shiru \&  to be aware of, to know, to be conscious of \&/
s/^(きれる) & & &/\1 \& kireru \& 切れる: to break, to snap \&/
s/^(歩く) & & &/\1 \& aruku \& to walk \&/
s/^(忘れる) & & &/\1 \& wasureru \& to forget \&/
s/^(声) & & &/\1 \& koe \& voice \&/
s/^(目) & & &/\1 \& me \& eye \&/
s/^(ずっと) & & &/\1 \& zutto \& continuously, throughout \&/
s/^(言う) & & &/\1 \& iu \& to say \&/
s/^(いつ) & & &/\1 \& itsu \& when, at what time \&/
s/^(未来) & & &/\1 \& mirai \& the future (usually distant) \&/
s/^(信じる) & & &/\1 \& shinjiru \& to believe, to place trust in, to have faith in \&/
s/^(いつも) & & &/\1 \& itsumo \& always, all the time, at all times \&/
s/^(今日) & & &/\1 \& kyou \& today \&/
s/^(道) & & &/\1 \& machi \& road, path, street, lane \&/
s/^(言葉) & & &/\1 \& kotoba \& word, phrase\&/
s/^(前) & & &/\1 \& mae \& in front (of), before \&/
s/^(もう) & & &/\1 \& mou \& already, yet, by now\&/
s/^(見える) & & &/\1 \& mieru \& to be seen, to be in sight, to appear \&/
s/^(みえる) & & &/\1 \& mieru \& 見える: to be seen, to be in sight \&/
s/^(きっと) & & &/\1 \& kitto \& surely, undoubtedly, almost certainly \&/
s/^(世界) & & &/\1 \& sekai \& the world, society, the universe \&/
s/^(いつか) & & &/\1 \& itsuka \& sometime, someday, one day \&/
s/^(待つ) & & &/\1 \& matsu \& to wait \&/
s/^(思う) & & &/\1 \& omou \& to think, to consider, to believe, to reckon\&/
s/^(泣く) & & &/\1 \& naku \& to cry, to weep, to sob \&/
s/^(好き) & & &/\1 \& suki \& liked, well-liked, in love (with) \&/
s/^(街) & & &/\1 \& gai \& \\dots\\ street, \\dots\\ quarter, \\dots\\ district \&/
s/^(全て) & & &/\1 \& subete \& everything, all, the whole \&/
s/^(すべて) & & &/\1 \& subete \& 全て: everything, all, the whole \&/
s/^(仕舞う|終う|しまう) & & &/\1 \& shimau \& to finish, to stop, to put an end to \&/
s/^(気づく|気付く) & & &/\1 \& kizuku \& to notice, to recognise, to become aware of \&/
s/^(く) & & &/\1 \& ku \& ward, borough, city (in Tokyo) \&/
s/^(変わる) & & &/\1 \& kawaru \& to change, to be transformed, to be altered \&/
s/^(かわる) & & &/\1 \& kawaru \& 変わる: to change, to be transformed \&/
s/^(笑う) & & &/\1 \& warau \& to laugh \&/
s/^(笑顔) & & &/\1 \& egaho \& smiling face, smile \&/
s/^(どんな) & & &/\1 \& donna \& what kind of, what sort of \&/
s/^(気持ち) & & &/\1 \& kimochi \& feeling, sensation, mood, state of mind \&/
s/^(そんな) & & &/\1 \& sonna \& such, that sort of, that kind of \&/
s/^(慣れる) & & &/\1 \& nareru \& to get used to, to grow accustomed to \&/
s/^(なれる) & & &/\1 \& nareru \& 慣れる: to get used to \&/
s/^(分かる) & & &/\1 \& wakaru \& to understand, to comprehend, to grasp \&/
s/^(わかる) & & &/\1 \& wakaru \& 分かる: to understand, to comprehend, to grasp \&/
s/^(消える) & & &/\1 \& kieru \& to go out, to vanish, to disappear \&/
s/^(ひとつ) & & &/\1 \& hitotsu \& one (counter) \&/
s/^(光) & & &/\1 \& hikari \& light \&/
s/^(度) & & &/\1 \& do \& (counter for occurrences) \&/
s/^(遠い) & & &/\1 \& toi \& far, distant, far away \&/	
s/^(僕ら) & & &/\1 \& bokura \& we (Pronoun, Male term) \&/
s/^(日々) & & &/\1 \& hibi \& the everyday \&/	
s/^(星) & & &/\1 \& hoshi \& star \&/
s/^(優しい) & & &/\1 \& yasashii \& tender, kind, gentle, affectionate \&/
s/^(やさしい) & & &/\1 \& yasashii \& 優しい: tender, kind, gentle, affectionate \&/
s/^(思い出) & & &/\1 \& omoide \& memories, recollections, reminiscence \&/
s/^(過ぎる|すぎる) & & &/\1 \& sugiru \& to pass through, to pass by \&/
s/^(二) & & &/\1 \& ni \& two \&/
s/^(出す) & & &/\1 \& dasu \& to take out, to get out \&/
s/^(だす) & & &/\1 \& dasu \& 出す: to take out, to get out \&/
s/^(愛す) & & &/\1 \& aisu \& to love \&/
s/^(時間) & & &/\1 \& jikan \& time \&/
s/^(気) & & &/\1 \& ki \& spirit, mind, heart \&/
s/^(終わる) & & &/\1 \& owaru \& to end, to come to an end, to close, to finish \&/
s/^(愛しい) & & &/\1 \& itoshii \& lovely, dear, beloved, darling, dearest \&/
s/^(みんな) & & &/\1 \& minna \& everyone, everybody, all \&/
s/^(欲しい) & & &/\1 \& hoshii \& wanted, wished for, in need of, desired \&/
s/^(強い) & & &/\1 \& tsuyoi \& strong, potent, competent, tough, powerful \&/
s/^(雨) & & &/\1 \& ame \& rain\&/
s/^(頃) & & &/\1 \& koro, goro \& (approximate) time, around, about, toward \&/
s/^(みたい) & & &/\1 \& mitai \& -like, sort of, similar to, resembling \&/
s/^(やる) & & &/\1 \& yaru \& to do, to undertake, to perform \&/
s/^(大人) & & &/\1 \& otona \& adult, grown-up \&/
s/^(花) & & &/\1 \& hana \& flower, blossom, bloom, petal \&/


# THE BLUE HEARTS
s/^(事) & & &/\1 \& koto \& thing, matter \&/
s/^(死ぬ) & & &/\1 \& shinu \& to die \&/
s/^(聞く) & & &/\1 \& kiku \& to hear\&/
s/^(上がる) & & &/\1 \& agaru \& to rise, to go up \&/
s/^(あがる) & & &/\1 \& agaru \& 上がる: to rise, to go up \&/
s/^(上げる) & & &/\1 \& ageru \& to raise, to elevate \&/
s/^(あげる) & & &/\1 \& ageru \& 上げる: to raise, to elevate \&/
s/^(上) & & &/\1 \& ue \& above, up, over \&/
s/^(俺) & & &/\1 \& ore \& I, me (Pronoun, Male term, rough or arrogant) \&/
s/^(おれ|オレ) & & &/\1 \& ore \& 俺: I, me (Pronoun, Male term, rough or arrogant) \&/
s/^(吹く) & & &/\1 \& fuku \& to blow (of the wind) \&/
s/^(つける) & & &/\1 \& tsukeru \&  \&/
s/^(どう) & & &/\1 \& dou \& how, in what way, how about \&/
s/^(本当) & & &/\1 \& hontou \& truth, reality, actuality, fact \&/
s/^(生まれる) & & &/\1 \& umareru \& to be born \&/
s/^(呉れる|くれる) & & &/\1 \& kureru \& to give, to let (one) have \&/
s/^(出る|でる) & & &/\1 \& deru \& 出る: to leave, to exit, to go out \&/
s/^(夏) & & &/\1 \& natsu \& summer \&/
s/^(悪い) & & &/\1 \& warui \& bad, poor, undesirable \&/
s/^(歌|唄) & & &/\1 \& uta \& song \&/
s/^(うた) & & &/\1 \& uta \&  歌: song (歌う) \&/
s/^(歌う) & & &/\1 \& utau \& to sing \&/
s/^(うたう) & & &/\1 \& utau \& to sing (歌う) \&/
s/^(者) & & &/\1 \& mono, sha \& person \&/
s/^(物) & & &/\1 \& mono \& thing, object, article, stuff, substance \&/
s/^(モノ) & & &/\1 \& mono \& 物: thing, object, article, stuff, substance \&/
s/^(達) & & &/\1 \& tachi \& (pluralizing suffix) \&/
s/^(降る) & & &/\1 \& furu \& to fall (of rain, snow, ash, etc.), to come down \&/
s/^(飛ばす) & & &/\1 \& tobasu \& to let fly, to make fly, to skip over, to leave out \&/
s/^(ああ) & & &/\1 \& aa \& ah!, oh!, alas! \&/
s/^(いける) & & &/\1 \& ikeru \&  \&/
s/^(かける) & & &/\1 \& kakeru \& \&/
s/^(たくさん) & & &/\1 \& takusan \& a lot, lots, plenty, many, a large number, much \&/
s/^(下) & & &/\1 \& shita \& below, down, under, \&/
s/^(世の中) & & &/\1 \& yononaka \& society, the world, the times \&/
s/^(今夜) & & &/\1 \& konya \& this evening, tonight \&/
s/^(奴) & & &/\1 \& yatsu \& fellow, guy, chap (Derogatory) \&/
s/^(少し) & & &/\1 \& sukoshi \& a little, a few \&/
s/^(方) & & &/\1 \& hou \& direction, way, side \&/
s/^(月) & & &/\1 \& tsuki \& moon \&/	
s/^(楽しい) & & &/\1 \& tanoshii \& enjoyable, fun, pleasant \&/
s/^(歴史) & & &/\1 \& rekishi \& history \&/
s/^(続く) & & &/\1 \& tsuzuku \& to continue, to last, to go on \&/
s/^(言える) & & &/\1 \& ieru \& to be possible to say, to be able to say \&/
s/^(飛ぶ) & & &/\1 \& tobu \& to fly, to soar \&/
s/^(友達) & & &/\1 \& tomodachi \& friend, companion \&/
s/^(朝) & & &/\1 \& asa, ashita \& morning \&/
s/^(叶う) & & &/\1 \& kanau \& to come true (wish, prayer\\dots), to be realized \&/
s/^(かなう) & & &/\1 \& kanau \& 叶う: to come true (wish, prayer\\dots), to be realized \&/
s/^(そこ) & & &/\1 \& soko \& there (place relatively near listener) \&/
s/^(僕達) & & &/\1 \& bokutachi \& we (Pronoun, Male term) \&/
s/^(命) & & &/\1 \& inochi \& life \&/
s/^(届く) & & &/\1 \& todoku \&  to reach, to touch, to get to \&/
s/^(幸せ) & & &/\1 \& shiawase \& happiness, good fortune, luck, blessing \&/
s/^(しあわせ) & & &/\1 \& shiawase \& 幸せ: happiness, good fortune, luck, blessing \&/
s/^(恋人) & & &/\1 \& koibito \& lover, sweetheart, boyfriend, girlfriend \&/
s/^(所) & & &/\1 \& tokoro \& place, spot, scene, site \&/
s/^(持つ) & & &/\1 \& motsu \& to hold (in one\'s hand), to take, to carry \&/
s/^(教える) & & &/\1 \& oshieru \& to teach, to instruct \&/
s/^(線) & & &/\1 \& sen \& line, stripe \&/
s/^(考える) & & &/\1 \& kangaeru \& to think (about, of), to ponder, to contemplate \&/
s/^(覚える) & & &/\1 \& oboeru \& to memorise, to learn by heart \&/	
s/^(書く) & & &/\1 \& kaku \& to write \&/
s/^(かく) & & &/\1 \& kaku \& 書く: to write \&/
s/^(さあ) & & &/\1 \& saa \& well, who knows, I don\'t know\dots, uh, hmm \&/
s/^(だらけ) & & &/\1 \& darake \& full of (e.g. mistakes), riddled with \&/
s/^(ちょっと) & & &/\1 \& chotto \& a little, a bit, slightly \&/
s/^(はずれ) & & &/\1 \& hazure \& 外れ: end, verge, extremity, tip \&/
s/^(一つ) & & &/\1 \& hitotsu \& one \&/

# Mashima Masatoshi
s/^(意味) & & &/\1 \& imi \& meaning, significance, sense \&/
s/^(昨日) & & &/\1 \& kinou \& yesterday \&/
s/^(顔) & & &/\1 \& kao \& face, visage \&/
s/^(くだらない) & & &/\1 \& kudaranai \& 下らない: trivial, insignificant, worthless, useless \&/
s/^(こわい) & & &/\1 \& kowai \& 怖い: scary, frightening \&/
s/^(とても) & & &/\1 \& totemo \& very, awfully, exceedingly \&/
s/^(もっと) & & &/\1 \& motto \& (some) more, even more, longer, further \&/
s/^(格好) & & &/\1 \& kakko \& shape, form, figure, posture, pose \&/
s/^(カッコ) & & &/\1 \& kakko \& 格好: shape, form, figure, posture, pose \&/
s/^(ギター) & & &/\1 \& gitaa \& guitar \&/
s/^(出来る) & & &/\1 \& dekiru \& to be able to do, to be up to the task \&/
s/^(子供) & & &/\1 \& kodomo \& child \&/
s/^(揺れる) & & &/\1 \& yureru \& to shake, to sway, to waver \&/
s/^(まるで) & & &/\1 \& marude \& quite, entirely, completely, at all \&/
s/^(あいつ) & & &/\1 \& aitsu \& he, she, that guy (Pronoun, Colloquialism) \&/

# AKB48
s/^(合う) & & &/\1 \& au \& to come together, to merge, to unite, to meet \&/
s/^(場所) & & &/\1 \& basho \& place, location, spot, position \&/
s/^(なぜ) & & &/\1 \& naze \& why, how \&/
s/^(先) & & &/\1 \& saki \& head (of a line), front \&/
s/^(諦める) & & &/\1 \& akirameru \& to give up \&/
s/^(あきらめる) & & &/\1 \& akirameru \& 諦める: to give up \&/
s/^(長い) & & &/\1 \& nagai \& long (distance, length), long (time), prolonged \&/
s/^(探す) & & &/\1 \& sagasu \& to search for, to look for, to hunt for, to seek \&/
s/^(すぐ) & & &/\1 \& sugu \& immediately, at once, right away, directly \&/
s/^(キス) & & &/\1 \& kissu \& kiss \&/
s/^(太陽) & & &/\1 \& taiyou \& sun \&/


# Ningen isu
s/^(闇) & & &/\1 \& yami \& darkness, the dark, despair, hopelessness \&/
s/^(地獄) & & &/\1 \& jigoku \& hell \&/
s/^(越える) & & &/\1 \& koeru \& to cross over, to pass through, to go beyond\&/
s/^(咲く) & & &/\1 \& saku \& to bloom, to flower, to blossom \&/
s/^(山) & & &/\1 \& yama \& mountain \&/
s/^(果て) & & &/\1 \& hote \& the end, the extremity, the limit, the limits \&/
s/^(この世) & & &/\1 \& konoyo \& this world, this life, world of the living \&/
s/^(永遠) & & &/\1 \& eien \& eternity, perpetuity, permanence, immortality \&/
s/^(宇宙) & & &/\1 \& uchyuu \& blood spilt from the body \&/
s/^(落ちる) & & &/\1 \& ochiru \& to fall down, to drop, to fall (e.g. rain) \&/
s/^(血潮) & & &/\1 \& chishio \& blood spilt from the body \&/
s/^(開く) & & &/\1 \& hiraku \& to open, to undo, to unseal, to unpack \&/
s/^(影) & & &/\1 \& kage \& shadow, silhouette, figure, shape \&/
s/^(時代) & & &/\1 \& jidai \& period, epoch, era, age \&/
s/^(海) & & &/\1 \& umi \& sea, ocean, waters \&/
s/^(神) & & &/\1 \& kami \& god, deity, divinity, spirit \&/
s/^(死) & & &/\1 \& shi \& death \&/
s/^(ひとり) & & &/\1 \& hitori \& 一人: one person, alone, oneself; 独り: single \&/
s/^(ぶる) & & &/\1 \& furu \& to assume the air of \\dots, to behave like \\dots \&/
s/^(地平) & & &/\1 \& shi \& horizon \&/
s/^(彼方) & & &/\1 \& achira \& that way, that direction, over there \&/
s/^(悪) & & &/\1 \& waru \& wicked person, evil person, scoundrel, bad guy \&/
s/^(抱く) & & &/\1 \& idaku \&  to hold in one\'s arms (e.g. a baby), to hug \&/
s/^(眠る) & & &/\1 \& nemuru \& to sleep, to die, to rest (in peace), to lie (buried) \&/
s/^(笑み) & & &/\1 \& emi \& smile \&/
s/^(色) & & &/\1 \& iro \& colour \&/
s/^(魂) & & &/\1 \& tamashii \& soul, spirit \&/
s/^(形) & & &/\1 \& katachi \& form, shape, figure \&/
s/^(彼) & & &/\1 \& kare \& him (Pronoun) \&/
s/^(懐かしい) & & &/\1 \& natsukashii \& dear (old), fondly-remembered, missed, nostalgic \&/

# back number
s/^(同じ) & & &/\1 \& onaji \& same, identical, equal, similar, alike \&/
s/^(おなじ) & & &/\1 \& onaji \& 同じ: same, identical, equal, similar \&/
s/^(全部) & & &/\1 \& zenbu \& all, entire, whole, altogether \&/
s/^(会う) & & &/\1 \& au \& to meet, to encounter, to see \&/
s/^(会える) & & &/\1 \& aeru \& (be able) to meet, to encounter (会う) \&/
s/^(最後) & & &/\1 \& saigo \& end, conclusion \&/
s/^(無い) & & &/\1 \& nai \& nonexistent, not being (there) \&/
s/^(こんな) & & &/\1 \& konna \& this sort of, this kind of, like this, such \&/
s/^(まだ) & & &/\1 \& mada \& still, as yet, only \&/
s/^(毎日) & & &/\1 \& mainichi \& every day \&/
s/^(はず) & & &/\1 \& hazu \& should (be), bound (to be) \&/
s/^(思い|想い) & & &/\1 \& omoi \& thought \&/
s/^(良い) & & &/\1 \& yoi \& good, excellent, fine, nice, pleasant, agreeable \&/
s/^(話) & & &/\1 \& hanashi \& talk, speech, chat, conversation \&/
s/^(答え) & & &/\1 \& kotae \& answer, reply, response, solution \&/
s/^(思い出す) & & &/\1 \& omoidasu \& to recall, to remember, to recollect \&/
s/^(悲しい) & & &/\1 \& kanashii \& sad, miserable, unhappy, sorrowful \&/
s/^(悲しみ) & & &/\1 \& kanashimi \& sadness, sorrow, grief \&/
s/^(抱きしめる) & & &/\1 \& dakishimeru \& to hug someone close, to hold someone tight\&/
s/^(綺麗) & & &/\1 \& kirei \& pretty, lovely, beautiful, fair \&/
s/^(きれい) & & &/\1 \& kirei \& 綺麗: pretty, lovely, beautiful, fair \&/
s/^(ちゃんと) & & &/\1 \& chanto \& diligently, seriously, earnestly, reliably\&/
s/^(為) & & &/\1 \& tame \& purpose, goal \&/

# BEGIN
s/^(波|浪|濤) & & &/\1 \& nami \& wave \&/
s/^(音) & & &/\1 \& oto \& sound, noise \&/
s/^(流れる) & & &/\1 \& nagareru \& to stream, to flow (liquid, time, etc.) \&/
s/^(島) & & &/\1 \& shima \& island \&/
s/^(ー) & & &/\1 \& - \& (long vowel mark (katakana)) \&/
s/^(帰る) & & &/\1 \& kaeru \& to return, to go home \&/
s/^(かえる) & & &/\1 \& kaeru \& 帰る: to return, to go home \&/
s/^(飲む) & & &/\1 \& nomu \& to drink \&/
s/^(白い) & & &/\1 \& shiroi \& white \&/
s/^(聞こえる) & & &/\1 \& kikoeru \& to be heard, to be audible \&/
s/^(きこえる) & & &/\1 \& kikoeru \& 聞こえる: to be heard, to be audible \&/
s/^(酒) & & &/\1 \& sake \& alcohol \&/
s/^(離れる) & & &/\1 \& hanareru \& to be separated, to be apart \&/
s/^(白い) & & &/\1 \& shiroi \& white \&/

# MLT - aruku hana
s/^(瞬間) & & &/\1 \& shunkan \& moment, second, instant \&/
s/^(足) & & &/\1 \& ashi \& foot \&/
s/^(渡る) & & &/\1 \& wataru \& to go across \&/
s/^(生える) & & &/\1 \& haeru \& to grow \&/
s/^(野) & & &/\1 \& no \& plain, field \&/
s/^(飛び越える) & & &/\1 \& tobikoeru \& to jump over \&/
s/^(ライン) & & &/\1 \& LINE \& (katakana) line \&/
s/^(ガードレール) & & &/\1 \& gaadoreeru \& (katakana) gard-rail \&/
s/^(センタ) & & &/\1 \& sentaa \& (katakana) center \&/
s/^(根っこ) & & &/\1 \& nekko \& root (of a plant) \&/
s/^(普通) & & &/\1 \& hutsuu \& normal, ordinary, regular \&/
s/^(決める|極める) & & &/\1 \& kimeru \& to decide \&/
s/^(愛する) & & &/\1 \& ai suru \& to love \&/
s/^(庭) & & &/\1 \& niwa \& garden \&/


# MLT - GReeeeN -- 風
s/^(花びら) & & &/\1 \& hanabira \& (flower) petal \&/
s/^(真ん中) & & &/\1 \& mannaka \& middle, centre, midpoint \&/
s/^(どの) & & &/\1 \& dono \& which, what \&/
s/^(選べる) & & &/\1 \& erabu \& to choose, to select \&/
s/^(清い) & & &/\1 \& kiyoi \& clear, pure, noble \&/
s/^(新しい) & & &/\1 \& atarashii \& new \&/
s/^(描く) & & &/\1 \& egaku \& to draw \&/
s/^(舞う) & & &/\1 \& mau \&  to dance \&/
s/^(乗せる) & & &/\1 \& noseru \&  to place on (something) \&/

# SMAP
s/^(感じる) & & &/\1 \& kanjiru \& to feel \&/
s/^(続ける) & & &/\1 \& tsuzukeru \& to continue, to keep up, to keep on \&/

# Kaneko Ayano
s/^(体) & & &/\1 \& karada \& body \&/
s/^(外) & & &/\1 \& soto \& outside \&/
s/^(部屋) & & &/\1 \& heya \& room \&/
s/^(食べる) & & &/\1 \& taberu \& to eat \&/
s/^(入れる) & & &/\1 \& ireru \& to put in \&/
s/^(いれる) & & &/\1 \& ireru \& 入れる: to put in \&/
s/^(つく) & & &/\1 \& tsuku \& 着く: to arrive at, to reach \&/
s/^(家) & & &/\1 \& ie, uchi \& house \&/
s/^(恋しい) & & &/\1 \& koishii \& yearned for, longed for, missed \&/
s/^(走る) & & &/\1 \& hashiru \& to run \&/
s/^(これから) & & &/\1 \& kore kara \& from now on \&/
s/^(さよなら) & & &/\1 \& sayonara \& goodbye, so long, farewell \&/




s/^(燃える) & & &/\1 \& moeru \& to burn \&/
s/^(いける) & & &/\1 \& ikeru \& to be good (at), to go well \&/
s/^(呼ぶ) & & &/\1 \& yobu \&  to call out  \&/


s/^(ちゃう) & & &/\1 \& chau \& to do completely \&/
s/^(乗る) & & &/\1 \& noru \& to get on (train, plane, bus, ship, etc.) \&/
s/^(冷たい) & & &/\1 \& tsumetai \& cold (to the touch) \&/
s/^(輝く) & & &/\1 \& kagayaku \& to shine, to glitter, to sparkle \&/
s/^(光る) & & &/\1 \& hikaru \& to shine, to glitter, to be bright \&/
s/^(踊る) & & &/\1 \& odoru \& to dance \&/
s/^(金) & & &/\1 \& kane \& money \&/
s/^(うまい) & & &/\1 \& umai \& skillful, clever; delicious \&/
s/^(さん) & & &/\1 \& san \& Mr., Mrs., Miss, Ms. \&/
s/^(バカ) & & &/\1 \& baka \& ばか, 馬鹿: idiot \&/



s/^(奥) & & &/\1 \& oku \& inner part, interior \&/
s/^(雲) & & &/\1 \& kumo \& cloud \&/
s/^(うねる) & & &/\1 \& uneru \& 畝る: to undulate \&/
s/^(おかしな) & & &/\1 \& okashina \& ridiculous, odd \&/
s/^(おちる) & & &/\1 \& ochiru \& to fall down \&/
s/^(かならず) & & &/\1 \& kanarazu \& 必ず: always, without exception \&/
s/^(開ける) & & &/\1 \& akeru \& to open (a door, etc.) \&/
s/^(あける) & & &/\1 \& akeru \& 開ける: to open (a door, etc.) \&/
s/^(暖かい) & & &/\1 \& atatakai \& warm \&/
s/^(あたたかい) & & &/\1 \& atatakai \& 暖かい: warm \&/
s/^(ぐち) & & &/\1 \& guchi \& 愚痴:  idle complaint, grumble \&/
s/^(こわれる) & & &/\1 \& kowareru \& 壊れる:  to be broken, to break \&/
s/^(そのうち) & & &/\1 \& sono uchi \& before very long, soon, someday \&/
s/^(そば) & & &/\1 \& soba \& near, close \&/
s/^(ちっぽけ) & & &/\1 \& chippoke \& very small, tiny \&/
s/^(つくる) & & &/\1 \& tsukuru \& 作る: to make, to produce \&/
s/^(つくろう) & & &/\1 \& tsukuruu \& 繕う: to mend, to patch up, to fix \&/
s/^(つぶる) & & &/\1 \& tsuburu \& to close (one's eyes), to shut \&/
s/^(通り抜ける) & & &/\1 \& toorinukeru \& to go through, to pass through \&/
s/^(とおりぬける) & & &/\1 \& toorinukeru \& 通り抜ける: to go through \&/
s/^(とける) & & &/\1 \& tokeru \& 解ける: to be solved, to be resolved \&/
s/^(飛び出す) & & &/\1 \& tobidasu \& to jump out, to rush out \&/
s/^(とびだす) & & &/\1 \& tobidasu \& 飛び出す: to jump out, to rush out \&/
s/^(取れる) & & &/\1 \& toreru \& to come off, to be removed \&/
s/^(とれる) & & &/\1 \& toreru \& 取れる: to come off, to be removed \&/
s/^(除く) & & &/\1 \& nozoku \& to remove, to eliminate \&/
s/^(のぞく) & & &/\1 \& nozoku \& 除く: to remove, to eliminate \&/
s/^(入る) & & &/\1 \& hairu \& to enter, to go into \&/
s/^(はいる) & & &/\1 \& hairu \& 入る: to enter, to go into \&/
s/^(始め) & & &/\1 \& hajime \& beginning, start, first (time) \&/
s/^(はじめ) & & &/\1 \& hajime \& 始め: beginning, start, first (time) \&/
s/^(降る) & & &/\1 \& furu \& to fall (e.g. rain, snow, etc.) \&/
s/^(ふる) & & &/\1 \& furu \& 降る: to fall (e.g. rain, snow, etc.) \&/
s/^(震える) & & &/\1 \& furueru \& to shiver, to shake \&/
s/^(ふるえる) & & &/\1 \& furueru \& 震える: to shiver, to shake \&/
s/^(紛れ込む) & & &/\1 \& magirekomu \& to disappear into, to slip into \&/
s/^(まぎれこむ) & & &/\1 \& magirekomu \& 紛れ込む: to disappear into, to slip into \&/
s/^(まとも) & & &/\1 \& matomo \& honesty, decency \&/
s/^(まわす) & & &/\1 \& mawasu \& 回す: to turn, to rotate \&/
s/^(まんなか) & & &/\1 \& mannaka \& 真ん中: middle, centre \&/
s/^(もどる) & & &/\1 \& modoru \& 戻る: to turn back \&/
s/^(やわらかい) & & &/\1 \& yawarakai \& 柔らかい: soft, tender \&/
s/^(ゆれる) & & &/\1 \& yureru \& 揺れる: to shake, to sway \&/
s/^(よみがえる) & & &/\1 \& yomigaeru \& 蘇る:  to be resurrected \&/
s/^(よろこぶ) & & &/\1 \& yorokobi \& to be delighted \&/
s/^(アンテナ) & & &/\1 \& ANTENA \& \\emph{antenna} \&/
s/^(インスピレーション) & & &/\1 \& INSUPIREESHION \& \\emph{inspiration} \&/
s/^(エネルギ) & & &/\1 \& ENERUGI \& \\emph{energy} \&/
s/^(カード) & & &/\1 \& KAADO \& \\emph{card} \&/
s/^(カーニバル) & & &/\1 \& KAANIBARU \& \\emph{cannibal} \&/
s/^(ガラス) & & &/\1 \& GARASU \& \\emph{grass} \&/
s/^(キー) & & &/\1 \& KII \& \\emph{key} \&/
s/^(サビ) & & &/\1 \& SABI \& hook (high point of a song) \&/
s/^(シンデレラ) & & &/\1 \& SHINDERERA \& Cinderella \&/
s/^(チャンネル) & & &/\1 \& CHANERU \& \\emph{channel} \&/
s/^(テレフォン) & & &/\1 \& TEREFUON \& \\emph{telephone} \&/
s/^(ドア) & & &/\1 \& DOA \& \\emph{door} \&/
s/^(ドレス) & & &/\1 \& DORESU \& \\emph{dress} \&/
s/^(メッセージ) & & &/\1 \& MESSEEGI \& \\emph{message} \&/



s/^(不思議) & & &/\1 \& fushigi \& wonderful, marvelous, amazing \&/


s/:/： /
	
## add italics
s/^([^&]*)& ([^&]*) &/\1\& \\emph{\2} \&/

 

