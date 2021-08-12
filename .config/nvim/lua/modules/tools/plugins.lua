local tools = {}
local conf = require('modules.tools.config')

tools['editorconfig/editorconfig-vim'] = {
  ft = { 'go','typescript','javascript','vim','rust','zig','c','cpp', 'python' },
  config = conf.editorconfig,
}

tools['brooth/far.vim'] = {
  cmd = {'Far','Farp'},
  config = function ()
    vim.g['far#source'] = 'rg'
  end
}

tools['iamcco/markdown-preview.nvim'] = {
  ft = 'markdown',
  config = function ()
    vim.g.mkdp_auto_start = 0
    -- vim.cmd('call mkdp#util#install()')
  end
}

tools['b3nj5m1n/kommentary'] = {
  event = 'BufReadPre'
}

tools['kdheepak/lazygit.nvim'] = {
  cmd = {'LazyGit'}
}

tools['akinsho/nvim-toggleterm.lua'] = {
  config = conf.toggleterm,
}

tools['windwp/nvim-autopairs'] = {
  event = 'InsertEnter',
  config = conf.autopair,
}

return tools
