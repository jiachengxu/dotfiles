local present, mason_installer = pcall(require, "mason-tool-installer")

if not present then
  return
end

mason_installer.setup({

  -- a list of all tools you want to ensure are installed upon
  -- start; they should be the names Mason uses for each tool
  ensure_installed = {
    "bash-language-server",
    "dockerfile-language-server",
    "gopls",
    "json-lsp",
    "lua-language-server",
    "sqls",
    "terraform-ls",
    "yaml-language-server",
    "rust-analyzer",
  },
  run_on_start = true,
  start_delay = 1000, -- 1 second delay
})
