sy on

set tabstop=4
set shiftwidth=4
set number
set smarttab
set smartindent
set wrap
set showmatch 
set hlsearch
set incsearch
set ignorecase

set lz

syntax on
set nocp
filetype plugin on

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
if has("autocmd")
	  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif
endif
if (match(fnamemodify(expand("%"), ':e'), 'php'))
	set ff=unix
endif
