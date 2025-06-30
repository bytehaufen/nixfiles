" doc-title: Go to

au "Java Editor" eclipseaction go_declaration org.eclipse.jdt.ui.edit.text.java.open.editor
" doc: Go to declaration
nnoremap gD    :go_declaration<cr>
" doc: Go to declaration
vnoremap gD    :go_declaration<cr>

au "Java Editor" eclipseuiaction go_implementation org.eclipse.jdt.ui.edit.text.java.open.implementation
" doc: Go to implementation
nnoremap gI    :go_implementation<cr>
" doc: Go to implementation
vnoremap gI    :go_implementation<cr>

au "Java Editor" eclipseaction go_nextMember org.eclipse.jdt.ui.edit.text.java.goto.next.member
" doc: Next member
nnoremap ]f    :go_nextMember<cr>
" doc: Next member
vnoremap ]f    :go_nextMember<cr>

au "Java Editor" eclipseaction go_previousMember org.eclipse.jdt.ui.edit.text.java.goto.previous.member
" doc: Previous member
nnoremap [f    :go_previousMember<cr>
" doc: Previous member
vnoremap [f    :go_previousMember<cr>
