return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      -- 1. Visor de PDF
      vim.g.vimtex_view_method = "zathura"

      -- 2. Configuración del compilador
      vim.g.vimtex_compiler_latexmk = {
        callback = 0,
        continuous = 1,
        executable = "latexmk",
        options = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }

      -- 3. Entornos de sintaxis personalizados (Sintaxis de lista corregida)
      vim.g.vimtex_syntax_custom_envs = {
        { name = "shell", verbatim = true },
      }

      -- Evitar la indentación automática dentro de 'shell' y otros entornos como document
      vim.g.vimtex_indent_ignored_envs = { "shell", "document" }

      -- 4. Desactivar ventana Quickfix emergente
      vim.g.vimtex_quickfix_mode = 0
    end,
  },
}
