local tools = {}
local conf = require('modules.tools.config')

tools['editorconfig/editorconfig-vim'] = {
  ft = { 'go','typescript','javascript','vim','rust','zig','c', 'cpp', 'python', 'md', 'yaml', 'yml', 'tf', 'Dockerfile' },
  event = 'BufReadPre',
}

tools['brooth/far.vim'] = {
  event = {'BufRead','BufNewFile'},
  cmd = {'Far','Farp'},
  config = function ()
    vim.g['far#source'] = 'rg'
  end
}

tools['kdheepak/lazygit.nvim'] = {
  event = {'BufRead','BufNewFile'},
  cmd = {'LazyGit'}
}

tools['TimUntersberger/neogit'] = {
    event = {'BufRead','BufNewFile'},
    config = function ()
                require('neogit').setup({})
             end,
    requires = 'nvim-lua/plenary.nvim',
}

tools['akinsho/nvim-toggleterm.lua'] = {
  event = {'BufRead','BufNewFile'},
  config = conf.toggleterm,
}

tools['windwp/nvim-autopairs'] = {
  event = 'InsertEnter',
  config = conf.autopair,
}

tools['iamcco/markdown-preview.nvim'] = {
  ft = 'markdown',
  run = [[sh -c 'cd app && yarn install']],
  config = conf.markdown_preview,
}

tools['b3nj5m1n/kommentary'] = {
  event = 'BufReadPre'
}

tools['mfussenegger/nvim-dap'] = {
    config = conf.debug,
    requires = {
        {'nvim-telescope/telescope-dap.nvim'},
        {'theHamsta/nvim-dap-virtual-text'},
    }
}

tools['rcarriga/nvim-dap-ui'] = {
    config = function ()
               require'dapui'.setup();
           end,
    requires = {
        'mfussenegger/nvim-dap',
    }
}

return tools
