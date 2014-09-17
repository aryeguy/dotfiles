if has('autocmd')
    " Removes trailing spaces
    function! TrimWhiteSpace()
        %s/\s\+$//e
    endfunction

    " close sentence with comma or semi-colon
    augroup my_auto_commands
        autocmd!
        autocmd FileType javascript,css,json nnoremap <buffer> <silent> <leader>; :call cosco#commaOrSemiColon()<cr>
        autocmd FileType javascript,css,json inoremap <buffer> <silent> <leader>; <ESC>:call cosco#commaOrSemiColon()<cr>a

        " prevent indentation in jade
        autocmd FileType jade setlocal noautoindent
        autocmd FileType html setlocal matchpairs+=<:>

        " saving on lost focus
        autocmd FocusLost * :silent! wall
        autocmd FileType javascript,html,json,jade,vim autocmd FileWritePre,FileAppendPre,FilterWritePre,BufWritePre <buffer> call TrimWhiteSpace()

        " autocomplete
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        " autocmd FileType javascript setlocal omnifunc=syntaxcomplete#Complete
        " beautify
        autocmd FileType javascript,json nnoremap <buffer> <leader>js :call JsBeautify()<cr>
        autocmd FileType javascript,json vnoremap <buffer> <leader>js :call RangeJsBeautify()<cr>
        autocmd FileType html nnoremap <buffer> <leader>js :call HtmlBeautify()<cr>
        autocmd FileType html vnoremap <buffer> <leader>js :call RangeHtmlBeautify()<cr>
        autocmd FileType css nnoremap <buffer> <leader>js :call CSSBeautify()<cr>
        autocmd FileType css vnoremap <buffer> <leader>js :call RangeCSSBeautify()<cr>

        "pretty format json using python
        autocmd FileType json nnoremap <buffer> <leader>fj :%!python -m json.tool<cr>

        " Turn on spell check for certain filetypes automatically
        autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
        autocmd FileType gitcommit setlocal spell spelllang=en_us

        " set filestypes
        autocmd BufRead,BufNewFile *.ajs setlocal filetype=javascript
        autocmd BufRead,BufNewFile *.jshintrc,*.bowerrc setlocal filetype=json

        " reload vimrc when saved
        autocmd BufWritePost $MYVIMRC source $MYVIMRC

        autocmd WinLeave * setlocal nocursorline
        autocmd WinEnter * setlocal cursorline
        " Disable paste.
        autocmd InsertLeave * if &paste | set nopaste mouse=a | echo 'nopaste' | endif |
                    \ if &l:diff | diffupdate | endif
        autocmd InsertLeave * if &l:diff | diffupdate | endif

        " My auto commands
        autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
    augroup END
endif
