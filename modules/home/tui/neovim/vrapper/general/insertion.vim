" doc-title: Insertion

" doc: Insert lorem ipsum paragraph
nnoremap <leader>ilp    iLorem ipsum dolor sit amet, consectetuer adipiscing elit.  Donec hendrerit tempor tellus.  Donec pretium posuere tellus.  Proin quam nisl, tincidunt et, mattis eget, convallis nec, purus.  Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculous mus.  Nulla posuere.  Donec vitae dolor.  Nullam tristique diam non turpis.  Cras placerat accumsan nulla.  Nullam rutrum.  Name vestibulum accumsan nisl.<Esc>
vnoremap <leader>ilp    <Esc>iLorem ipsum dolor sit amet, consectetuer adipiscing elit.  Donec hendrerit tempor tellus.  Donec pretium posuere tellus.  Proin quam nisl, tincidunt et, mattis eget, convallis nec, purus.  Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculous mus.  Nulla posuere.  Donec vitae dolor.  Nullam tristique diam non turpis.  Cras placerat accumsan nulla.  Nullam rutrum.  Name vestibulum accumsan nisl.<Esc>

" doc: Insert lorem ipsum sentence
nnoremap <leader>ils    iLorem ipsum dolor sit amet, consectetuer adipiscing elit.
vnoremap <leader>ils    <Esc>iLorem ipsum dolor sit amet, consectetuer adipiscing elit.

" doc: Insert snippet
eclipseaction insertion_snippet org.eclipse.ui.views.showView(org.eclipse.ui.views.showView.viewId=org.eclipse.ui.texteditor.TemplatesView)
nnoremap <leader>is    :insertion_snippet<cr>
vnoremap <leader>is    :insertion_snippet<cr>
