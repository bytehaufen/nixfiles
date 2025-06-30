" doc-title: Windows

" doc: Split vertically
nnoremap <leader>wv     <C-w>v

" doc: Split horizontally
nnoremap <leader>ws     <C-w>s

" doc: Maximize window
eclipseaction windows_maximize org.eclipse.ui.window.maximizePart
nnoremap <leader>wm    :windows_maximize<cr>

" doc: Focus window left
nnoremap <C-h>          <C-w>h

" doc: Focus window down
nnoremap <C-j>          <C-w>j

" doc: Focus window up
nnoremap <C-k>          <C-w>k

" doc: Focus window right
nnoremap <C-l>          <C-w>l

eclipseaction windows_delete org.eclipse.ui.file.close
" doc: Delete window
nnoremap <leader>wd     :windows_delete<cr>
