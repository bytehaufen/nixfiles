" doc-title: Quit

eclipseaction quit_quit org.eclipse.ui.file.exit
" doc: Quit Eclipse
nnoremap <leader>qq    :quit_quit<cr>

eclipseaction quit_restart org.eclipse.ui.file.restartWorkbench
" doc: Restart Eclipse
nnoremap <leader>qr    :quit_restart<cr>
