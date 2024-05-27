return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  -- mason nvim
  {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettierd",
        "pylsp",
        "flake8",
        "typescript-language-server",
        "prisma-language-server",
        "python-lsp-server",
        "tailwindcss-language-server",
        "emmet-ls",
        "dockerfile-language-server",
        "docker_compose_language_service",
        "texlab",
      },
    },
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "prisma",
        "python",
        "javascript",
        "typescript",
        "dockerfile",
        "latex",
      },
    },
  },

  -- autosave
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle", -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    opts = {
      -- your config goes here
      -- or just leave it empty :)
    },
  },

  -- autotag
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascriptreact",
      "typescriptreact",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "ggandor/lightspeed.nvim",
    event = "VeryLazy",
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- multicursors
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "smoka7/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>m",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },

  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup {}
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- latex
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    ft = { "tex" },
    init = function()
      -- VimTeX configuration goes here
      vim.cmd "filetype plugin indent on"
      vim.cmd "syntax enable"

      -- Viewer options
      vim.g.vimtex_view_method = "zathura"
      -- vim.g.vimtex_view_general_viewer = 'okular'
      vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"

      -- Compiler method
      vim.g.vimtex_compiler_method = "tectonic"

      -- Mapping local leader key
      --[[  vim.g.maplocalleader = "," ]]

      -- Autocmd to set b: vimtex_main
      vim.api.nvim_create_augroup("VimTeX", { clear = true })
      vim.api.nvim_create_autocmd("BufReadPre", {
        group = "VimTeX",
        pattern = "$HOME/Note-Taking/*",
        callback = function()
          vim.b.vimtex_main = "$HOME/Note-Taking/Math/*.tex"
        end,
      })
    end,
    keys = {
      { "<localleader>ll", ":VimtexCompile<CR>", desc = "Compile LaTeX" },
      { "<localleader>lv", ":VimtexView<CR>", desc = "View PDF" },
    },
  },

  -- comment-nvim
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    lazy = false,
  },

  {

    "linux-cultist/venv-selector.nvim",

    pyenv_path = "~/.envs/dl",

    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },

    opts = {

      -- Your options go here

      -- name = "venv",

      -- auto_refresh = false
    },

    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping

    keys = {

      -- Keymap to open VenvSelector to pick a venv.

      { "<leader>ps", "<cmd>VenvSelect<cr>" },

      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).

      { "<leader>pc", "<cmd>VenvSelectCached<cr>" },
    },
  },
}
