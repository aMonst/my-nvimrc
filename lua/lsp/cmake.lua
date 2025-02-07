local lsp = require("lspconfig")
local lsp_set_key_map = require("keybindings")

local on_attach = function(client, bufnr)
    lsp_set_key_map.set_keymap(bufnr)
end

lsp.cmake.setup {
    auto_start = true,
    on_attach = on_attach
}
