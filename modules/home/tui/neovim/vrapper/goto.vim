" doc-title: Go to

eclipseaction go_declaration org.eclipse.jdt.ui.edit.text.java.open.editor
" doc: Declaration
nnoremap gD    :go_declaration<cr>

eclipseuiaction go_implementation org.eclipse.jdt.ui.edit.text.java.open.implementation
" doc: Implementation
nnoremap gI    :go_implementation<cr>

eclipseaction eclipsegotosuper org.eclipse.jdt.ui.edit.text.java.open.super.implementation
" doc: Go to super implementation
nnoremap gsi :eclipsegotosuper<cr>

" TODO: Refactor bind
eclipseuiaction eclipsetypehier org.eclipse.jdt.ui.edit.text.java.open.hierarchy
" doc: Open type hierarchy
nnoremap gjt :eclipsetypehier<cr>

eclipseaction go_nextMember org.eclipse.jdt.ui.edit.text.java.goto.next.member
" doc: Next member
nnoremap ]f    :go_nextMember<cr>

eclipseaction go_previousMember org.eclipse.jdt.ui.edit.text.java.goto.previous.member
" doc: Previous member
nnoremap [f    :go_previousMember<cr>
