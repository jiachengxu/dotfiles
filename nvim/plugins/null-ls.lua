local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {


  b.formatting.goimports_reviser.with({
    args = { "-output", "stdout", "-project-name", "github.com/akuityio", "$FILENAME" },
  }),
}

null_ls.setup {
  debug = true,
  sources = sources,
}
