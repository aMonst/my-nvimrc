require("mason").setup({
        PATH = "prepend",
        ui = {border = "rounded"}
        })

-- LSP 自动安装配置
require("mason-lspconfig").setup({
        ensure_installed = { -- LSP 服务安装列表
        "cmake",
        "clangd",
        "lua_ls",
        "pyright",
        "jsonls"
        },

        automatic_installation = true, -- 允许自动安装
        })

-- DAP自动安装配置
require("mason-nvim-dap").setup({
        ensure_installed = { "cpptools" }, -- 调试适配器列表
        automatic_installation = true,
        handlers = {} -- 可选调试器配置
        })
