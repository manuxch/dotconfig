-- ~/.config/nvim/lua/plugins/vimtex.lua

return {
  "lervag/vimtex",
  lazy = false, -- evita el lazy-loading para habilitar inverse search
  config = function()
    -- Visor PDF
    vim.g.vimtex_view_method = "zathura_simple"
    -- Alternativa: vim.g.vimtex_view_method = "sioyek"

    -- Tratar entorno 'shell' como verbatim (minted)
    vim.g.vimtex_syntax_custom_envs = {
      shell = { verbatim = true },
    }

    -- Evitar indentación automática dentro de 'shell'
    vim.g.vimtex_indent_ignored_envs = { "shell" }
  end,
  keys = {
    { "<localLeader>l", "", desc = "+vimtex" },
  },
}
