-- 自动命令，自动命令组

if vim.fn.has "nvim-0.7" then
    -- 保存后自动加载配置文件
    local nvimrc = vim.api.nvim_create_augroup("NVIMRC", {clear = true})
    vim.api.nvim_create_autocmd({"BufWritePost"}, {
        pattern = "$MYVIMRC",
        group = nvimrc,
        command = [[source $MYVIMRC]]
    })

    vim.api.nvim_create_autocmd({"BufReadPost"}, {
        pattern = "init.lua",
        group = nvimrc,
        callback = function()
            vim.o.path = vim.o.path .. ",**/*"
        end
    })

    local auto_indent = vim.api.nvim_create_augroup("AUTO_INDENT", {clear = true})
    vim.api.nvim_create_autocmd({"BufWritePost"}, {
        pattern = "*",
        group = auto_indent,
        command = 'normal! gg=G``'
    })
    --    vim.api.nvim_create_autocmd({"VimEnter"}, {
    --        pattern = "*",
    --        group = auto_save_session,
    --        callback = load_session
    --    })
else
    vim.cmd[[
        augroup NVIMRC
        autocmd!
        autocmd BufWritePost $MYVIMRC source $MYVIMRC
        autocmd BufReadPost init.lua set path+=**/*
        autocmd BufWritePost * normal! gg=G``
        augroup END
        ]]

    --    vim.cmd[[
    --        augroup AUTO_SAVE_SESSION
    --            autocmd!
    --            autocmd ExitPre * lua save_session()
    --            autocmd VimEnter * lua load_session()
    --        augroup END
    --    ]]
end

