return {
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },

    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.cmd("colorscheme gruvbox")
        end
    },

    "williamboman/mason.nvim",

    "williamboman/mason-lspconfig.nvim",

    {
        "neovim/nvim-lspconfig",
    },

    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts) require'lsp_signature'.setup(opts) end
    },

    'folke/neodev.nvim',
    
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
            'hrsh7th/cmp-nvim-lsp',
        },
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },


    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },


    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("lualine").setup({
                icons_enabled = true,
                theme = 'onedark',
            })
        end,
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },

    -- {
    --     "github/copilot.vim",
    -- },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    {
        'windwp/nvim-ts-autotag',
        opts = {
            enable = true,
            -- filetypes = { "html", "js", "ts", "tsx", "jsx" },fo
        }
    },

    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = true,
    },

    {
        'jay-babu/mason-nvim-dap.nvim',
    },

    {
        'mfussenegger/nvim-dap',
    },

    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
        },
    },

    {
        'mfussenegger/nvim-dap-python',
    },
    
    {
        'AckslD/swenv.nvim',
    },

    {
        'lewis6991/gitsigns.nvim',
    },

    {
        "NeogitOrg/neogit",
        dependencies = {
          "nvim-lua/plenary.nvim",         -- required
          "nvim-telescope/telescope.nvim", -- optional
          "sindrets/diffview.nvim",        -- optional
        },
        config = true
    },

    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true
    },

    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
            }
        end
    },

    {
        'jbyuki/nabla.nvim',
    },

    {
        'famiu/bufdelete.nvim',
    },

    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
          require('dashboard').setup { }
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'} }
    },

    {
        "zbirenbaum/copilot.lua",
    },

    {
        "sbdchd/neoformat",
    }
}
