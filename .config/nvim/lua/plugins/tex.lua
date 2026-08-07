return {
  {
    "lervag/vimtex",
    lazy = false, -- VimTeX se encarga de su propio lazy-loading por tipo de archivo
    init = function()
      -- Configurar el visor de PDF por defecto
      vim.g.vimtex_view_method = "zathura_simple"

      -- Opcional: Si preferís que compile a PDF automáticamente al guardar el archivo .tex
      vim.g.vimtex_compiler_latexmk = {
        continuous = 1,
        callback = 1,
      }
      -- Tratar entorno 'shell' como verbatim (minted)
      vim.g.vimtex_syntax_custom_envs = {
        shell = { verbatim = true },
      }

      -- Evitar indentación automática dentro de 'shell'
      vim.g.vimtex_indent_ignored_envs = { "shell" }
    end,
  },
}
