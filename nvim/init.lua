-- default editor settings
require("ssossah.core")
require("ssossah.lazy")

--open alpha when all buffers are closed rather than unammed buffer
vim.cmd(
    [[ au BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) && winnr('$') == 1 | exec 'Alpha' | endif ]]
)


vim.cmd([[
    " Add search to quickfix list
    function! s:build_quickfix_list(lines)
      call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
      copen
      cc
    endfunction

    " Search for selected text, forwards or backwards.
    vnoremap <silent> * :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy/<C-R><C-R>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>
    vnoremap <silent> # :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy?<C-R><C-R>=substitute(
      \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>

    " Use K to show documentation in preview window.
"    nnoremap <silent> K :call <SID>show_documentation()<CR>
"    function! s:show_documentation()
"      if (index(['vim','help'], &filetype) >= 0)
"        execute 'h '.expand('<cword>')
"      else
"        call CocAction('doHover')
"      endif
"    endfunction


    """Rust
    autocmd FileType rust nnoremap <leader>t :Start -wait=always cargo nextest run<CR>

    """Python
    autocmd FileType python setlocal colorcolumn=80
    autocmd BufNewFile,BufRead *.jinja,*.jinja2 set ft=jinja
    autocmd BufWritePre *.py,*.rs,*lua,*rst,*.tsx :%s/\s\+$//e
    autocmd FileType python nnoremap <leader>ya :Start -wait=always pytest -svv %<CR>
    autocmd FileType python nnoremap <leader>yo "tyiw:Start -wait=always pytest -svv % -k <C-R>t<CR>

    """Go
    autocmd FileType go setlocal noexpandtab

    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
"    inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm()
"                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

]])
