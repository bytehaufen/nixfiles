" doc-title: Buffers

eclipseaction buffers_switchTab org.eclipse.ui.window.openEditorDropDown
" doc: Open Buffer drop down
nnoremap <leader>be    :buffers_switchTab<cr>

eclipseaction buffers_close org.eclipse.ui.file.close
" doc: Close tab
nnoremap <leader>bd    :buffers_close<cr>

" doc: Next tab
nnoremap <leader>bn    :tabnext<cr>
" doc: Next tab
nnoremap <S-l>         :tabnext<cr>

" doc: Previous tab
nnoremap <leader>bp    :tabprevious<cr>
" doc: Previous tab
nnoremap <S-h>         :tabprevious<cr>

eclipseaction buffers_revert org.eclipse.ui.file.revert
" doc: Revert buffer
nnoremap <leader>bR    :buffers_revert<cr>
" doc: Revert buffer
vnoremap <leader>bR    :buffers_revert<cr>

eclipseaction buffers_closeAll org.eclipse.ui.file.closeAll
" doc: Close all tabs
nnoremap <leader>bD    :buffers_closeAll<cr>
" doc: Close all tabs
vnoremap <leader>bD    :buffers_closeAll<cr>

eclipseaction buffers_closeOthers org.eclipse.ui.file.closeOthers
" doc: Close other tabs
nnoremap <leader>bo    :buffers_closeOthers<cr>
" doc: Close other tabs
vnoremap <leader>bo    :buffers_closeOthers<cr>

" TODO: Find eclipseaction  close to right / left
