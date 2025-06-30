" doc-title: Java Refactoring

eclipseaction refactoring_cleanUp org.eclipse.jdt.ui.edit.text.java.clean.up
" doc: Code cleanup
nnoremap <leader>jrc    :refactoring_cleanUp<cr>
" doc: Code cleanup
vnoremap <leader>jrc    :refactoring_cleanUp<cr>

eclipseaction refactoring_extractClass org.eclipse.jdt.ui.edit.text.java.extract.class
" doc: Extract class
nnoremap <leader>jreC    :refactoring_extractClass<cr>
" doc: Extract class
vnoremap <leader>jreC    :refactoring_extractClass<cr>

eclipseaction refactoring_extractConstant org.eclipse.jdt.ui.edit.text.java.extract.constant
" doc: Extract constant
nnoremap <leader>jrec    :refactoring_extractConstant<cr>
" doc: Extract constant
vnoremap <leader>jrec    :refactoring_extractConstant<cr>

eclipseaction refactoring_extractInterface org.eclipse.jdt.ui.edit.text.java.extract.interface
" doc: Extract interface
nnoremap <leader>jrei    :refactoring_extractInterface<cr>
" doc: Extract interface
vnoremap <leader>jrei    :refactoring_extractInterface<cr>

eclipseaction refactoring_extractMethod org.eclipse.jdt.ui.edit.text.java.extract.method
" doc: Extract method
vnoremap <leader>jrem    :refactoring_extractMethod<cr>

eclipseaction refactoring_extractLocalVariable org.eclipse.jdt.ui.edit.text.java.extract.local.variable
" doc: Extract local variable
nnoremap <leader>jrev    :refactoring_extractLocalVariable<cr>
" doc: Extract local variable
vnoremap <leader>jrev    :refactoring_extractLocalVariable<cr>

eclipseaction refactoring_extractSuperclass org.eclipse.jdt.ui.edit.text.java.extract.superclass
" doc: Extract superclass
nnoremap <leader>jres    :refactoring_extractSuperclass<cr>
" doc: Extract superclass
vnoremap <leader>jres    :refactoring_extractSuperclass<cr>

eclipseaction refactoring_generateGetterSetter org.eclipse.jdt.ui.edit.text.java.create.getter.setter
" doc: Generate getters and setters
nnoremap <leader>jrg    :refactoring_generateGetterSetter<cr>
" doc: Generate getters and setters
vnoremap <leader>jrg    :refactoring_generateGetterSetter<cr>

eclipseaction refactoring_generateHashcodeEquals org.eclipse.jdt.ui.edit.text.java.generate.hashcode.equals
" doc: Generate hashCode() and equals()
nnoremap <leader>jrh    :refactoring_generateHashcodeEquals<cr>
" doc: Generate hashCode() and equals()
vnoremap <leader>jrh    :refactoring_generateHashcodeEquals<cr>

eclipseaction refactoring_implementMethods org.eclipse.jdt.ui.edit.text.java.override.methods
" doc: Implement methods
nnoremap <leader>jrI    :refactoring_implementMethods<cr>
" doc: Implement methods
vnoremap <leader>jrI    :refactoring_implementMethods<cr>

eclipseaction refactoring_methodSignature org.eclipse.jdt.ui.edit.text.java.modify.method.parameters
" doc: Change method signature
nnoremap <leader>jrM    :refactoring_methodSignature<cr>
" doc: Change method signature
vnoremap <leader>jrM    :refactoring_methodSignature<cr>

eclipseaction refactoring_sortMembers org.eclipse.jdt.ui.edit.text.java.sort.members
" doc: Sort Members
nnoremap <leader>jrm    :refactoring_sortMembers<cr>
" doc: Sort Members
vnoremap <leader>jrm    :refactoring_sortMembers<cr>

eclipseaction refactoring_menu org.eclipse.jdt.ui.edit.text.java.refactor.quickMenu
" doc: Choose a refactoring action
nnoremap <leader>jrR    :refactoring_menu<cr>
" doc: Choose a refactoring action
vnoremap <leader>jrR    :refactoring_menu<cr>

eclipseaction refactoring_sourceMenu org.eclipse.jdt.ui.edit.text.java.source.quickMenu
" doc: Source menu
nnoremap <leader>jrS    :refactoring_sourceMenu<cr>
" doc: Source menu
vnoremap <leader>jrS    :refactoring_sourceMenu<cr>

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

