set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
syntax on
set showcmd
set ruler

" Descomentar si queremos que aparezca una linea en la linea actual
"set cursorline
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
" Descomentar para que desaparezcan los modos a los que entramos
" set noshowmode
set hlsearch " highlight on search

let g:coc_global_extensions = [
\ 'coc-ultisnips',
\ 'coc-json',
\ 'coc-tsserver',
\ 'coc-html',
\ 'coc-css',
\ 'coc-yaml',
\ 'coc-highlight',
\ 'coc-pyright'
\ ]

autocmd CursorHold * silent call CocActionAsync('highlight')


call plug#begin(expand('~/.vim/plugged'))

" Temas
" OLD THEME
" Plug 'morhetz/gruvbox'
" New theme (Nord)
" Plug 'arcticicestudio/nord-vim'
" New theme (One Dark)
Plug 'joshdick/onedark.vim'

" Improved syntax highlighting for various languages
Plug 'sheerun/vim-polyglot'

" IDE
" Plugin para buscar rapido presionando Espacio + s
" Se usa con Espacio + s
Plug 'easymotion/vim-easymotion'
" Plugin para que aparezca un menu con carpetas y archivos
" Se usa con Espacio + nt
Plug 'scrooloose/nerdtree'
" Plugin para autocompletado
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() } }
" Plugin para busqueda al estilo vscode
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Javascript syntax
Plug 'pangloss/vim-javascript'		
" Typescript syntax
Plug 'leafgarland/typescript-vim'	

" Plugin para navegar entre ventanas sin usar el teclado
" Se usa con: Control + h,j,k,l
Plug 'christoomey/vim-tmux-navigator'

" Plugin para tener la barra de abajo con colores
Plug 'vim-airline/vim-airline'

" Plugin para buscar strings en todo el directorio -> https://github.com/dyng/ctrlsf.vim (ack command required)
Plug 'dyng/ctrlsf.vim'

call plug#end()


" OneDark Theme Settings (https://github.com/joshdick/onedark.vim)
let g:onedark_terminal_italics = 1
" if (has("autocmd"))
"   augroup colorextend
"     autocmd!
"     " Make `Function`s bold in GUI mode
"     autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
"     " Override the `Statement` foreground color in 256-color mode
"     autocmd ColorScheme * call onedark#extend_highlight("Statement", { "fg": { "cterm": 128 } })
"     " Override the `Identifier` background color in GUI mode
"     autocmd ColorScheme * call onedark#extend_highlight("Identifier", { "bg": { "gui": "#333333" } })
"   augroup END
" endif

" https://github.com/joshdick/onedark.vim#onedarkset_highlight
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:darkOrange = { "gui": "#FF8C00", "cterm": "208", "cterm16" : "12" }
    autocmd ColorScheme * call onedark#set_highlight("Todo", { "fg": s:darkOrange }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

"   colorscheme gruvbox
"   let g:gruvbox_contrast_dark = /"hard/"
colorscheme onedark
" colorscheme nord


" Search highlight custom color (LightBlue background and Black letters)
hi Search cterm=NONE ctermfg=Black ctermbg=LightBlue

" Set relative numbers colors
:hi LineNr cterm=bold ctermfg=51 " all lines
:hi LineNrAbove ctermfg=7 " lines above
:hi LineNrBelow ctermfg=7 " lines below

" para que el menu se salga solo una vez seleccionado un archivo :
let NERDTreeQuitOnOpen = 1

let g:airline_powerline_fonts = 1
let mapleader=" "

" Presionar Espacio + s para busquedas rapidas (en la misma vista)
nmap <Leader>s <Plug>(easymotion-s2)
" <CR> significa Enter
" <Leader> significa la tecla leader para llamar a los plugins
nmap <Leader>nt :NERDTreeFind<CR>

" ### ATAJOS PERSONALIZADOS ###
" GUARDAR: Espacio + w
nmap <Leader>w :w<CR>
" SALIR: Espacio + q
nmap <Leader>q :q<CR>



" ### START Coc settings

" Espacio + gd (buscar definicion)
nmap <Leader>gd <Plug>(coc-definition)
" Espacio + gr (buscar referencias)
nmap <Leader>gr <Plug>(coc-references)

" Formatting selected code.
xmap <Leader>f  <Plug>(coc-format-selected)
nmap <Leader>f  <Plug>(coc-format-selected)

" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ### END Coc settings



" buscar archivos con Control + p
nnoremap <C-p> :GFiles<CR>

" buscar palabras con Control + f
nnoremap <C-f> :Ag<CR>

" clear hightlight search once found
nnoremap <CR> :noh<CR>

" cambiar de forma cursor dependiendo el modo en vim
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
