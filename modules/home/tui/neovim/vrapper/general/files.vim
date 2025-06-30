" doc-title: Files

eclipseaction bookmarks_list org.eclipse.ui.views.showView(org.eclipse.ui.views.showView.viewId=org.eclipse.ui.views.BookmarkView)
" doc: List bookmarks
nnoremap <leader>fb    :bookmarks_list<cr>
" doc: List bookmarks
vnoremap <leader>fb    :bookmarks_list<cr>

eclipseaction files_preferences org.eclipse.ui.window.preferences
" doc: Open Eclipse Settings
nnoremap <leader>fe    :files_preferences<cr>
" doc: Open Eclipse Settings
vnoremap <leader>fe    :files_preferences<cr>

" doc: Reload ~/.vrapperrc
nnoremap <leader>fE    :source ~/.vrapperrc<cr>
" doc: Reload ~/.vrapperrc
vnoremap <leader>fE    :source ~/.vrapperrc<cr>

eclipseaction files_open org.eclipse.ui.navigate.openResource
" doc: Find files
nnoremap <leader>ff    :files_open<cr>
" doc: Find files
vnoremap <leader>ff    :files_open<cr>

eclipseaction file_searchProject org.eclipse.search.ui.openFileSearchPage
" doc: File search
nnoremap <leader>fg    :file_searchProject<cr>
" doc: File search
vnoremap <leader>fg    :file_searchProject<cr>

eclipseaction files_new org.eclipse.ui.newWizard
" doc: New file wizard
nnoremap <leader>fn    :files_new<cr>
" doc: New file wizard
vnoremap <leader>fn    :files_new<cr>

eclipseaction file_contextMenu org.eclipse.ui.window.showContextMenu
" doc: Show file context menu
nnoremap <leader>fc    :file_contextMenu<cr>
" doc: Show file context menu
vnoremap <leader>fc    :file_contextMenu<cr>

eclipseaction file_rulerContextMenu org.eclipse.ui.edit.text.showRulerContextMenu
" doc: Show ruler context menu
nnoremap <leader>fr    :file_rulerContextMenu<cr>
" doc: Show ruler context menu
vnoremap <leader>fr    :file_rulerContextMenu<cr>

eclipseaction applications_showView org.eclipse.ui.views.showView
" doc: Show view
nnoremap <leader>fv    :applications_showView<cr>

eclipseaction files_save org.eclipse.ui.file.save
" doc: Save file
nnoremap <c-s>    :files_save<cr>
" doc: Save file
vnoremap <c-s>    :files_save<cr>

eclipseaction files_saveAll org.eclipse.ui.file.saveAll
" doc: Save all files
nnoremap <c-s-s>    :files_saveAll<cr>
" doc: Save all files
vnoremap <c-s-s>    :files_saveAll<cr>

eclipseaction files_projectExplorer org.eclipse.ui.views.showView(org.eclipse.ui.views.showView.viewId=org.eclipse.ui.navigator.ProjectExplorer)
" doc: Project explorer
nnoremap <leader>e    :files_projectExplorer<cr>
" doc: Project explorer
vnoremap <leader>e    :files_projectExplorer<cr>
