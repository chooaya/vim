" This script was originally created by Rory McCann <ebelular at gmail dot com>.
" Dan Kenigsberg noticed some deficiencies and suggested this one instead.
"
" Maintainer: Rory McCann <ebelular at gmail dot com>
" Modified by: Edward L. Fox <edyfox at gmail dot com>
" Last Change: 2006 Apr 30
"
"
"
"  Kana.kmap (Japanese Phonograms)
"
"  Converted from Gaspar Sinai's yudit 2.7.6
"  GNU (C) Gaspar Sinai <gsinai@yudit.org>
"
"  WARNING
"  -------
"  This version of Kana.kmap is different from the one that has been used
"  with yudit-2.7.2 or earlier.  The main difference is that this kmap is
"  arranged in such a way that it complies with an authorized Japanese
"  transliteration.  As a result, backward compatibility is not guaranteed.
"
"  NOTE
"  ----
"  1.	In general, the transliteration is based on Japanese Government's
"	Cabinet	Notification 1 (Dec. 9, 1954).
"
"	Summary:
"
"	(1) To transliterate Japanese language, Table 1 should be used
"	   primarily.
"	(2) Table 2 may be used only when existing conventions such as
"	   international relationship should be respected.
"	(3) Other transliteration is acceptable only when neither Table 1
"	    nor Table 2 gives any specification of the sound in question
"
"	For details, refer to
"
"	    http://xembho.tripod.com/siryo/naikaku_kokuzi.html
"
"  2.	The specification instructed by the Cabinet Notification is rather
"	inadequate even for daily use.  At the present time there are thus
"	many unauthorized but widely accepted conventions used together with
"	the authorized transliteration.  This kmap contains some of them for
"	user's convenience (cf. Hiragana 3 and Katakana 3).
"
"  3.	For the unicode mapping relevant to this kmap, refer to	3075--30F5 of
"
"	    http://www.macchiato.com/unicode/charts.html
"
"  HISTORY
"  -------
"  2005-01-11	<danken@cs.technion.ac.il>
"	* Converted to Vim format.
"  2003-01-22	<kazunobu.kuriyama@nifty.com>
"
"	* Submitted to gsinai@yudit.org
"
" ============================================================================

scriptencoding utf-8

" ----------------------------------------------------------------------------
"  Kigou (Punctuation etc.)
" ----------------------------------------------------------------------------

let b:keymap_name = "all_kana"

loadkeymap
"0x20  0x3000
 
@ ろ
` ロ
[ ー
\ ー
0 わ
_ ワ
__ ワ
| を
|| ヲ
0x22 フ
" ----------------------------------------------------------------------------
"  Hiragana 1 --- Table 1, Cabinet Notification No. 1 (Dec. 9, 1954)
" ----------------------------------------------------------------------------
3 あ
e い
4 う
5 え
%% エ
6 お

t か
g き
h く
: け
b こ

x さ
d し
r す
p せ
c そ

q た
a ち
z つ
w て
s と

u な
i に
1 ぬ
, ね
k の

f は
v ひ
2 ふ
^ へ
- ほ

j ま
n み
] む
/ め
m も

7 や
8 ゆ
9 よ

o ら
l り
. る
; れ

t@ が
g@ ぎ
h@ ぐ
:@ げ
b@ ご

x@ ざ
d@ じ
r@ ず
p@ ぜ
c@ ぞ

q@ だ
w@ で
s@ ど

f@ ば
v@ び
2@ ぶ
^@ べ
-@ ぼ

f[ ぱ
v[ ぴ
2[ ぷ
^[ ぺ
-[ ぽ

' ゃ
( ゅ
) ょ

y ん

a@ ぢ
z@ づ


# ぁ
E ぃ
$ ぅ
% ぇ
& ぉ

Z っ

" ----------------------------------------------------------------------------
"  Katakana 1 --- Table 1, Cabinet Notification No. 1 (Dec. 9, 1954)
" ----------------------------------------------------------------------------
## ア
EE イ
$$ ウ
&& オ

T カ
G キ
H ク
* ケ
B コ

X サ
D シ
R ス
P セ
C ソ

Q タ
A チ
ZZ ツ
W テ
S ト

U ナ
I ニ
! ヌ
< ネ
K ノ

F ハ
V ヒ
~ ヘ
= ホ

J マ
N ミ
} ム
? メ
M モ

'' ヤ
(( ユ
)) ヨ

O ラ
L リ
> ル
+ レ


T@ ガ
G@ ギ
H@ グ
*@ ゲ
B@ ゴ

X@ ザ
D@ ジ
R@ ズ
P@ ゼ
C@ ゾ

Q@ ダ
W@ デ
S@ ド

F@ バ
V@ ビ
0x22@ ブ
~@ ベ
=@ ボ

F[ パ
V[ ピ
0x22[ プ
~[ ペ
=[ ポ

Y ン

" ----------------------------------------------------------------------------
"  Katakana 2 --- Table 2, Cabinet Notification No. 1 (Dec. 9, 1954)
" ----------------------------------------------------------------------------

A@ ヂ
Z@ ヅ

" ----------------------------------------------------------------------------
"  Katakana 3 --- Conventional transliterations
" ----------------------------------------------------------------------------

" Small Katakana: The prefix X is never pronounced.  It is used as something
" like an escape character.
### ァ
EEE ィ
$$$ ゥ
%%% ェ
&&& ォ

ZZZ ッ

''' ャ
((( ュ
))) ョ

" Used only for counting someone or something
TT ヵ
** ヶ

" Used for the sound `v' of European languages
4@ ヴ

