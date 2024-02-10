local M = {}

M.treesitter = {
  ensure_installed = {
    "python",
    "javascript",
    "typescript",
    "go",
    "tsx",
    "jsx",
    "html",
    "css",
    "c",
    "markdown",
    "markdown_inline",
    "prisma"
  },
  indent = {
    enable = true, 
    disable = {},
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettierd",
    "tailwindcss-language-server",
    "eslint-lsp",
    "prisma-language-server",

  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
