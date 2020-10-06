" gui appearance setting the font
set gfn=Source\ Code\ Pro:h17
" set gfn=Robot\ Mono:h16
" set gfn=Anonymous\ Pro\ for\ Powerline:h18
" set gfn=Space\ Mono:h16
" set gfn=NovaMono\ for\ Powerline:h18
" set gfn=ProFont\ for\ Powerline:h15




" automatically change directory to the directory of the file
set autochdir

autocmd FocusLost * :wall
autocmd CursorHold * :update
autocmd CursorHoldI * :update



" For regular expressions turn magic on
set magic

" show commands in the right below corner
set showcmd

" Show matching brackets when text indicator is over them
set showmatch


" loop through spelling suggestions
let s:last_spell_changedtick = {}

function! LoopSpell()
    " Save current line and column
    let l:line = line('.')
    let l:col = col('.')
    " check if the current line/column is already in the last_spell_changedtick
    if has_key(s:last_spell_changedtick, l:line) == 0
      let s:last_spell_changedtick[l:line] = {}
    endif
    if has_key(s:last_spell_changedtick[l:line], l:col) == 0
      let s:last_spell_changedtick[l:line][l:col] = 0
    endif
    " If the value already exists, undo the change
    if s:last_spell_changedtick[l:line][l:col] != 0
      normal u
    endif
    " Get the current word
    let l:current_word = spellbadword()
    if len(l:current_word) == 0
      call <SID>Quit()
    endif
    " Get suggestions for the current word
    let s:current_word = l:current_word[0]
    let l:suggestions = spellsuggest(expand(s:current_word))
    " If the current word present no spelling suggestions, pass
    if len(suggestions) <= 0
      return
    endif
    " Replace the word with suggestion
    silent execute "normal! ce" . l:suggestions[s:last_spell_changedtick[l:line][l:col]]
    normal! b
    " Increment the count
    let s:last_spell_changedtick[l:line][l:col] = s:last_spell_changedtick[l:line][l:col] + 1
endfunction

function! LoopConfirm()
  let s:last_spell_changedtick = {}
endfunction

nnoremap zp :call LoopSpell()<CR>
nnoremap z= :call LoopConfirm()<CR>





" my autocmd


augroup Python
    " autocmd FileType python setlocal omnifunc=
    " autocmd FileType python set dict=
    autocmd FileType python hi Bang ctermfg=red guifg=red
    autocmd FileType python match Bang /\%>79v.*\%<81v/
    " autocmd BufRead,BufNewFile *.py let python_highlight_all=1
    " autocmd BufRead,BufNewFile *.py colorscheme abbott
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup AutoReloadVimRC
    autocmd!
    " automatically reload vimrc when it's saved
    autocmd! bufwritepost $MYVIMRC source $MYVIMRC
    autocmd! TextChanged $MYVIMRC source $MYVIMRC
    autocmd! InsertLeave $MYVIMRC source $MYVIMRC
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-gams
""""""""""""""""""""""""""""""""""""""""
augroup gamsmapping
    autocmd!
    au BufNewFile,BufRead *.gms	 setf gams
    " au BufWinEnter *.gms set colorcolumn=80
augroup END


" just in case you press it by mistake
" { Escape
map  <F1>   <Esc>
map! <F1>   <Esc>
" }

" Fast saving
nmap <leader>w :w!<cr>
inoremap <Esc> <Esc>:w!<Enter>


" Resize windows using <Alt> and h,j,k,l, inspiration from
" https://vim.fandom.com/wiki/Fast_window_resizing_with_plus/minus_keys
" (bottom page). If you enable mouse support, shorcuts below may not be
" necessary.
nnoremap <silent> <M-h> <C-w><
nnoremap <silent> <M-l> <C-w>>
nnoremap <silent> <M-j> <C-W>-
nnoremap <silent> <M-k> <C-W>+

" Open all buffers in tabs
map <leader>tb :tab ball<cr>



" =============================================================================
" =======================TABS==================================================
" =============================================================================

" Open all buffers in tabs
map <leader>tb :tab ball<cr>
"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
" Opens a new tab with the current buffer's path
nnoremap <silent> <S-t> :tabnew<CR>

" XXX
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/


" =============================================================================
" =============================================================================
" =============================================================================

" open old files
map <leader>bo :bro ol<cr>


" =============================================================================
" =============================================================================
" =============================================================================


" Insert a break in Python code
nnoremap <leader>be Ofrom IPython import embed;import ipdb;embed();ipdb.set_trace() # XXX <Esc>
nnoremap <leader>b Oimport ipdb;ipdb.set_trace() # XXX <Esc>

" =============================================================================
" ===================Calling custom functions==================================
" =============================================================================
" nmap <leader>e1 :call ColorDracula()<CR>
" nmap <leader>e2 :call ColorSeoul256()<CR>
" nmap <leader>e3 :call ColorForgotten()<CR>
" nmap <leader>e4 :call ColorZazen()<CR>
nmap <leader>t :call TrimWhitespace()<CR>

" =============================================================================
" ================Windows Management===========================================
" =============================================================================


" moving between split windows
"nnoremap <leader>hh <C-W><C-H>
"nnoremap <leader>jj <C-W><C-J>
"nnoremap <leader>kk <C-W><C-K>
"nnoremap <leader>ll <C-W><C-L>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <C-q> <C-w>4>
nnoremap <C-b> <C-w>4<
nnoremap <C-x> <C-w>4+
nnoremap <C-s> <C-w>4-

"" Buffer nav
noremap gp :bp<CR>
noremap gn :bn<CR>
"" Close buffer
noremap gd :bd<CR>
"" Split the current document
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>
noremap <leader>vb :vertical sba<CR>
" nnoremap <leader>sb :vert sb#<CR>

" visual search by * and #
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>


" =============================================================================
" ========================NEEDS WORK===========================================
" =============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" inserting spaces after commas
"%s/,\zs\ze\S/ /gc

" replace the word under curser with yanked value
nnoremap <leader>ss "adiwhp

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" start powershell in this folder if has windows
map <leader>ps :silent !start powershell<cr>
"
" This calls the anaconda terminal in current directory with environment model
" XXX run as admin TODO
map <leader>cs :silent !start cmd.exe "/K" C:\ProgramData\Anaconda3\Scripts\activate.bat C:\ProgramData\Anaconda3\envs\neovim<cr>

function! Demo()
  let curline = getline('.')
  call inputsave()
  let env = input('Enter env: ')
  call inputrestore()
endfunction



"nmap <leader>ea :AirlineTheme
"xmap <leader>a gaip*
"nmap <leader>a gaip*
"nmap <leader>s <C-w>s<C-w>j:terminal<CR>
"nmap <leader>vs <C-w>v<C-w>l:terminal<CR>

" XXX FIXME Working with Terminal I dont use it; I need to
" mapping escape to exit in terminal mode
tnoremap <Esc> <C-\><C-n>
" go to insert mode when entering the terminal
autocmd BufWinEnter,WinEnter term://* startinsert
" go to normal model when left the terminal
autocmd BufLeave term://* stopinsert


if exists('g:loaded_ale')
    " ALE move to next
    nmap <silent> <leader>aj :ALENext<cr>
    nmap <silent> <leader>ak :ALEPrevious<cr>
endif



