-- texlab formatea los .tex al guardar (LazyVim usa el formateo LSP como
-- respaldo porque conform no tiene formateador para tex). texlab llama a
-- latexindent; acá le pasamos una configuración local que declara los
-- entornos que no deben tocarse.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        texlab = {
          settings = {
            texlab = {
              latexFormatter = "latexindent",
              latexindent = {
                ["local"] = vim.fn.stdpath("config") .. "/latexindent/settings.yaml",
                modifyLineBreaks = false,
              },
            },
          },
        },
      },
    },
  },
}
