require("utils.global")
require("basic")
require("keybindings")
require("plugins")
require("colorscheme")

-- 插件配置
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.toggleterm")
require("plugin-config.indent-blankline")
-- require("plugin-config.gitsigns")
-- lsp
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
require("lsp.null-ls")

vim.cmd([[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
