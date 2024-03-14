local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
end)

cmp.setup({
	mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Navigate between snippet placeholder
    ['<TAB>'] = cmp_action.luasnip_jump_forward(),
    ['<S-TAB>'] = cmp_action.luasnip_jump_backward(),
	})
})

-- Lua
require('lspconfig').lua_ls.setup({
	settings = {
		Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
	}
})
