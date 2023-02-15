local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local packer = require'packer'

--have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

    --colorscheme
    use 'sainnhe/gruvbox-material'

    --devicons
    use 'nvim-tree/nvim-web-devicons'

    --lualine
    use 'nvim-lualine/lualine.nvim'

    --treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    --ts-rainbow
    use 'p00f/nvim-ts-rainbow'

    -- todo-comments
    -- USE TSInstall comment. intead of this below plugin
    -- https://github.com/stsewd/tree-sitter-comment
    -- TODO: something needs to be done
    -- TODO(stsewd): something needs to be done by @stsewd

    -- XXX: fix something else.
    -- XXX:    extra white spaces.

    -- (NOTE: this works too).

    -- NOTE-BUG (stsewd): tags can be separated by `-`
    -- NOTE_BUG: or by `_`.
    -- FIXME(stsewd) or FIXME
    -- use {
    -- "folke/todo-comments.nvim",
    -- requires = "nvim-lua/plenary.nvim",
    -- }

    --telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    --indent-blankline
    use 'lukas-reineke/indent-blankline.nvim'

    --nvim-colorizer
    use 'norcalli/nvim-colorizer.lua'

    --nvim-comment
    use 'terrortylor/nvim-comment'
    --context awate comments treesitter aware config in treesitter.lua
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    --file tree
    use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
        --    tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }

    --filetype
    use 'nathom/filetype.nvim'

    --nvim-autopairs
    --TODO see mapping for nvim-cmp for autopairs when installed
    use {
	    "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }


    -- --lsp
    -- use 'williamboman/mason.nvim'
    -- use 'williamboman/mason-lspconfig.nvim'
    -- use 'neovim/nvim-lspconfig'
    --
    -- trying out VonHeikemen/lsp-zero.nvim
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional
            
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional
            
            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    -- zenMode
    use {
        "folke/zen-mode.nvim",
        config = function ()
            require("zen-mode").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
