local ui = {}
local conf = require('modules.ui.config')

ui['kyazdani42/nvim-tree.lua'] = {
  cmd = {'NvimTreeToggle','NvimTreeOpen'},
  config = conf.nvim_tree,
  requires = {
    {'kyazdani42/nvim-web-devicons'},
    {'mortepau/codicons.nvim'},
    -- {'yamatsum/nvim-nonicons'},
  }
}

ui['ishan9299/nvim-solarized-lua'] = {
    config = conf.solarized
}

--[[ ui['ms-jpq/chadtree'] = {
    branch= 'chad',
    run = ':CHADdeps',
    config = function()
      local vim = vim;
      vim.g.chadtree_settings = {
        ["keymap.primary"] = {"l", "<enter>"},
        ["theme.text_colour_set"] = "solarized_dark"
      };
    end
} ]]

--[[ ui["rafamadriz/neon"] = {
    config = function ()
        vim.cmd("colorscheme neon")
    end
} ]]

--[[ ui['projekt0n/github-nvim-theme'] = {
    config = conf.github_theme
} ]]

--[[ ui['sainnhe/sonokai'] = {
    config = function ()
        vim.cmd([[let g:sonokai_style = 'espresso']]
        -- vim.cmd("colorscheme sonokai")
    -- end
-- } ]]

ui['hoob3rt/lualine.nvim'] = {
  config = conf.lualine,
  requires = {'kyazdani42/nvim-web-devicons', 'nvim-lua/lsp-status.nvim'}
}

ui['akinsho/nvim-bufferline.lua'] = {
  config = conf.nvim_bufferline,
  requires = 'kyazdani42/nvim-web-devicons'
}

--[[ ui['lukas-reineke/indent-blankline.nvim'] = {
  event = {'BufReadPre'},
  config = conf.indent_blankline
} ]]

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf.gitsigns,
  requires = {'nvim-lua/plenary.nvim',opt=true}
}

--[[ ui['mortepau/codicons.nvim'] = {
    event = {'BufRead','BufNewFile'},
    config = function ()
        require 'codicons'.setup{}
    end
} ]]

return ui
