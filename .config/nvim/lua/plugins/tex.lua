return {
  {
    "lervag/vimtex",
    lazy = false, -- VimTeX se encarga de su propio lazy-loading por tipo de archivo
    init = function()
      -- Configurar el visor de PDF por defecto
      vim.g.vimtex_view_method = "zathura"

      -- Opcional: Si preferís que compile a PDF automáticamente al guardar el archivo .tex
      vim.g.vimtex_compiler_latexmk = {
        continuous = 1,
        callback = 1,
      }
    end,
  },
}
