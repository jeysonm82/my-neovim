lua << EOF
-- Setup LSP
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig')['pyright'].setup {
  capabilities = capabilities
}

-- Setup LSP-Saga 
local saga = require 'lspsaga'
saga.init_lsp_saga()

vim.fn.sign_define("LspDiagnosticsSignError",
    {text = "?", texthl = "Error"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
    {text = "?", texthl = "Warning"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
    {text = "?", texthl = "InfoFloat"})
vim.fn.sign_define("LspDiagnosticsSignHint",
    {text = "?", texthl = "HintFloat"})

--Symbols outline
vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = true,
    position = 'right',
    width = 25,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = 'Pmenu',
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
    symbols = {
        File = {icon = "", hl = "TSURI"},
        Module = {icon = "", hl = "TSNamespace"},
        Namespace = {icon = "", hl = "TSNamespace"},
        Package = {icon = "", hl = "TSNamespace"},
        Class = {icon = "𝓒", hl = "TSType"},
        Method = {icon = "ƒ", hl = "TSMethod"},
        Property = {icon = "", hl = "TSMethod"},
        Field = {icon = "", hl = "TSField"},
        Constructor = {icon = "", hl = "TSConstructor"},
        Enum = {icon = "ℰ", hl = "TSType"},
        Interface = {icon = "ﰮ", hl = "TSType"},
        Function = {icon = "", hl = "TSFunction"},
        Variable = {icon = "", hl = "TSConstant"},
        Constant = {icon = "", hl = "TSConstant"},
        String = {icon = "𝓐", hl = "TSString"},
        Number = {icon = "#", hl = "TSNumber"},
        Boolean = {icon = "⊨", hl = "TSBoolean"},
        Array = {icon = "", hl = "TSConstant"},
        Object = {icon = "⦿", hl = "TSType"},
        Key = {icon = "🔐", hl = "TSType"},
        Null = {icon = "NULL", hl = "TSType"},
        EnumMember = {icon = "", hl = "TSField"},
        Struct = {icon = "𝓢", hl = "TSType"},
        Event = {icon = "🗲", hl = "TSType"},
        Operator = {icon = "+", hl = "TSOperator"},
        TypeParameter = {icon = "𝙏", hl = "TSParameter"}
    }
}
-- Setup null ls
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.flake8.with({ timeout = 45000 }),
        --require("null-ls").builtins.diagnostics.pylint.with({ timeout = 45000 }),
        --require("null-ls").builtins.diagnostics.codespell,
        require("null-ls").builtins.diagnostics.misspell.with({ timeout = 45000 }),
        --require("null-ls").builtins.diagnostics.write_good.with({ timeout = 45000 }),
        --require("null-ls").builtins.formatting.autopep8,
        --require("null-ls").builtins.diagnostics.shellcheck.with({ timeout = 45000 }),
        require("null-ls").builtins.diagnostics.yamllint.with({ timeout = 45000 }),
    },
})

EOF

"Mappings
"nnoremap <silent><leader>ld :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>ld <Cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><leader>li <Cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent><leader>lt <Cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent><leader>lq <Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
"nnoremap <silent><leader>lf <Cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent><leader>lf :!autopep8 -i % && isort %<CR>
nnoremap <silent><leader>lc :Lspsaga code_action<CR>
vnoremap <silent><leader>lc :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent><leader>lk :Lspsaga hover_doc<CR>
nnoremap <silent><leader>ls :Lspsaga signature_help<CR>
nnoremap <silent><leader>lr :Lspsaga rename<CR>
nnoremap <silent><leader>lp :Lspsaga preview_definition<CR>
nnoremap <silent><leader>le :SymbolsOutline<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
