local config = {}

function config.toggleterm()
  require('toggleterm').setup{
    direction = 'horizontal',
    start_in_insert = false,
    open_mapping = [[<c-\>]],

  }
end

function config.autopair()
  require('nvim-autopairs').setup{}
end

function config.editorconfig()
  -- require('editorconfig').setup{}
end


return config
