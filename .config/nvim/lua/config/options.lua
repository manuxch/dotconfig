-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.g.maplocalleader = ","
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt_local.shiftwidth = 4 -- Tamaño de indentación
vim.opt_local.tabstop = 4 -- Número de espacios por tab
vim.opt_local.softtabstop = 4 -- Hace que la tecla de tabulador inserte 4 espacios
vim.opt.spell = false -- Desactiva el corrector ortográfico
vim.opt.spelllang = "es" -- Idioma por defecto español
vim.opt.wrap = true -- Activa el ajuste de línea

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.opt_local.expandtab = true -- Usa espacios en lugar de tabs
    vim.opt_local.shiftwidth = 2 -- Tamaño de indentación
    vim.opt_local.tabstop = 2 -- Número de espacios por tab
    vim.opt_local.softtabstop = 2 -- Hace que la tecla de tabulador inserte 2 espacios
  end,
})

vim.g.vimtex_indent_list = {
  { ["env"] = "shell", ["indent"] = false },
  { ["env"] = "verbatim", ["indent"] = false },
}
