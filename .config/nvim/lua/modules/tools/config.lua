local config = {}

function config.toggleterm()
  require('toggleterm').setup{
    direction = 'horizontal',
    start_in_insert = false,
    open_mapping = [[<c-\>]]
  }
end

function config.autopair()
  require('nvim-autopairs').setup{}
end

function config.markdown_preview()
  vim.g.mkdp_auto_start = 1
  -- vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')
end

return config
