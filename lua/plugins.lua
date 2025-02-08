-- 插件管理文件

-- 自动安装 lazy 插件管理器
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- 管理插件
return require('lazy').setup({
    -- 主题配置
    'folke/tokyonight.nvim',
    'Mofiqul/vscode.nvim',
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = 'nvim-tree/nvim-web-devicons', -- optional
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons'
    },
    {'glepnir/dashboard-nvim', event = 'VimEnter', dependencies = {{'nvim-tree/nvim-web-devicons'}}},
    'folke/which-key.nvim',
    {'akinsho/toggleterm.nvim', version = '*', config = true},
    {
        'nvim-telescope/telescope.nvim', version = '0.1.8',
        dependencies = 'nvim-lua/plenary.nvim'
    },
    'nvim-telescope/telescope-file-browser.nvim',
    'rmagatti/auto-session',
    {'williamboman/mason.nvim', 
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "jay-babu/mason-nvim-dap.nvim", -- DAP支持
        }
    },
    'neovim/nvim-lspconfig',
    -- nvim-cmp
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    -- vsnip
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'rafamadriz/friendly-snippets',
    -- lspkind
    'onsails/lspkind-nvim',
    -- lspsaga
    'glepnir/lspsaga.nvim',
    'simrat39/symbols-outline.nvim',

    -- dap
    'mfussenegger/nvim-dap',
    { 'rcarriga/nvim-dap-ui', dependencies = {'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio'}},
    {'theHamsta/nvim-dap-virtual-text', dependencies = {'nvim-treesitter/nvim-treesitter' , 'mfussenegger/nvim-dap'}},
    {
        'sakhnik/nvim-gdb', 
        lazy=false,
        config = function()
            vim.g.nvimgdb_use_cmake_to_find_executables = 1
        end
    },

    --git
    'lewis6991/gitsigns.nvim',
    {'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim'},

    --org mode
    'nvim-orgmode/orgmode',
    -- cmake-tools
    {'Civitasv/cmake-tools.nvim', dependencies = 'nvim-lua/plenary.nvim'}
})

