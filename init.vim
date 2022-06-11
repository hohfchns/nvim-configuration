call plug#begin('$HOME/AppData/Local/nvim')
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'jakemason/ouroboros'
Plug 'tikhomirov/vim-glsl'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

set foldmethod=expr
set foldexpr=nvim_treesetter#foldexpr()

:luafile $HOME/AppData/Local/nvim/extra.lua

:nnoremap <c-s> :Ouroboros<CR>

autocmd vimenter * ++nested colorscheme gruvbox
set termguicolors 
autocmd CursorHold * silent call CocActionAsync('highlight')

filetype plugin on
let g:NERDCreateDefaultMappings = 1

nmap <silent> gd <Plug>(coc-definition)
inoremap <silent> ,s <C-r>=CocActionAsync('showSignatureHelp')<CR>

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
