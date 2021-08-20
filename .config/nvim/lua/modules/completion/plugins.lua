local completion = {}
-- local vim = vim
local conf = require('modules.completion.config')

completion['ms-jpq/coq_nvim'] = {
  branch = 'coq',
  config = conf.coq,
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

completion['nvim-telescope/telescope.nvim'] = {
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    {'nvim-lua/popup.nvim', opt = true},
    {'nvim-lua/plenary.nvim',opt = true},
    {'mortepau/codicons.nvim'},
    {'nvim-telescope/telescope-fzy-native.nvim',opt = true},
  }
}

completion['liuchengxu/vista.vim'] = {
  cmd = 'Vista',
  config = conf.vim_vista
}

completion['kosayoda/nvim-lightbulb'] = {
    event = 'BufReadPre',
    config = function()
        vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
        require'nvim-lightbulb'.update_lightbulb {
            sign = {
                enabled = true,
                -- Priority of the gutter sign
                text = "💡",
                priority = 30,
            },
            float = {
                enabled = false,
                text = "💡",
                win_opts = {},
            },
            virtual_text = {
                enabled = false,
                text = "💡",
            },
            status_text = {
                enabled = false,
                text = "💡",
                text_unavailable = ""
            }
        }
    end
}

return completion
