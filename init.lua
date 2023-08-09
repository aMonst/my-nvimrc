-- 配置文件入口,主要负责加载其他配置文件
require("basic")
require("keybindings")
require("autocmd")
require("plugins")
require("plugin-config/tokyonight")
require("plugin-config/buffer")
require("plugin-config/nvimtree")
require("plugin-config/lualine")
require("plugin-config/dashboard")
require("plugin-config/whichkey")
require("plugin-config/toggleterm")
require("plugin-config/telescope")
require("plugin-config/auto_session")
require("plugin-config/treesitter")
require("plugin-config/cmp")
require("plugin-config/lspsaga")
require("plugin-config/symbols_outline")
require("plugin-config/mason")
require("plugin-config/dap-config")
require("plugin-config/dap-ui")
require('plugin-config/nvimgdb')
require('plugin-config/gitsigns')
require('plugin-config/orgmode')

-- 启用主题
vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[colorscheme vscode]]
