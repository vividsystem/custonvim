local M = {}
local cmp = require("cmp")
local luasnip = require("luasnip")


function M.setup(servers)
	cmp.setup({
		enabled = true,
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered()
		},
		mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), 
			['<Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end
			)
   	 }),
		formatting = {
			fields = { "abbr", "menu", "kind" },
			format = function(entry, vim_item)
				vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. ' ' .. vim_item.kind
				vim_item.menu = ({
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					vsnip = "[Snippet]",
				})[entry.source.name]
				return vim_item
			end,
		},
		sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'nvim_lsp_signature_help' },
			}, {
				{ name = 'buffer' }
		})
	})

	cmp.setup.filetype('gitcommit', {
		sources = cmp.config.sources({
			{ name = 'cmp_git' },
		}, {
			{ name = 'buffer' }
		})
	})

end

return M
