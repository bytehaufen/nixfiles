" FIXME: Test

" doc-title: Format

au "Java Editor" eclipseaction jumpJoinSplit_format org.eclipse.jdt.ui.edit.text.java.format
" doc: Reformat whole buffer
nnoremap <leader>cf    :jumpJoinSplit_format<cr>
" doc: Reformat selected lines
vnoremap <leader>cf    :jumpJoinSplit_format<cr>
