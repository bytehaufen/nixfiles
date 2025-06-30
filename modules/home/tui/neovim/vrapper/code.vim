" doc-title: Code

eclipseaction errors_resolve org.eclipse.jdt.ui.edit.text.java.correction.assist.proposals
" doc: Correction assist
nnoremap <leader>ca    :errors_resolve<cr>
" doc: Correction assist
vnoremap <leader>ca    :errors_resolve<cr>

eclipseuiaction errors_explain org.eclipse.ui.edit.text.showRulerAnnotationInformation
" doc: Explain error at point
nnoremap <leader>cd    :errors_explain<cr>
" doc: Explain error at point
vnoremap <leader>cd    :errors_explain<cr>

eclipseaction jumpJoinSplit_format org.eclipse.jdt.ui.edit.text.java.format
" doc: Reformat whole buffer
nnoremap <leader>cf    :jumpJoinSplit_format<cr>
" doc: Reformat selected lines
vnoremap <leader>cf    :jumpJoinSplit_format<cr>

eclipseaction helpHierarchy_callHierarchy org.eclipse.jdt.ui.edit.text.java.open.call.hierarchy
" doc: Show call hierarchy
nnoremap <leader>cc    :helpHierarchy_callHierarchy<cr>
" doc: Show call hierarchy
vnoremap <leader>cc    :helpHierarchy_callHierarchy<cr>

eclipseaction hierarchy_type org.eclipse.jdt.ui.edit.text.java.open.type.hierarchy
" doc: Show inheritance hierarchy
nnoremap <leader>ct    :hierarchy_type<cr>
" doc: Show inheritance hierarchy
vnoremap <leader>ct    :hierarchy_type<cr>

eclipseaction helpHierarchy_openJavadoc org.eclipse.jdt.ui.edit.text.java.open.external.javadoc
" doc: Open attached javadoc
nnoremap <leader>cj    :helpHierarchy_openJavadoc<cr>
" doc: Open attached javadoc
vnoremap <leader>cj    :helpHierarchy_openJavadoc<cr>

eclipseaction refactoring_organizeImports org.eclipse.jdt.ui.edit.text.java.organize.imports
" doc: Optimize imports
nnoremap <leader>co    :refactoring_organizeImports<cr>
" doc: Optimize imports
vnoremap <leader>co    :refactoring_organizeImports<cr>

eclipseaction refactoring_rename org.eclipse.jdt.ui.edit.text.java.rename.element
" doc: Rename
nnoremap <leader>cr     :refactoring_rename<cr>
" doc: Rename
vnoremap <leader>cr     :refactoring_rename<cr>

eclipseaction next_diagnostic org.eclipse.ui.navigate.next
nnoremap ]d           W:next_diagnostic<cr>

eclipseaction prev_diagnostic org.eclipse.ui.navigate.previous
nnoremap [d           :prev_diagnostic<cr>
