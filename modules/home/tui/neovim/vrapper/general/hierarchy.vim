" doc-title: Hierarchy

au "Java Editor" eclipseaction helpHierarchy_callHierarchy org.eclipse.jdt.ui.edit.text.java.open.call.hierarchy
" doc: Show call hierarchy
nnoremap <leader>cc    :helpHierarchy_callHierarchy<cr>
" doc: Show call hierarchy
vnoremap <leader>cc    :helpHierarchy_callHierarchy<cr>

au "Java Editor" eclipseaction hierarchy_type org.eclipse.jdt.ui.edit.text.java.open.type.hierarchy
" doc: Show inheritance hierarchy
nnoremap <leader>ct    :hierarchy_type<cr>
" doc: Show inheritance hierarchy
vnoremap <leader>ct    :hierarchy_type<cr>

au "Java Editor" eclipseaction helpHierarchy_openJavadoc org.eclipse.jdt.ui.edit.text.java.open.external.javadoc
" doc: Open attached javadoc
nnoremap <leader>chd    :helpHierarchy_openJavadoc<cr>
" doc: Open attached javadoc
vnoremap <leader>chd    :helpHierarchy_openJavadoc<cr>


au "Java Editor" eclipseaction helpHierarchy_readAccess org.eclipse.jdt.ui.edit.text.java.search.read.access.in.workspace
" doc: Show read access in workspace
nnoremap <leader>chr    :helpHierarchy_readAccess<cr>
" doc: Show read access in workspace
vnoremap <leader>chr    :helpHierarchy_readAccess<cr>

au "Java Editor" eclipseaction helpHierarchy_showUsages org.eclipse.jdt.ui.edit.text.java.search.references.in.workspace
" doc: Show usages
nnoremap <leader>chu    :helpHierarchy_showUsages<cr>
" doc: Show usages
vnoremap <leader>chu    :helpHierarchy_showUsages<cr>

au "Java Editor" eclipseaction helpHierarchy_writeAccess org.eclipse.jdt.ui.edit.text.java.search.write.access.in.workspace
" doc: Show write access in workspace
nnoremap <leader>chw    :helpHierarchy_writeAccess<cr>
" doc: Show write access in workspace
vnoremap <leader>chw    :helpHierarchy_writeAccess<cr>

