-- ~/.config/nvim/init.lua
vim.g.mapleader = " "

-- Completion UX: "popup" makes Nvim request completionItem/resolve previews,
-- "noselect" means nothing is pre-selected (accept with <C-y>).
vim.o.completeopt = "menuone,noselect,popup"
vim.o.updatetime = 300
vim.o.winborder = "rounded"
vim.o.pumborder = "rounded"   -- 0.12+


vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' }
}


require("keybinds")
require("lsp.ty")
require("lsp.rust-analyzer")
vim.lsp.completion.enable()
vim.cmd[[set completeopt+=menuone,noselect,popup]]
vim.lsp.start({
  name = 'ty',
  cmd = …,
  on_attach = function(client, bufnr)
    vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true,
      convert = function(item)
        return { abbr = item.label:gsub('%b()', '') }
      end,
    })
  end,
})


vim.lsp.codelens.enable(true)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    local buf = ev.buf

    -- 1) LSP completion, triggered on the server's triggerCharacters.
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, buf, { autotrigger = true })
    end

    -- 2) Extra keymaps (0.11/0.12 already give you gra grn grr gri grt grx gO K)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = "LSP: " .. desc })
    end
    map("n", "gd", vim.lsp.buf.definition, "definition")
    map("n", "gD", vim.lsp.buf.declaration, "declaration")
    map("n", "gh", vim.lsp.buf.hover, "hover")
    map("n", "<leader>ci", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }))
    end, "toggle inlay hints")
    map("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "format")

    -- 3) Format on save, but only if the server does not already do it
    if not client:supports_method("textDocument/willSaveWaitUntil")
      and client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("my.lsp.format", { clear = false }),
        buffer = buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

-- Optional: nice diagnostics
vim.diagnostic.config({
  virtual_text = { spacing = 2 },
  severity_sort = true,
  float = { border = "rounded", source = true },
})

require("nvim-tree").setup()
