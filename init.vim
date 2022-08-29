:let platformunix = 0
:let path = $HOME . "/AppData/Local/nvim/"
:if !isdirectory("" . path)
:let platformunix = 1
:let unixpath = $HOME . "/.config/nvim/" 
:let path = unixpath
:endif

call plug#begin(path)
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'preservim/nerdcommenter'
Plug 'terrortylor/nvim-comment'
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'jakemason/ouroboros'
Plug 'tikhomirov/vim-glsl'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v1.*'}
Plug 'romgrk/barbar.nvim'
call plug#end()

:set hidden

nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>

vmap <Tab> >gv
vmap <S-Tab> <gv
nmap <Tab> >gv
nmap <S-Tab> <gv

:nnoremap <C-_> :CommentToggle<CR>
:vnoremap <C-_> :CommentToggle<CR>

" au VimEnter * :silent !setxkbmap -option caps:escape

" au VimLeave * :silent !setxkbmap -option

" set clipboard+=unnamed
set clipboard+=unnamedplus

set foldmethod=expr
set foldexpr=nvim_treesetter#foldexpr()

:execute "luafile " . path . "extra.lua"

:nnoremap <F5> :!.\gen_cc.bat<CR> :CocRestart<CR><CR>
:if platformunix
:nnoremap <F5> :!./gen_cc<CR> :CocRestart<CR><CR>
:endif

:nnoremap <c-s> :Ouroboros<CR>

autocmd vimenter * ++nested colorscheme gruvbox
set termguicolors 
autocmd CursorHold * silent call CocActionAsync('highlight')

filetype plugin on

let g:NERDCreateDefaultMappings = 1

nmap <silent> gd <Plug>(coc-definition)
inoremap <silent> ,s <C-r>=CocActionAsync('showSignatureHelp')<CR>

filetype plugin indent on

syntax enable

let g:vimtex_view_method = 'zathura'

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" let g:vimtex_compiler_method = 'latexrun'

" let maplocalleader = ","

:set tabstop=4
:set shiftwidth=4
:set expandtab
:set number

if has('nvim')

  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
endif

if has('nvim')
  " Terminal mode:
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
  " Insert mode:
  inoremap <M-h> <Esc><c-w>h
  inoremap <M-j> <Esc><c-w>j
  inoremap <M-k> <Esc><c-w>k
  inoremap <M-l> <Esc><c-w>l
  " Visual mode:
  vnoremap <M-h> <Esc><c-w>h
  vnoremap <M-j> <Esc><c-w>j
  vnoremap <M-k> <Esc><c-w>k
  vnoremap <M-l> <Esc><c-w>l
  " Normal mode:
  nnoremap <M-h> <c-w>h
  nnoremap <M-j> <c-w>j
  nnoremap <M-k> <c-w>k
  nnoremap <M-l> <c-w>l
endif


autocmd BufReadPost,FileReadPost * normal zR

