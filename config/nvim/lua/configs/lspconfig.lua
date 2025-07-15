require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "css_variables", "cssmodules_ls", "pylsp", "luals", "tinymist", "clangd", "jsonls" }
vim.lsp.enable(servers)

vim.lsp.config("tinymist", {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      },
    },
  },
})
--
-- vim.lsp.config.pyright = {
--   cmd = {
--     "pyright-language-server",
--     "--stdio",
--   },
--   filetypes = { "python" },
--   root_markers = {
--     "pyproject.toml",
--     "setup.py",
--     "setup.cfg",
--     "requirements.txt",
--     "Pipfile",
--     "pyrightconfig.json",
--     ".git",
--   },
--   settings = {
--     python = {
--       analysis = {
--         autoSearchPaths = true,
--         diagnosticMode = "openFilesOnly",
--         useLibraryCodeforTypes = true,
--       },
--     },
--   },
-- }
--
-- vim.lsp.config.tinymist = {
--   cmd = {
--     "tinymist",
--   },
--   filetypes = { "typst" },
--   root_markers = { ".git" },
-- }

-- .config/nvim/lua/configs/lspconfig.lua
-- ...
vim.diagnostic.config { virtual_text = false }

-- read :h vim.lsp.config for changing options of lsp servers
