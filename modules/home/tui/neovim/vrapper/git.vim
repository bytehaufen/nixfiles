" doc-title: Git

eclipseaction git_compareWithCommit org.eclipse.egit.ui.team.CompareWithCommit
" doc: Compare working tree with commit
nnoremap <leader>ghD    :git_compareWithCommit<cr>

eclipseaction git_headCompare org.eclipse.egit.ui.team.CompareWithHead
" doc: Compare working tree with head
nnoremap <leader>ghd    :git_headCompare<cr>

eclipseaction git_fileLog org.eclipse.egit.ui.team.ShowHistory
" doc: Git file log
nnoremap <leader>gf    :git_fileLog<cr>

eclipseaction git_listRepositories org.eclipse.egit.ui.team.ShowRepositoriesView
" doc: List repositories
nnoremap <leader>gr    :git_listRepositories<cr>

eclipseaction git_add org.eclipse.egit.ui.team.AddToIndex
" doc: Git add
nnoremap <leader>ghs    :git_add<cr>

eclipseaction git_commit org.eclipse.egit.ui.team.Commit
" doc: Git commit
nnoremap <leader>gc    :git_commit<cr>

eclipseaction git_pull org.eclipse.egit.ui.team.Pull
" doc: Git pull
nnoremap <leader>gp    :git_pull<cr>

eclipseaction git_annotate org.eclipse.egit.ui.team.ShowBlame
eclipseaction git_toggleRevisionId org.eclipse.ui.editors.revisions.id.toggle
eclipseaction git_toggleRevisionAuthor org.eclipse.ui.editors.revisions.author.toggle
" doc: Git Blame   Note💡: Do it twice if it does not work
nnoremap <leader>gb    :git_toggleRevisionId<cr>:git_toggleRevisionAuthor<cr>:git_annotate<cr>
