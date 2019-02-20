" Author: Sam Howie <samhowie@gmail.com>
" Description: Integration of hackfmt with ALE.

call ale#Set('hack_hackfmt_executable', 'hackfmt')
call ale#Set('hack_hackfmt_options', '')

function! ale#fixers#hackfmtdiff#Fix(buffer) abort
    let l:executable = ale#Var(a:buffer, 'hack_hackfmt_executable')
    let l:options = ale#Var(a:buffer, 'hack_hackfmt_options')

    return {
    \   'read_temporary_file': 1,
    \   'command': 'hg diff ' . bufname(a:buffer) . ' | ' . ale#Escape(l:executable)
    \       . ' --diff; cat ' . bufname(a:buffer) . ' > %t'
    \}
endfunction
