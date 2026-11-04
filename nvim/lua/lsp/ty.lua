vim.lsp.config('ty', {
  init_options = {
    experimental = {
      useUv = 'on',
    },
  },
})

vim.lsp.enable("ty")