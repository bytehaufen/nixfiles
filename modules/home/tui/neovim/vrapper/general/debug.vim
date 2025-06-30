" FIXME: Test

" doc-title: Debug

eclipseaction debug_listBreakpoints org.eclipse.ui.views.showView(org.eclipse.ui.views.showView.viewId=org.eclipse.debug.ui.BreakpointView)
" doc: List breakpoints
nnoremap <leader>dB    :debug_listBreakpoints<cr>
" doc: List breakpoints
vnoremap <leader>dB    :debug_listBreakpoints<cr>

eclipseaction debug_toggleBreakpoint org.eclipse.debug.ui.commands.ToggleBreakpoint
" doc: Toggle breakpoint
nnoremap <leader>db    :debug_toggleBreakpoint<cr>

eclipseaction debug_clearAllBreakpoints org.eclipse.debug.ui.commands.RemoveAllBreakpoints
" doc: Clear all breakpoints
nnoremap <leader>dC    :debug_clearAllBreakpoints<cr>

eclipseaction debug_continue org.eclipse.debug.ui.commands.Resume
" doc: Continue (Go to next breakpoint)
nnoremap <leader>dc    :debug_continue<cr>
" doc: Continue (Go to next breakpoint)
vnoremap <leader>dc    :debug_continue<cr>

eclipseaction debug_debug org.eclipse.debug.ui.commands.DebugLast
" doc: Debug
nnoremap <leader>dd    :debug_debug<cr>
" doc: Debug
vnoremap <leader>dd    :debug_debug<cr>

eclipseaction debug_kill org.eclipse.debug.ui.commands.Terminate
" doc: Kill execution
nnoremap <leader>dk    :debug_kill<cr>
" doc: Kill execution
vnoremap <leader>dk    :debug_kill<cr>

eclipseaction debug_next org.eclipse.debug.ui.commands.StepOver
" doc: Next (Step over)
nnoremap <leader>dn    :debug_next<cr>
" doc: Next (Step over)
vnoremap <leader>dn    :debug_next<cr>

eclipseaction debug_out org.eclipse.debug.ui.commands.StepReturn
" doc: Step out
nnoremap <leader>do    :debug_out<cr>
" doc: Step out
vnoremap <leader>do    :debug_out<cr>

eclipseaction debug_configuration org.eclipse.debug.ui.commands.OpenDebugConfigurations
" doc: Select debug configuration
nnoremap <leader>dr    :debug_configuration<cr>
" doc: Select debug configuration
vnoremap <leader>dr    :debug_configuration<cr>

eclipseaction debug_step org.eclipse.debug.ui.commands.StepInto
" doc: Step (Step into)
nnoremap <leader>ds    :debug_step<cr>
" doc: Step (Step into)
vnoremap <leader>ds    :debug_step<cr>
