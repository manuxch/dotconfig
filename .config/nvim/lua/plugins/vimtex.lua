return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      -- 1. Visor de PDF (puedes usar "zathura" o "zathura_simple" según tus necesidades)
      vim.g.vimtex_view_method = "zathura"

      -- 2. Configuración del compilador (sin el error de callback)
      vim.g.vimtex_compiler_latexmk = {
        callback = 0, -- Desactiva la inyección de callbacks mediante echo
        continuous = 1,
        executable = "latexmk",
        options = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }

      -- 3. Evitar errores de indentación en entornos específicos
      -- Tratar entorno 'shell' como verbatim (minted)
      vim.g.vimtex_syntax_custom_envs = {
        shell = { verbatim = true },
      }

      -- Evitar la indentación automática dentro de 'shell' y otros entornos como document
      vim.g.vimtex_indent_ignored_envs = { "shell", "document" }

      -- OPCIONAL: Si deseas desactivar TODA la indentación automática que gestiona VimTeX
      -- (descomenta la siguiente línea si VimTeX te sigue añadiendo sangrías no deseadas en general):
      -- vim.g.vimtex_indent_enabled = 0

      -- 4. Desactivar ventana Quickfix emergente ruidosa
      vim.g.vimtex_quickfix_mode = 0
    end,
  },
}
