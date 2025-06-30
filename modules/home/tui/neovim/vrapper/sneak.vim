" doc-title: vim-sneak - with `f`, `t`, `F`, `T` multi-line support

" doc: Sneak forward
nnoremap s    <Plug>(sneak_s)
" doc: Sneak forward
vnoremap s    <Plug>(sneak_s)
" doc: Sneak backward
nnoremap S    <Plug>(sneak_S)
" doc: Sneak backward
vnoremap S    <Plug>(sneak_S)

" doc: Sneak to next match
nnoremap ]s   <Plug>(sneak-next)
" doc: Sneak to next match
vnoremap ;    <Plug>(sneak-next)
" doc: Sneak to previous match
nnoremap [s   <Plug>(sneak-prev)
" doc: Sneak to previous match
vnoremap ,    <Plug>(sneak-prev)

nnoremap f    <Plug>(sneak_f)
vnoremap f    <Plug>(sneak_f)
nnoremap F    <Plug>(sneak_F)
vnoremap F    <Plug>(sneak_F)
nnoremap t    <Plug>(sneak_t)
vnoremap t    <Plug>(sneak_t)
nnoremap T    <Plug>(sneak_T)
vnoremap T    <Plug>(sneak_T)
