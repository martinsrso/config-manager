local completion = {}
local conf = require('modules.completion.config')

completion['ms-jpq/coq_nvim'] = {
  branch = 'coq',
  event = 'BufReadPre',
  run = ':COQdeps',
  requires = {
    {'ms-jpq/coq.artifacts', branch = 'artifacts'},
  }
}

completion['neovim/nvim-lspconfig'] = {
  event = 'BufReadPre',
  config = conf.nvim_lsp,
  requires = {
    {'ms-jpq/coq_nvim', opt = true},
  }
}

completion['glepnir/lspsaga.nvim'] = {
  cmd = 'Lspsaga',
}

completion['onsails/lspkind-nvim'] = {
  event = 'InsertEnter',
  config = conf.lspkind
}

--[[ completion['hrsh7th/nvim-compe'] = {
  event = 'InsertEnter',
  config = conf.nvim_compe,
} ]]

completion['hrsh7th/vim-vsnip'] = {
  event = 'InsertCharPre',
  -- config = conf.vim_vsnip
}

completion['rafamadriz/friendly-snippets'] = {
  event = 'InsertCharPre',
}

completion['nvim-telescope/telescope.nvim'] = {
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    {'nvim-lua/popup.nvim', opt = true},
    {'nvim-lua/plenary.nvim',opt = true},
    {'nvim-telescope/telescope-fzy-native.nvim',opt = true},
  }
}

completion['liuchengxu/vista.vim'] = {
  cmd = 'Vista',
  config = conf.vim_vista
}

completion['fatih/vim-go'] = {
  ft = 'go',
  -- run = ':GoInstallBinaries',
  -- config = conf.golang,
}

--[[ completion['ray-x/go.nvim'] = {
  ft = 'go',
  -- cmd = 'GoAddAllTest, GoAddTest',
  config = conf.golang,
} ]]

-- completion['glepnir/smartinput.nvim'] = {
--   ft = 'go',
--   config = conf.smart_input
-- }
-- 
-- completion['mattn/vim-sonictemplate'] = {
--   cmd = 'Template',
--   ft = {'go','typescript','lua','javascript','vim','rust','markdown'},
--   config = conf.vim_sonictemplate,
-- }

completion['mattn/emmet-vim'] = {
  event = 'InsertEnter',
  ft = {'html','css','javascript','javascriptreact','vue','typescript','typescriptreact'},
  config = conf.emmet,
}

return completion
