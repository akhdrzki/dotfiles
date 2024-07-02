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

  --nvim rich presence
  {
    "IogaMaster/neocord",
    event = "VeryLazy",
    -- The setup config table shows all available config options with their default values:
    config = function()
      require("neocord").setup {
        -- General options
        logo = "auto", -- "auto" or url
        logo_tooltip = nil, -- nil or string
        main_image = "language", -- "language" or "logo"
        client_id = "1157438221865717891", -- Use your own Discord application client id (not recommended)
        log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
        debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
        blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
        file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
        show_time = true, -- Show the timer
        global_timer = false, -- if set true, timer won't update when any event are triggered

        -- Rich Presence text options
        editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
        terminal_text = "Using Terminal", -- Format string rendered when in terminal mode.
      }
    end,
  },

  --live server


  -- wakatime
  { "wakatime/vim-wakatime", lazy = false },
}
