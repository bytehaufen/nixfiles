" doc-title: Buffers

eclipseaction buffers_switchTab org.eclipse.ui.window.openEditorDropDown
" doc: Open Buffer drop down
nnoremap <leader>be    :buffers_switchTab<cr>

" doc: Close Buffer
nnoremap <leader>bd    :bdelete<cr>

" doc: Next Buffer
nnoremap <leader>bn    :tabnext<cr>
" doc: Next Buffer
nnoremap <S-l>         :tabnext<cr>

" doc: Previous buffer
nnoremap <leader>bp    :tabprevious<cr>
" doc: Previous buffer
nnoremap <S-h>         :tabprevious<cr>

eclipseaction buffers_revert org.eclipse.ui.file.revert
" doc: Revert unsaved in buffer
nnoremap <leader>bR    :buffers_revert<cr>

eclipseaction buffers_closeAll org.eclipse.ui.file.closeAll
" doc: Close all tabs
nnoremap <leader>bD    :buffers_closeAll<cr>

eclipseaction buffers_closeOthers org.eclipse.ui.file.closeOthers
" doc: Close other tabs
nnoremap <leader>bo    :buffers_closeOthers<cr>
