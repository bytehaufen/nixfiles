" Split vertically
eclipseaction windows_splitVertically org.eclipse.ui.window.splitEditor(Splitter.isHorizontal=false)
nnoremap <leader>wv    <C-w>v
vnoremap <leader>wv    <C-w>v

" Split horizontally
eclipseaction windows_splitHorizontally org.eclipse.ui.window.splitEditor(Splitter.isHorizontal=true)
nnoremap <leader>ws    <C-w>s
vnoremap <leader>ws    <C-w>s

" Maximize window
eclipseaction windows_maximize org.eclipse.ui.window.maximizePart
nnoremap <leader>wm    :window_maximize<cr>
vnoremap <leader>wm    :window_maximize<cr>


" Focus window left
nnoremap <C-h>         <C-w>h
vnoremap <C-h>         <Esc><C-w>h

" Focus window down
nnoremap <C-j>         <C-w>j
vnoremap <C-j>         <Esc><C-w>j

" Focus window up
nnoremap <C-k>       <C-w>k
vnoremap <C-k>       <Esc><C-w>k

" Focus window right
nnoremap <C-l>          <C-w>l
vnoremap <C-l>          <Esc><C-w>l
