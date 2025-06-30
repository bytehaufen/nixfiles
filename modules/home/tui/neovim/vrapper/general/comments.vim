" doc-title:  Comments

" Comment paragraph
nnoremap gC    vip:comments_line<cr><Esc><cr>
vnoremap gC    <Esc>vip:comments_line<cr><Esc><cr>

" Copy and comment current line
nnoremap gl    yyP:comments_line<cr>j
vnoremap gl    <Esc>yyP:comments_line<cr>j
