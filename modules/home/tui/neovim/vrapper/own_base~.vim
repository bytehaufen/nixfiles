set ignorecase              " Case insensitive
set hlsearch                " Highlight search
set incsearch               " Incremental search
set cursorline              " Highlight current cursor line
set smartcase               " Search is case sensitive if pattern contains uppercase character
set contentassistmode       " Enables c-n and c-p to move selection up and down in the content-assist drop-down
set autochdir               " Automatically change the current working directory to the parent
set cleanindent             " Remove white-spaces in empty lines when <Esc>
set clipboard=unnamedplus   " Use system clipboard by default

" doc: Leader key
map <Space> <Leader>

" doc: Yank until end of line
nnoremap Y y$
" doc: Go to previous tab
nnoremap <S-h> :tabprevious<CR>
" doc: Go to next tab
nnoremap <S-l> :tabnext<CR>
" Clear search results with <Esc>
nnoremap <Esc> :nohlsearch<CR>
" doc: Leave insert mode
inoremap jk <Esc>
" doc: Incremental search
nnoremap s /
" doc: Incremental search - reverse
nnoremap S ?
" Move current line to top and scroll up 5 more lines
nnoremap zt  zt5<c-y>
" Move current line to bottom and scroll down 5 more lines
nnoremap zb  zb5<c-e>

eclipseaction eclipsequicksearch org.eclipse.text.quicksearch.commands.quicksearchCommand
" doc: Open eclipse quick search
nnoremap <Leader>sg :eclipsequicksearch<CR>

" doc: Close current buffer
nnoremap <Leader>bd :bdelete<CR>
" doc: Save current buffer
noremap <C-s> :w<cr>
" doc: Delete char into black-hole register
vnoremap x  "_d
" doc: Repeat last macro with Q in normal mode
nnoremap Q @@
" doc: Move current line down
nnoremap <M-j> :.,.m<space>.+1<cr>
" doc: Move current line up
nnoremap <M-k> :.,.m<space>.-2<cr>

eclipseaction eclipsenextmember org.eclipse.jdt.ui.edit.text.java.goto.next.member
" doc: Go to next java member
nnoremap ]f :eclipsenextmember<cr>

eclipseaction eclipseprevmember org.eclipse.jdt.ui.edit.text.java.goto.previous.member
" doc: Go to previous java member
nnoremap [f :eclipseprevmember<cr>

"version control
eclipseaction eclipsecomparehead org.eclipse.egit.ui.team.CompareWithHead
" doc: Compare buffer with head revision
nnoremap ghd :eclipsecomparehead<cr>

eclipseaction eclipsefindref org.eclipse.jdt.ui.edit.text.java.search.references.in.workspace
" doc: Open references
nnoremap gr :eclipsefindref<cr>

eclipseuiaction eclipsegotoimpl org.eclipse.jdt.ui.edit.text.java.open.implementation
" doc: Go to implementation
nnoremap gI :eclipsegotoimpl<cr>

eclipseuiaction eclipsetypehier org.eclipse.jdt.ui.edit.text.java.open.hierarchy
" doc: Open type hierarchy
nnoremap gjT :eclipsetypehier<cr>

eclipseuiaction eclipsegototype org.eclipse.jdt.ui.navigate.open.type
" doc: Go to type
nnoremap gjt :eclipsegototype<cr>

eclipseuiaction eclipseshowdoc org.eclipse.ui.edit.text.showInformation
" doc: Show documentation for current symbol
nnoremap K   :eclipseshowdoc<cr>

eclipseaction eclipsegotosuper org.eclipse.jdt.ui.edit.text.java.open.super.implementation
" doc:Go to super implementation
nnoremap gji :eclipsegotosuper<cr>

eclipseaction eclipserefactormenu org.eclipse.jdt.ui.edit.text.java.refactor.quickMenu
" doc: Show refactor menu
nnoremap <Leader>cer :eclipserefactormenu<cr>
" doc: Show refactor menu
vnoremap <Leader>cer :eclipserefactormenu<cr>gv

eclipseaction eclipsesrcgenmenu org.eclipse.jdt.ui.edit.text.java.source.quickMenu
" doc: Show source-code-generation menu
nnoremap <Leader>ces :eclipsesrcgenmenu<cr>
" doc: Show source-code-generation menu
vnoremap <Leader>ces :eclipsesrcgenmenu<cr>gv

eclipseaction eclipserename org.eclipse.jdt.ui.edit.text.java.rename.element
" doc: Rename current symbol
nnoremap <Leader>cr :eclipserename<cr>

eclipseuiaction eclipsequickfix org.eclipse.jdt.ui.edit.text.java.correction.assist.proposals
" doc: Show quick fix menu
nnoremap <Leader>ceq :eclipsequickfix<cr>
" doc: Show quick fix menu
vnoremap <Leader>ceq :eclipsequickfix<cr>

eclipseaction eclipsetogglebp org.eclipse.debug.ui.commands.ToggleBreakpoint
" doc: Toggle breakpoint
nnoremap <Leader>db :eclipsetogglebp<cr>

eclipseaction eclipseopenresource org.eclipse.ui.navigate.openResource

nnoremap <c-p> :eclipseopenresource<cr>

" amazing 'omnibox' that searches buffers, commands, views, menus, preferences, etc.
" eclipseaction eclipsecmdsearch org.eclipse.ui.window.quickAccess
" nnoremap <space> :eclipsecmdsearch<cr>

