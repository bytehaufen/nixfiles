" doc-title: File/Find

eclipseaction files_preferences org.eclipse.ui.window.preferences
" doc: Open Eclipse Settings
nnoremap <leader>fe     :files_preferences<cr>

" doc: Reload ~/.vrapperrc
nnoremap <leader>fE     :source ~/.vrapperrc<cr>

eclipseaction files_open org.eclipse.ui.navigate.openResource
" doc: Find Resource
nnoremap <leader>ff     :files_open<cr>
" doc: Find Resource
vnoremap <leader>ff     :files_open<cr>

eclipseaction files_new org.eclipse.ui.newWizard
" doc: New file wizard
nnoremap <leader>fn     :files_new<cr>

eclipseaction file_contextMenu org.eclipse.ui.window.showContextMenu
" doc: Show file context menu
nnoremap <leader>fc     :file_contextMenu<cr>
" doc: Show file context menu
vnoremap <leader>fc     :file_contextMenu<cr>

eclipseaction file_rulerContextMenu org.eclipse.ui.edit.text.showRulerContextMenu
" doc: Show ruler context menu
nnoremap <leader>fr     :file_rulerContextMenu<cr>
" doc: Show ruler context menu
vnoremap <leader>fr     :file_rulerContextMenu<cr>

eclipseaction applications_showView org.eclipse.ui.views.showView
" doc: Show view
nnoremap <leader>fv     :applications_showView<cr>

eclipseaction leader_findActions org.eclipse.ui.window.quickAccess
" doc: Open find actions 
nnoremap <leader>fa     :leader_findActions<cr>

eclipseaction files_packageExplorer org.eclipse.ui.views.showView(org.eclipse.ui.views.showView.viewId=org.eclipse.jdt.ui.PackageExplorer)
" doc: Package explorer
nnoremap <leader>e    :files_packageExplorer<cr>

eclipseaction files_projectExplorer org.eclipse.ui.views.showView(org.eclipse.ui.views.showView.viewId=org.eclipse.ui.navigator.ProjectExplorer)
" doc: Project explorer
nnoremap <leader>E    :files_projectExplorer<cr>

eclipseaction open_perspective org.eclipse.ui.window.nextPerspective
" doc: Open perspective
nnoremap <leader>fp    :open_perspective<cr>
