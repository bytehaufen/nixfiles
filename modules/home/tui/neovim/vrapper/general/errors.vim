" doc-title: Errors

eclipseaction errors_resolve org.eclipse.jdt.ui.edit.text.java.correction.assist.proposals
" doc: Correction assist
nnoremap <leader>ca    :errors_resolve<cr>
" doc: Correction assist
vnoremap <leader>ca    :errors_resolve<cr>


eclipseuiaction errors_explain org.eclipse.ui.edit.text.showRulerAnnotationInformation
" doc: Explain error at point. NOTE: If the cursor disappears enter insert mode.
nnoremap <leader>cd    :errors_explain<cr>
" doc: Explain error at point. NOTE: If the cursor disappears enter insert mode.
vnoremap <leader>cd    :errors_explain<cr>
