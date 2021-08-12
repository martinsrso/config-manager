local api = vim.api
local lspconfig = require 'lspconfig'
local global = require 'core.global'

if not packer_plugins['lspsaga.nvim'].loaded then
  vim.cmd [[packadd lspsaga.nvim]]
end

--[[ if not packer_plugins['nvim-lspconfig'].loaded then
  vim.cmd [[packadd nvim-lspconfig]]
-- end ]]

local saga = require 'lspsaga'
saga.init_lsp_saga({
  code_action_icon = '',
  --[[ error_sign = '', -- 
  warn_sign = '',
  hint_sign = '',
  infor_sign = '', ]]
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

function _G.reload_lsp()
  vim.lsp.stop_client(vim.lsp.get_active_clients())
  vim.cmd [[edit]]
end

function _G.open_lsp_log()
  local path = vim.lsp.get_log_path()
  vim.cmd("edit " .. path)
end

vim.cmd('command! -nargs=0 LspLog call v:lua.open_lsp_log()')
vim.cmd('command! -nargs=0 LspRestart call v:lua.reload_lsp()')

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = true,
    signs = {
      enable = true,
      priority = 20
    },
    -- Disable a feature
    update_in_insert = false,
})

lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    "--header-insertion=iwyu",
  },
}

lspconfig.terraformls.setup{
  cmd = {
    "terraform-ls",
    "serve",
  },
  filetypes = {
    "terraform",
    "tf"
  },
 }

lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
}

lspconfig.yamlls.setup {
  schemas = {
    kubernetes = "globPattern"
  }
}

local servers = {
  'dockerls','bashls','pyright', 'tsserver', 'jsonls', 'html', 'gopls'
}

for _,server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = enhance_attach
  }
end
