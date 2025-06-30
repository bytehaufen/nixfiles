" doc-tile: Misc

" doc: Close all folds
eclipseaction misc_closeFolds org.eclipse.ui.edit.text.folding.collapse_all
nnoremap zm    :misc_closeFolds<cr>
vnoremap zm    :misc_closeFolds<cr>

" doc: Open all folds
eclipseaction misc_openFolds org.eclipse.ui.edit.text.folding.expand_all
nnoremap zr    :misc_openFolds<cr>
vnoremap zr    :misc_openFolds<cr>

" TODO: Remove <C-/> from eclipse keybindings
nnoremap <C-/>     :leader_quickAccess<cr>

