" 'srcery-basic.vim' -- Vim color scheme.
" Maintainer: Addison Bean (addisonbean@gmail.com)
" Original Source: https://github.com/srcery-colors/srcery-vim

" TODO: low contrast mode? Maybe, maybe not...

scriptencoding utf-8

set background=dark

if v:version > 580
  hi clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name='srcery-basic'

if !has('gui_running') && &t_Co != 256
  finish
endif

" Palette {{{

let s:black          = ['#1C1B19', 0]
let s:red            = ['#EF2F27', 1]
let s:green          = ['#519F50', 2]
let s:yellow         = ['#FBB829', 3]
let s:blue           = ['#2C78BF', 4]
let s:magenta        = ['#E02C6D', 5]
let s:cyan           = ['#0AAEB3', 6]
let s:white          = ['#D0BFA1', 7]
let s:bright_black   = ['#918175', 8]
let s:bright_red     = ['#F75341', 9]
let s:bright_green   = ['#98BC37', 10]
let s:bright_yellow  = ['#FED06E', 11]
let s:bright_blue    = ['#68A8E4', 12]
let s:bright_magenta = ['#FF5C8F', 13]
let s:bright_cyan    = ['#53FDE9', 14]
let s:bright_white   = ['#FCE8C3', 15]

" xterm colors.
let s:orange        = ['#FF5F00', 202]
let s:bright_orange = ['#FF8700', 208]
let s:hard_black    = ['#121212', 233]
let s:xgray1        = ['#262626', 235]
let s:xgray2        = ['#303030', 236]
let s:xgray3        = ['#3A3A3A', 237]
let s:xgray4        = ['#444444', 238]
let s:xgray5        = ['#4E4E4E', 239]
let s:xgray6        = ['#585858', 240]

"}}}
" Setup Variables: {{{

let s:none = ['NONE', 'NONE']

if !exists('g:srcery_italic')
  if has('gui_running') || $TERM_ITALICS ==? 'true'
    let g:srcery_italic=1
  else
    let g:srcery_italic=0
  endif
endif

if !exists('g:srcery_transparent_background')
  let g:srcery_transparent_background=0
endif

if !exists('g:srcery_undercurl')
  let g:srcery_undercurl=1
endif

if !exists('g:srcery_underline')
  let g:srcery_underline=1
endif

if !exists('g:srcery_inverse')
  let g:srcery_inverse=1
endif

if !exists('g:srcery_inverse_matches')
  let g:srcery_inverse_matches=0
endif

if !exists('g:srcery_inverse_match_paren')
  let g:srcery_inverse_match_paren=0
endif

if !exists('g:srcery_dim_lisp_paren')
  let g:srcery_dim_lisp_paren=0
endif

" }}}
" Setup Emphasis: {{{

let s:bold = ''
let s:italic = ''

let s:underline = 'underline,'
if g:srcery_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:srcery_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:srcery_inverse == 0
  let s:inverse = ''
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let l:fg = a:fg

  " background
  if a:0 >= 1
    let l:bg = a:1
  else
    let l:bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let l:emstr = a:2
  else
    let l:emstr = 'NONE,'
  endif

  let l:histring = [ 'hi', a:group,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:emstr[:-2], 'cterm=' . l:emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(l:histring, 'guisp=' . a:3[0])
  endif

  execute join(l:histring, ' ')
endfunction
"}}}
" Srcery Hi Groups: {{{

" memoize common hi groups
call s:HL('SrceryWhite', s:white)
call s:HL('SrceryRed', s:red)
call s:HL('SrceryGreen', s:green)
call s:HL('SrceryYellow', s:yellow)
call s:HL('SrceryBlue', s:blue)
call s:HL('SrceryMagenta', s:magenta)
call s:HL('SrceryCyan', s:cyan)
call s:HL('SrceryBlack', s:black)

call s:HL('SrceryRedBold', s:red, s:none, s:bold)
call s:HL('SrceryGreenBold', s:green, s:none, s:bold)
call s:HL('SrceryYellowBold', s:yellow, s:none, s:bold)
call s:HL('SrceryBlueBold', s:blue, s:none, s:bold)
call s:HL('SrceryMagentaBold', s:magenta, s:none, s:bold)
call s:HL('SrceryCyanBold', s:cyan, s:none, s:bold)

call s:HL('SrceryBrightRed', s:bright_red, s:none)
call s:HL('SrceryBrightGreen', s:bright_green, s:none)
call s:HL('SrceryBrightYellow', s:bright_yellow, s:none)
call s:HL('SrceryBrightBlue', s:bright_blue, s:none)
call s:HL('SrceryBrightMagenta', s:bright_magenta, s:none)
call s:HL('SrceryBrightCyan', s:bright_cyan, s:none)
call s:HL('SrceryBrightBlack', s:bright_black, s:none)
call s:HL('SrceryBrightWhite', s:bright_white)

" special
call s:HL('SrceryOrange', s:orange)
call s:HL('SrceryBrightOrange', s:bright_orange)
call s:HL('SrceryOrangeBold', s:orange, s:none, s:bold)
call s:HL('SrceryHardBlack', s:hard_black)
call s:HL('SrceryXgray1', s:xgray1)
call s:HL('SrceryXgray2', s:xgray2)
call s:HL('SrceryXgray3', s:xgray3)
call s:HL('SrceryXgray4', s:xgray4)
call s:HL('SrceryXgray5', s:xgray5)
call s:HL('SrceryXgray6', s:xgray6)

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:black[0]
  let g:terminal_color_8 = s:bright_black[0]

  let g:terminal_color_1 = s:red[0]
  let g:terminal_color_9 = s:bright_red[0]

  let g:terminal_color_2 = s:green[0]
  let g:terminal_color_10 = s:bright_green[0]

  let g:terminal_color_3 = s:yellow[0]
  let g:terminal_color_11 = s:bright_yellow[0]

  let g:terminal_color_4 = s:blue[0]
  let g:terminal_color_12 = s:bright_blue[0]

  let g:terminal_color_5 = s:magenta[0]
  let g:terminal_color_13 = s:bright_magenta[0]

  let g:terminal_color_6 = s:cyan[0]
  let g:terminal_color_14 = s:bright_cyan[0]

  let g:terminal_color_7 = s:white[0]
  let g:terminal_color_15 = s:bright_white[0]
endif

" }}}
" Setup Terminal Colors For Vim with termguicolors: {{{

if exists('*term_setansicolors')
  let g:terminal_ansi_colors = repeat([0], 16)

  let g:terminal_ansi_colors[0] = s:black[0]
  let g:terminal_ansi_colors[8] = s:bright_black[0]

  let g:terminal_ansi_colors[1] = s:red[0]
  let g:terminal_ansi_colors[9] = s:bright_red[0]

  let g:terminal_ansi_colors[2] = s:green[0]
  let g:terminal_ansi_colors[10] = s:bright_green[0]

  let g:terminal_ansi_colors[3] = s:yellow[0]
  let g:terminal_ansi_colors[11] = s:bright_yellow[0]

  let g:terminal_ansi_colors[4] = s:blue[0]
  let g:terminal_ansi_colors[12] = s:bright_blue[0]

  let g:terminal_ansi_colors[5] = s:magenta[0]
  let g:terminal_ansi_colors[13] = s:bright_magenta[0]

  let g:terminal_ansi_colors[6] = s:cyan[0]
  let g:terminal_ansi_colors[14] = s:bright_cyan[0]

  let g:terminal_ansi_colors[7] = s:white[0]
  let g:terminal_ansi_colors[15] = s:bright_white[0]
endif

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
"
if g:srcery_transparent_background == 1 && !has('gui_running')
  call s:HL('Normal', s:bright_white, s:none)
 else
  call s:HL('Normal', s:bright_white, s:black)
endif

if v:version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:xgray2)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  call s:HL('TabLineFill', s:bright_black, s:xgray2)
  call s:HL('TabLineSel', s:bright_white, s:xgray5)

  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  "
  if g:srcery_inverse_match_paren == 1
    call s:HL('MatchParen', s:white, s:none, s:inverse)
  else
    call s:HL('MatchParen', s:white, s:none)
  endif
endif

if v:version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:xgray2)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:white, s:none)

  " Line number of CursorLine
  if g:srcery_transparent_background == 1 && !has('gui_running')
    call s:HL('CursorLineNr', s:white, s:none)
  else
    call s:HL('CursorLineNr', s:white, s:black)
  endif

endif

hi! link NonText SrceryXgray4
hi! link SpecialKey SrceryBlue

" TODO: hmmm...
if g:srcery_inverse == 1
  call s:HL('Visual', s:none, s:none, s:inverse)
else
  call s:HL('Visual', s:none, s:xgray2, s:bold)
endif

hi! link VisualNOS Visual

if g:srcery_inverse == 1 && g:srcery_inverse_matches == 1
  call s:HL('Search', s:none, s:none, s:inverse)
  call s:HL('IncSearch', s:none, s:none, s:inverse)
else
  call s:HL('Search', s:none, s:xgray5, s:bold)
  call s:HL('IncSearch', s:none, s:xgray5, s:underline . s:bold)
endif

" TODO: find color
call s:HL('Underlined', s:white, s:none, s:underline)

call s:HL('StatusLine',   s:bright_white, s:xgray2)

if g:srcery_transparent_background == 1 && !has('gui_running')
  call s:HL('StatusLineNC', s:bright_black, s:none, s:underline)

  " The column separating vertically split windows
  call s:HL('VertSplit', s:bright_white, s:none)

  " Current match in wildmenu completion
  call s:HL('WildMenu', s:blue, s:none, s:bold)
else
  call s:HL('StatusLineNC', s:bright_black, s:black, s:underline)
  call s:HL('VertSplit', s:bright_white, s:black)
  call s:HL('WildMenu', s:blue, s:black, s:bold)
endif

" Directory names, special names in listing
hi! link Directory SrceryWhite

" Titles for output from :set all, :autocmd, etc.
hi! link Title SrceryWhite

" TODO: underline???
" Error messages on the command line
call s:HL('ErrorMsg', s:bright_white, s:red)

" More prompt: -- More --
hi! link MoreMsg SrceryWhite
" Current mode message: -- INSERT --
hi! link ModeMsg SrceryWhite
" 'Press enter' prompt and yes/no questions
hi! link Question SrceryWhite
" Warning messages
hi! link WarningMsg SrceryRed

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bright_black)

if g:srcery_transparent_background == 1 && !has('gui_running')
  " Column where signs are displayed
  " TODO Possibly need to fix  SignColumn
  call s:HL('SignColumn', s:none, s:none)
  " Line used for closed folds
  call s:HL('Folded', s:bright_black, s:none, s:italic)
  " Column where folds are displayed
  call s:HL('FoldColumn', s:bright_black, s:none)
else
  call s:HL('SignColumn', s:none, s:black)
  call s:HL('Folded', s:bright_black, s:black, s:italic)
  call s:HL('FoldColumn', s:bright_black, s:black)
endif

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:black, s:white)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

hi! link Special SrceryWhite

call s:HL('Comment', s:bright_black, s:none)

if g:srcery_transparent_background == 1 && !has('gui_running')
  call s:HL('Todo', s:bright_white, s:none)
else
  call s:HL('Todo', s:bright_white, s:black)
endif

call s:HL('Error', s:bright_white, s:red)

" String constant: "this is a string"
call s:HL('String', s:bright_white)

" Generic statement
hi! link Statement SrceryBrightWhite
" if, then, else, endif, swicth, etc.
hi! link Conditional SrceryBrightWhite
" for, do, while, etc.
hi! link Repeat SrceryBrightWhite
" case, default, etc.
hi! link Label SrceryBrightWhite
" try, catch, throw
hi! link Exception SrceryBrightWhite
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword SrceryBrightWhite

" Variable name
hi! link Identifier SrceryBrightWhite
" Function name
hi! link Function SrceryBrightWhite

" Generic preprocessor
hi! link PreProc SrceryBrightWhite
" Preprocessor #include
hi! link Include SrceryBrightWhite
" Preprocessor #define
hi! link Define SrceryBrightWhite
" Same as Define
hi! link Macro SrceryBrightWhite
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit SrceryBrightWhite

" Generic constant
hi! link Constant SrceryBrightWhite
" Character constant: 'c', '/n'
hi! link Character SrceryBrightWhite
" Boolean constant: TRUE, false
hi! link Boolean SrceryBrightWhite
" Number constant: 234, 0xff
hi! link Number SrceryBrightWhite
" Floating point constant: 2.3e10
hi! link Float SrceryBrightWhite

" Generic type
hi! link Type SrceryBrightWhite
" static, register, volatile, etc
hi! link StorageClass SrceryBrightWhite
" struct, union, enum, etc.
hi! link Structure SrceryBrightWhite
" typedef
hi! link Typedef SrceryBrightWhite

if g:srcery_dim_lisp_paren == 1
  hi! link Delimiter SrceryXgray6
else
  hi! link Delimiter SrceryBrightBlack
endif

" }}}
" Completion Menu: {{{

if v:version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:bright_white, s:xgray2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bright_white, s:blue, s:bold)

  if g:srcery_transparent_background == 1 && !has('gui_running')
    " Popup menu: scrollbar
    call s:HL('PmenuSbar', s:none, s:none)
    " Popup menu: scrollbar thumb
    call s:HL('PmenuThumb', s:none, s:none)
  else
    call s:HL('PmenuSbar', s:none, s:black)
    call s:HL('PmenuThumb', s:none, s:black)
  endif
endif

" }}}
" Diffs: {{{

if g:srcery_transparent_background == 1 && !has('gui_running')
  call s:HL('DiffDelete', s:red, s:none)
  call s:HL('DiffAdd',    s:green, s:none)
  call s:HL('DiffChange', s:cyan, s:none)
  call s:HL('DiffText',   s:yellow, s:none)
else
  call s:HL('DiffDelete', s:red, s:black)
  call s:HL('DiffAdd',    s:green, s:black)
  call s:HL('DiffChange', s:cyan, s:black)
  call s:HL('DiffText',   s:yellow, s:black)
endif

" }}}
" Spelling: {{{

if has('spell')
  " Not capitalised word, or compile warnings
  call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:cyan)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:magenta)
endif

" }}}
" Terminal: {{{

if has('terminal')
  " Must set an explicit background as NONE won't work
  " Therefore not useful with transparent background option
  call s:HL('Terminal', s:bright_white, s:hard_black)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" Sneak: {{{

hi! link Sneak Search
call s:HL('SneakScope', s:none, s:hard_black)
hi! link SneakLabel Search

" }}}
" GitGutter: {{{

hi! link GitGutterAdd SrceryGreen
hi! link GitGutterChange SrceryYellow
hi! link GitGutterDelete SrceryRed
hi! link GitGutterChangeDelete SrceryYellow

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile SrceryGreen
hi! link gitcommitDiscardedFile SrceryRed

" }}}
" vim-indent-guides: {{{

call s:HL('IndentGuidesEven', s:none, s:xgray3)
call s:HL('IndentGuidesOdd',  s:none, s:xgray4)

" }}}
" vim-startify {{{

hi! link StartifyNumber Statement
hi! link StartifyFile Normal
hi! link StartifyPath String
hi! link StartifySlash Normal
hi! link StartifyBracket Comment
hi! link StartifyHeader Type
hi! link StartifyFooter Normal
hi! link StartifySpecial Comment
hi! link StartifySection Identifier

" }}}
" fzf: {{{

call s:HL('fzf1', s:magenta, s:xgray2)
call s:HL('fzf2', s:bright_green, s:xgray2)
call s:HL('fzf3', s:bright_white, s:xgray2)

"}}}
" CtrlP: "{{{
hi! link CtrlPMatch SrceryMagenta
hi! link CtrlPLinePre SrceryBrightGreen
call s:HL('CtrlPMode1', s:bright_white, s:xgray3)
call s:HL('CtrlPMode2', s:bright_white, s:xgray5)
call s:HL('CtrlPStats', s:yellow, s:xgray2)
" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded SrceryGreen
hi! link diffRemoved SrceryRed
hi! link diffChanged SrceryCyan

hi! link diffFile SrceryOrange
hi! link diffNewFile SrceryYellow

hi! link diffLine SrceryBlue

" }}}
" Misc: {{{
call s:HL('shParenError', s:bright_white, s:bright_red)
call s:HL('ExtraWhitespace', s:none, s:red)
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker :
