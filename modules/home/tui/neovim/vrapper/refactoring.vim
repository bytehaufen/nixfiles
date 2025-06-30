" doc-title: Refactoring

eclipseaction refactoring_cleanUp org.eclipse.jdt.ui.edit.text.java.clean.up
" doc: Code cleanup
nnoremap <leader>rc    :refactoring_cleanUp<cr>

eclipseaction refactoring_extractInterface org.eclipse.jdt.ui.edit.text.java.extract.interface
" doc: Extract interface
nnoremap <leader>ri    :refactoring_extractInterface<cr>

eclipseaction refactoring_implementMethods org.eclipse.jdt.ui.edit.text.java.override.methods
" doc: Implement methods
nnoremap <leader>rI    :refactoring_implementMethods<cr>

eclipseaction refactoring_extractMethod org.eclipse.jdt.ui.edit.text.java.extract.method
" doc: Extract method
vnoremap <leader>rm    :refactoring_extractMethod<cr>

eclipseaction refactoring_methodSignature org.eclipse.jdt.ui.edit.text.java.modify.method.parameters
" doc: Change method signature
nnoremap <leader>rM    :refactoring_methodSignature<cr>

eclipseaction refactoring_menu org.eclipse.jdt.ui.edit.text.java.refactor.quickMenu
" doc: Choose a refactoring action
nnoremap <leader>rr    :refactoring_menu<cr>
" doc: Choose a refactoring action
vnoremap <leader>rr    :refactoring_menu<cr>

eclipseaction refactoring_sourceMenu org.eclipse.jdt.ui.edit.text.java.source.quickMenu
" doc: Source menu
nnoremap <leader>rs    :refactoring_sourceMenu<cr>
" doc: Source menu
vnoremap <leader>rs    :refactoring_sourceMenu<cr>

eclipseaction refactoring_extractLocalVariable org.eclipse.jdt.ui.edit.text.java.extract.local.variable
" doc: Extract local variable
nnoremap <leader>rv    :refactoring_extractLocalVariable<cr>
