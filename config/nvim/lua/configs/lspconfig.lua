require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pylsp", "luals", "tinymist", "clangd" }
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

-- read :h vim.lsp.config for changing options of lsp servers
