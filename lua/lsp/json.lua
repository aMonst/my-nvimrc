local lsp = require("lspconfig")
local lsp_set_key_map = require("keybindings")

local on_attach = function(client, bufnr)
    lsp_set_key_map.set_keymap(bufnr)
end

lsp.json.setup {
    on_attach = on_attach,
    settings = {
        json = {
            schemas = {
                {
                    fileMatch = { "CMakePresets.json", "CMakeUserPresets.json" },
                    url = "https://json.schemastore.org/cmake-presets"
                }
            }
        }
    }
}
