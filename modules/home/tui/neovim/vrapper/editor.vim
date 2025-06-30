" doc-title: Editor

" doc: Yank until end of line
nnoremap Y y$

" Clear search results with <Esc>
nnoremap <esc> :nohlsearch<cr>
" doc: Leave insert mode
inoremap jk <esc>

" doc: Delete char into black-hole register
nnoremap x  "_x

" doc: Repeat last macro with Q in normal mode
nnoremap Q @@

" doc: Move current line down
nnoremap <M-j> :.,.m<space>.+1<cr>

" doc: Move current line up
nnoremap <M-k> :.,.m<space>.-2<cr>

eclipseuiaction eclipseshowdoc org.eclipse.ui.edit.text.showInformation
" doc: Show documentation for current symbol
nnoremap K   :eclipseshowdoc<cr>

" doc: Comment paragraph
nnoremap gC    vipgc<cr><Esc><cr>

" doc: Copy and comment current line
nnoremap gl m'yyPgcc``
" doc: Copy and comment current line
vnoremap gl y`[P`[V`]gcj

" doc: Select enclosing element
nnoremap <c-space> <Plug>(eclipse-textobj:org.eclipse.jdt.ui.edit.text.java.select.enclosing)
" doc: Select enclosing element
vnoremap <c-space> <Plug>(eclipse-textobj:org.eclipse.jdt.ui.edit.text.java.select.enclosing)

eclipseaction contentassist org.eclipse.ui.edit.text.contentAssist.proposals
inoremap <c-space> <c-o>:contentassist<CR>


eclipseaction misc_closeFolds org.eclipse.ui.edit.text.folding.collapse_all
" doc: Close all folds
nnoremap zm    :misc_closeFolds<cr>
" doc: Close all folds
vnoremap zm    :misc_closeFolds<cr>

eclipseaction misc_openFolds org.eclipse.ui.edit.text.folding.expand_all
" doc: Open all folds
nnoremap zr    :misc_openFolds<cr>
" doc: Open all folds
vnoremap zr    :misc_openFolds<cr>
