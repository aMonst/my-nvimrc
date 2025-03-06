local opt = require("toggleterm").setup({
    open_mapping = [[<c-\>]],
    -- 以弹出式窗口的形式打开新终端
    direction = 'horizontal'
})


-- 快捷键
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<leader>l", "<Cmd> wincmd l<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<leader>h", "<Cmd> wincmd h<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<leader>j", "<Cmd> wincmd j<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<leader>k", "<Cmd> wincmd k<CR>", {noremap = true, silent = true})

-- 自定义终端
local Terminal = require("toggleterm.terminal").Terminal
local pyterm = Terminal:new({
    cmd = 'python',
    direction = 'horizontal'
})

local htopterm = Terminal:new({
    cmd = "htop",
    direction = "float"
})

function python_toggle()
    pyterm:toggle()
end

function htop_toggle()
    htopterm:toggle()
end

local lazygit_term = Terminal:new({
    cmd = 'lazygit',
    direction = 'float'
})

function lazygit_toggle()
    lazygit_term:toggle()
end

local yazi_term = Terminal:new({
    cmd = 'yazi',
    dir = vim.loop.cwd(),
    hidden = true,
    direction = "float",
    on_exit = function(term) -- 退出时的回调
        local tmpfile = vim.fn.expand("~/.yazi_selected")
        if vim.fn.filereadable(tmpfile) == 1 then
            local files = vim.fn.readfile(tmpfile)
            for _, file in ipairs(files) do
                vim.schedule(function()
                    -- 打开选中文件（支持多文件）
                    vim.cmd("edit " .. vim.fn.fnameescape(file))
                end)
            end
            os.remove(tmpfile) -- 清理临时文件
        end
        term:close() -- 关闭终端窗口
    end,
});

function yazi_toggle()
    yazi_term:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>py", "<Cmd>lua python_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>ht", "<Cmd>lua htop_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>lg", "<Cmd>lua lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>y", "<Cmd>lua yazi_toggle()<CR>", {noremap = true, silent = true})
