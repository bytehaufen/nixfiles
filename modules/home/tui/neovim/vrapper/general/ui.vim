" doc-title: UI

eclipseaction toggles_truncateLines org.eclipse.ui.edit.text.toggleWordWrap
" doc: Toggle word wrap
nnoremap <leader>uw    :toggles_truncateLines<cr>
" doc: Toggle word wrap
vnoremap <leader>uw    :toggles_truncateLines<cr>

eclipseaction toggles_whitespace org.eclipse.ui.edit.text.toggleShowWhitespaceCharacters
" doc: Toggle show white-spaces
nnoremap <leader>uW    :toggles_whitespace<cr>
" doc: Toggle show white-spaces
vnoremap <leader>uW    :toggles_whitespace<cr>
