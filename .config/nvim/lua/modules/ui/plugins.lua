local ui = {}
local conf = require('modules.ui.config')

--[[ ui['projekt0n/github-nvim-theme'] = {
  config = conf.githubtheme
} ]]

--[[ ui['ful1e5/onedark.nvim'] = {
  config = conf.onedark
} ]]

--[[ ui['briones-gabriel/darcula-solid.nvim'] = {
  config = conf.darcula,
  requires = 'rktjmp/lush.nvim'
} ]]

--[[ ui['shaunsingh/nord.nvim'] = {
  config = conf.nord
} ]]

ui['arcticicestudio/nord-vim'] = {
  config = conf.nord
}

ui['kyazdani42/nvim-tree.lua'] = {
  cmd = {'NvimTreeToggle','NvimTreeOpen'},
  config = conf.nvim_tree,
  requires = 'kyazdani42/nvim-web-devicons'
}

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf.gitsigns,
  requires = {'nvim-lua/plenary.nvim',opt=true}
}

ui['lukas-reineke/indent-blankline.nvim'] = {
  event = 'BufRead',
  branch = 'master',
  config = conf.indent_blakline
}

ui['akinsho/nvim-bufferline.lua'] = {
  config = conf.nvim_bufferline,
  requires = 'kyazdani42/nvim-web-devicons'
}

ui['hoob3rt/lualine.nvim'] = {
  config = conf.lualine,
  requires = {'kyazdani42/nvim-web-devicons', 'nvim-lua/lsp-status.nvim'}
}

--[[ ui['glepnir/galaxyline.nvim'] = {
  branch = 'main',
  config = conf.galaxyline,
  -- requires = {'kyazdani42/nvim-web-devicons', 'yamatsum/nvim-nonicons'}
  requires = {'kyazdani42/nvim-web-devicons'}
} ]]

-- ui['tjdevries/express_line.nvim'] = {
--   requires = {'nvim-lua/plenary.nvim'},
--   config = conf.expressline
-- }

ui['yamatsum/nvim-nonicons'] = {
  requires = {'kyazdani42/nvim-web-devicons'}
}

return ui
