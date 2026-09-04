return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    -- Visor configurado correctamente
    vim.g.vimtex_view_method = "zathura"

    -- Configuración del compilador para evitar el error de callback
    vim.g.vimtex_compiler_latexmk = {
      callback = 0, -- Desactiva la inyección de callbacks mediante echo en latexmk
      continuous = 1,
      executable = "latexmk",
      options = {
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }

    -- Desactiva mensajes ruidosos en la ventana Quickfix durante la compilación en segundo plano
    vim.g.vimtex_quickfix_mode = 0
  end,
}
