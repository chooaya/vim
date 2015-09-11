" vim:foldmethod=marker:fen:
scriptencoding utf-8


" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}


function! eskk#table#rom_to_kata#load()
    return {
    \   'a': ['ア', ''],
    \   'bb': ['ッ', 'b'],
    \   'ba': ['バ', ''],
    \   'be': ['ベ', ''],
    \   'bi': ['ビ', ''],
    \   'bo': ['ボ', ''],
    \   'bu': ['ブ', ''],
    \   'bya': ['ビャ', ''],
    \   'bye': ['ビェ', ''],
    \   'byi': ['ビィ', ''],
    \   'byo': ['ビョ', ''],
    \   'byu': ['ビュ', ''],
    \   'cc': ['ッ', 'c'],
    \   'cha': ['チャ', ''],
    \   'che': ['チェ', ''],
    \   'chi': ['チ', ''],
    \   'cho': ['チョ', ''],
    \   'chu': ['チュ', ''],
    \   'cya': ['チャ', ''],
    \   'cye': ['チェ', ''],
    \   'cyi': ['チィ', ''],
    \   'cyo': ['チョ', ''],
    \   'cyu': ['チュ', ''],
    \   'dd': ['ッ', 'd'],
    \   'da': ['ダ', ''],
    \   'de': ['デ', ''],
    \   'dha': ['デャ', ''],
    \   'dhe': ['デェ', ''],
    \   'dhi': ['ディ', ''],
    \   'dho': ['デョ', ''],
    \   'dhu': ['デュ', ''],
    \   'di': ['ヂ', ''],
    \   'do': ['ド', ''],
    \   'du': ['ヅ', ''],
    \   'dya': ['ヂャ', ''],
    \   'dye': ['ヂェ', ''],
    \   'dyi': ['ヂィ', ''],
    \   'dyo': ['ヂョ', ''],
    \   'dyu': ['ヂュ', ''],
    \   'e': ['エ', ''],
    \   'ff': ['ッ', 'f'],
    \   'fa': ['ファ', ''],
    \   'fe': ['フェ', ''],
    \   'fi': ['フィ', ''],
    \   'fo': ['フォ', ''],
    \   'fu': ['フ', ''],
    \   'fya': ['フャ', ''],
    \   'fye': ['フェ', ''],
    \   'fyi': ['フィ', ''],
    \   'fyo': ['フョ', ''],
    \   'fyu': ['フュ', ''],
    \   'gg': ['ッ', 'g'],
    \   'ga': ['ガ', ''],
    \   'ge': ['ゲ', ''],
    \   'gi': ['ギ', ''],
    \   'go': ['ゴ', ''],
    \   'gu': ['グ', ''],
    \   'gya': ['ギャ', ''],
    \   'gye': ['ギェ', ''],
    \   'gyi': ['ギィ', ''],
    \   'gyo': ['ギョ', ''],
    \   'gyu': ['ギュ', ''],
    \   'hh': ['ッ', 'h'],
    \   'ha': ['ハ', ''],
    \   'he': ['ヘ', ''],
    \   'hi': ['ヒ', ''],
    \   'ho': ['ホ', ''],
    \   'hu': ['フ', ''],
    \   'hya': ['ヒャ', ''],
    \   'hye': ['ヒェ', ''],
    \   'hyi': ['ヒィ', ''],
    \   'hyo': ['ヒョ', ''],
    \   'hyu': ['ヒュ', ''],
    \   'i': ['イ', ''],
    \   'jj': ['ッ', 'j'],
    \   'ja': ['ジャ', ''],
    \   'je': ['ジェ', ''],
    \   'ji': ['ジ', ''],
    \   'jo': ['ジョ', ''],
    \   'ju': ['ジュ', ''],
    \   'jya': ['ジャ', ''],
    \   'jye': ['ジェ', ''],
    \   'jyi': ['ジィ', ''],
    \   'jyo': ['ジョ', ''],
    \   'jyu': ['ジュ', ''],
    \   'kk': ['ッ', 'k'],
    \   'ka': ['カ', ''],
    \   'ke': ['ケ', ''],
    \   'ki': ['キ', ''],
    \   'ko': ['コ', ''],
    \   'ku': ['ク', ''],
    \   'kya': ['キャ', ''],
    \   'kye': ['キェ', ''],
    \   'kyi': ['キィ', ''],
    \   'kyo': ['キョ', ''],
    \   'kyu': ['キュ', ''],
    \   'mm': ['ッ', 'm'],
    \   'ma': ['マ', ''],
    \   'me': ['メ', ''],
    \   'mi': ['ミ', ''],
    \   'mo': ['モ', ''],
    \   'mu': ['ム', ''],
    \   'mya': ['ミャ', ''],
    \   'mye': ['ミェ', ''],
    \   'myi': ['ミィ', ''],
    \   'myo': ['ミョ', ''],
    \   'myu': ['ミュ', ''],
    \   'n': ['ン', ''],
    \   "n'": ['ン', ''],
    \   'na': ['ナ', ''],
    \   'ne': ['ネ', ''],
    \   'ni': ['ニ', ''],
    \   'nn': ['ン', ''],
    \   'no': ['ノ', ''],
    \   'nu': ['ヌ', ''],
    \   'nya': ['ニャ', ''],
    \   'nye': ['ニェ', ''],
    \   'nyi': ['ニィ', ''],
    \   'nyo': ['ニョ', ''],
    \   'nyu': ['ニュ', ''],
    \   'o': ['オ', ''],
    \   'pp': ['ッ', 'p'],
    \   'pa': ['パ', ''],
    \   'pe': ['ペ', ''],
    \   'pi': ['ピ', ''],
    \   'po': ['ポ', ''],
    \   'pu': ['プ', ''],
    \   'pya': ['ピャ', ''],
    \   'pye': ['ピェ', ''],
    \   'pyi': ['ピィ', ''],
    \   'pyo': ['ピョ', ''],
    \   'pyu': ['ピュ', ''],
    \   'rr': ['ッ', 'r'],
    \   'ra': ['ラ', ''],
    \   're': ['レ', ''],
    \   'ri': ['リ', ''],
    \   'ro': ['ロ', ''],
    \   'ru': ['ル', ''],
    \   'rya': ['リャ', ''],
    \   'rye': ['リェ', ''],
    \   'ryi': ['リィ', ''],
    \   'ryo': ['リョ', ''],
    \   'ryu': ['リュ', ''],
    \   'ss': ['ッ', 's'],
    \   'sa': ['サ', ''],
    \   'se': ['セ', ''],
    \   'sha': ['シャ', ''],
    \   'she': ['シェ', ''],
    \   'shi': ['シ', ''],
    \   'sho': ['ショ', ''],
    \   'shu': ['シュ', ''],
    \   'si': ['シ', ''],
    \   'so': ['ソ', ''],
    \   'su': ['ス', ''],
    \   'sya': ['シャ', ''],
    \   'sye': ['シェ', ''],
    \   'syi': ['シィ', ''],
    \   'syo': ['ショ', ''],
    \   'syu': ['シュ', ''],
    \   'tt': ['ッ', 't'],
    \   'ta': ['タ', ''],
    \   'te': ['テ', ''],
    \   'tha': ['テァ', ''],
    \   'the': ['テェ', ''],
    \   'thi': ['ティ', ''],
    \   'tho': ['テョ', ''],
    \   'thu': ['テュ', ''],
    \   'ti': ['チ', ''],
    \   'to': ['ト', ''],
    \   'tsu': ['ツ', ''],
    \   'tu': ['ツ', ''],
    \   'tya': ['チャ', ''],
    \   'tye': ['チェ', ''],
    \   'tyi': ['チィ', ''],
    \   'tyo': ['チョ', ''],
    \   'tyu': ['チュ', ''],
    \   'u': ['ウ', ''],
    \   'vv': ['ッ', 'v'],
    \   'va': ['ヴァ', ''],
    \   've': ['ヴェ', ''],
    \   'vi': ['ヴィ', ''],
    \   'vo': ['ヴォ', ''],
    \   'vu': ['ヴ', ''],
    \   'ww': ['ッ', 'w'],
    \   'wa': ['ワ', ''],
    \   'we': ['ウェ', ''],
    \   'wi': ['ウィ', ''],
    \   'wo': ['ヲ', ''],
    \   'wu': ['ウ', ''],
    \   'xx': ['ッ', 'x'],
    \   'xa': ['ァ', ''],
    \   'xe': ['ェ', ''],
    \   'xi': ['ィ', ''],
    \   'xka': ['ヵ', ''],
    \   'xke': ['ヶ', ''],
    \   'xo': ['ォ', ''],
    \   'xtsu': ['ッ', ''],
    \   'xtu': ['ッ', ''],
    \   'xu': ['ゥ', ''],
    \   'xwa': ['ヮ', ''],
    \   'xwe': ['ヱ', ''],
    \   'xwi': ['ヰ', ''],
    \   'xya': ['ャ', ''],
    \   'xyo': ['ョ', ''],
    \   'xyu': ['ュ', ''],
    \   'yy': ['ッ', 'y'],
    \   'ya': ['ヤ', ''],
    \   'ye': ['イェ', ''],
    \   'yo': ['ヨ', ''],
    \   'yu': ['ユ', ''],
    \   'zz': ['ッ', 'z'],
    \   'z,': ['‥', ''],
    \   'z-': ['～', ''],
    \   'z.': ['…', ''],
    \   'z/': ['・', ''],
    \   'z[': ['『', ''],
    \   'z]': ['』', ''],
    \   'za': ['ザ', ''],
    \   'ze': ['ゼ', ''],
    \   'zh': ['←', ''],
    \   'zi': ['ジ', ''],
    \   'zj': ['↓', ''],
    \   'zk': ['↑', ''],
    \   'zl': ['→', ''],
    \   'zo': ['ゾ', ''],
    \   'zu': ['ズ', ''],
    \   'zya': ['ジャ', ''],
    \   'zye': ['ジェ', ''],
    \   'zyi': ['ジィ', ''],
    \   'zyo': ['ジョ', ''],
    \   'zyu': ['ジュ', ''],
    \   '-': ['ー', ''],
    \   ':': ['：', ''],
    \   ';': ['；', ''],
    \   '!': ['！', ''],
    \   '?': ['？', ''],
    \   '[': ['「', ''],
    \   ']': ['」', ''],
    \   '.': ['。', ''],
    \   ',': ['、', ''],
    \}
endfunction


" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}