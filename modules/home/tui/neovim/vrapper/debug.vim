" doc-title: Debug

eclipseaction debug_listBreakpoints org.eclipse.ui.views.showView(org.eclipse.ui.views.showView.viewId=org.eclipse.debug.ui.BreakpointView)
" doc: List breakpoints
nnoremap <leader>dB    :debug_listBreakpoints<cr>

eclipseaction debug_toggleBreakpoint org.eclipse.debug.ui.commands.ToggleBreakpoint
" doc: Toggle breakpoint
nnoremap <leader>db    :debug_toggleBreakpoint<cr>

eclipseaction debug_debug org.eclipse.debug.ui.commands.DebugLast
" doc: Debug
nnoremap <leader>dd    :debug_debug<cr>

eclipseaction debug_kill org.eclipse.debug.ui.commands.Terminate
" doc: Kill execution
nnoremap <leader>dk    :debug_kill<cr>

eclipseaction debug_step org.eclipse.debug.ui.commands.StepInto
" doc: Step into
nnoremap <leader>di    :debug_step<cr>

eclipseaction debug_out org.eclipse.debug.ui.commands.StepReturn
" doc: Step out
nnoremap <leader>do    :debug_out<cr>

eclipseaction debug_next org.eclipse.debug.ui.commands.StepOver
" doc: Step over
nnoremap <leader>dO    :debug_next<cr>
" doc: Step over
nnoremap <leader>ds    :debug_next<cr>

eclipseaction debug_continue org.eclipse.debug.ui.commands.Resume
" doc: Continue (Go to next breakpoint)
nnoremap <leader>dc    :debug_continue<cr>

eclipseaction debug_toline org.eclipse.debug.ui.commands.RunToLine
" doc: Run to line
nnoremap <leader>dC    :debug_toline<cr>

eclipseaction debug_pause org.eclipse.debug.ui.commands.Suspend
" doc: Pause Execution
nnoremap <leader>dp    :debug_pause<cr>

eclipseaction debug_configuration org.eclipse.debug.ui.commands.OpenDebugConfigurations
" doc: Select debug configuration
nnoremap <leader>dr    :debug_configuration<cr>

