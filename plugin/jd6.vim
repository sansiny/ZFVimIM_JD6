let s:repoPath=expand('<sfile>:p:h:h')
function! s:dbInit()
    let repoPath = s:repoPath
    let dbFile = '/misc/jd6.txt'
    "let dbCountFile = '/misc/wubi_count.txt'

    let db = ZFVimIM_dbInit({
                \   'name' : 'JD6',
                \ })
               " "\   'dbCountFile' : dbCountFile,
    call ZFVimIM_cloudRegister({
                \   'repoPath' : repoPath,
                \   'dbFile' : dbFile,
                \   'gitUserEmail' : get(g:, 'ZFVimIM_JD6_gitUserEmail', get(g:, 'zf_git_user_email', '')),
                \   'gitUserName' : get(g:, 'ZFVimIM_JD6_gitUserName', get(g:, 'zf_git_user_name', '')),
                \   'gitUserToken' : get(g:, 'ZFVimIM_JD6_gitUserToken', get(g:, 'zf_git_user_token', '')),
                \   'dbId' : db['dbId'],
                \ })
endfunction

augroup ZFVimIM_JD6_augroup
    autocmd!
    autocmd User ZFVimIM_event_OnDbInit call s:dbInit()
augroup END

