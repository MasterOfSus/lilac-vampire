
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- random configs:
vim.wo.number = true

vim.opt.tabstop = 2

vim.opt.shiftwidth = 2

-- vim plug

local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- nvim-tree
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-tree/nvim-web-devicons')

-- vimtex
Plug('lervag/vimtex')

-- treesitter
Plug('nvim-treesitter/nvim-treesitter')

-- nvim-cmp, along with LuaSnip

Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('L3MON4D3/LuaSnip')
Plug('saadparwaiz1/cmp_luasnip')

-- plenary.nvim
Plug('nvim-lua/plenary.nvim')

-- nvim-telescope
Plug('nvim-telescope/telescope.nvim')

-- catppuccin theme
Plug('catppuccin/nvim')

-- status line
Plug('nvim-lualine/lualine.nvim')

-- startup screen
Plug('goolord/alpha-nvim')

vim.call('plug#end')

-- 24-bit colour

require("nvim-tree").setup({
  view = {
    width = 30,
  },
  filters = {
    dotfiles = true,
  },
})

-- vimtex configuration

vim.cmd([[
	filetype plugin indent on
	syntax enable
]])

vim.g.mapleader = ':'
vim.g.maplocalleader = ' '

vim.g.vimtex_view_method = "zathura"
-- vim.g.vimtex_compiler_method = "latex-mk"

-- treesitter configuration

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "latex", "cpp"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust", "latex", },
		additional_vim_regex_highlighting = { "latex", "markdown" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- lspconfig config
local lspconfig = require('lspconfig')
require'lspconfig'.clangd.setup {}
require'lspconfig'.texlab.setup {}

-- cmp configuration

local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
--[[
-- plenary?
local async = require "plenary.async"
-- dashboard?
require("startup").setup({theme = "dashboard"})

]]--

--catppuccin
vim.opt.termguicolors = true

vim.g.catppuccin_flavour = "macchiato"

local catppuccin = require("catppuccin")

catppuccin.setup {
	transparent_background = true,
  integrations = {
    cmp = true,
    nvimtree = true,
    treesitter = true,
    telescope = true,
	},
  color_overrides = {
    macchiato = {
      base = "#13081d", -- background pane
      crust = "#000000", -- huh?
      mantle = "#13081d", -- nvimtree pane
      surface0 = "#13081d", -- selection highlights
      surface1 = "#c182ff", -- numbers on the side 
      surface2 = "#c182ff", -- selection highlights??
      overlay0 = "#8b3fb2", -- comments 
      overlay1 = "#000000", -- selection highlights????
      overlay2 = "#68458a", -- suggestions secondary color 
      text = "#c182ff", -- suggestions main color
      subtext0 = "#000000", -- boh
      subtext1 = "#68458a", -- bohh
      blue = "#ffb86c", -- functions and nvimtree folders
      green = "#50fa7b", -- strings
      yellow = "#f1fa8c", -- classes
      red = "#ff5555", -- errors
      rosewater = "#ffadad", -- cursor?
      lavender = "#ff79c6", -- variable names 
      pink = "#ff95cc", -- boh
      -- teal = "", -- bohh
      -- mauve = "", -- huh?
      sapphire = "#d46059", -- sure this did something
      peach = "#ff5555", -- numbers and bools
      -- maroon = "", -- parameters
      sky = "#8be9fd", -- operators
    },
  },
}

vim.cmd.colorscheme "catppuccin"

require('lualine').setup({
  options = {
		icons_enabled = true,
		component_separators = {left = "", right = ""},
		section_separators = {left = "", right = ""},
		sections = {
    	lualine_a = {"mode"},
  		lualine_x = {"filename", "encoding", "fileformat"},
  		lualine_y = {"progress"},
			lualine_z = {"location"},
  	},
		theme = "catppuccin",
  },
})

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"      へ  ❤️  ╱|、     ",
	"    ૮ - ՛)  (` - 7    ",
	"    / ⁻៸|    |、⁻〵   ",
	" 乀(ˍ,ل ل    じしˍ,)ノ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "f", "  > Find file", ":Telescope find_files<CR>"),
		dashboard.button( "t", "󰉋  > File Manager", ":NvimTreeOpen<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
