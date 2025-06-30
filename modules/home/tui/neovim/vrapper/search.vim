" doc-title: Search

eclipseaction eclipsequicksearch org.eclipse.text.quicksearch.commands.quicksearchCommand
" doc: Open eclipse quick search
nnoremap <leader>sg :eclipsequicksearch<CR>
" doc: Open eclipse quick search
vnoremap <leader>sg :eclipsequicksearch<CR>

eclipseaction file_searchProject org.eclipse.search.ui.openFileSearchPage
" doc: File search
nnoremap <leader>ss     :file_searchProject<cr>
" doc: File search
vnoremap <leader>ss     :file_searchProject<cr>
