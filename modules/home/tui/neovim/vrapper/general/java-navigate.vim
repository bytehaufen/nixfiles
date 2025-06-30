" doc-title: Java Navigate

eclipseaction jump_class org.eclipse.jdt.ui.navigate.open.type
" doc: Open type
nnoremap <leader>jt    :jump_class<cr>
" doc: Open type
vnoremap <leader>jt    :jump_class<cr>

eclipseuiaction jump_element org.eclipse.jdt.ui.edit.text.java.show.outline
" doc: Show quick outline
nnoremap <leader>jo    :jump_element<cr>
nnoremap <leader>cs    :jump_element<cr>
" doc: Show quick outline
vnoremap <leader>cs    :jump_element<cr>

