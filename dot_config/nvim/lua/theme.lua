local present, themer = pcall(require, "themer")

if not present then
	return
end

themer.setup({
	colorscheme = "everforest",
	enable_installer = true,
	remaps = {
		palette = {
			everforest = {
				accent = "#7FBBB3"
			}
		},
	},
})

vim.cmd('colorscheme themer_everforest')
