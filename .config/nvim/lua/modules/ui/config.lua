local config = {}

function config.galaxyline()
  require('modules.ui.eviline')
end

function config.lualine()
  require("lualine").setup {
  options = {
    -- theme = "onedark",
    theme = "github",
    -- section_separators = {"", ""},
    section_separators = {" ", " "},
    component_separators = {"", ""},
    icons_enabled = true
  },
  sections = {
    lualine_a = {{"mode", upper = true}},
    lualine_b = {{"branch", icon = ""}},
    lualine_c = {{"filename", file_status = true}},
    lualine_x = {"encoding", "fileformat", "filetype", require'lsp-status'.status},
    lualine_y = {"progress"},
    lualine_z = {"location"}
-- require'lsp-status'.status, 
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

end

function config.githubtheme()
  require("github-theme").setup({
    -- themeStyle = "dark",
    themeStyle = "dimmed",
    -- themeStyle = "light",
    -- hideInactiveStatusline = true,
    darkSidebar = true,
    commentStyle = 'italic',
    darkFloat = true,
    -- colors = {bg_statusline = "#000000"}
  })
end

--[[ function config.githubtheme()
  require("onedark").setup({
    -- themeStyle = "dark",
    -- themeStyle = "dimmed",
    -- themeStyle = "light",
    hideInactiveStatusline = true,
    darkSidebar = true,
    commentStyle = 'italic',
    darkFloat = true,
    colors = {bg_statusline = "#000000"}
  })
end ]]

--[[ function config.darcula()
  vim.cmd('colorscheme darcula-solid')
end ]]

function config.nvim_tree()
  local tree_cb = require'nvim-tree.config'.nvim_tree_callback
  -- On Ready Event for Lazy Loading work
  require("nvim-tree.events").on_nvim_tree_ready(
    function()
      vim.cmd("NvimTreeRefresh")
    end
  )
  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_hide_dotfiles = 1
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_bindings = {
    { key = {"<CR>", "l", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
    { key = {"s"}, cb = tree_cb("split") },
    { key = {"i"}, cb = tree_cb("vsplit") },
  }
  vim.g.nvim_tree_icons = {
    default =  '',
    symlink =  '',
    git = {
     unstaged = "✚",
     staged =  "✚",
     unmerged =  "≠",
     renamed =  "≫",
     untracked = "★",
    },
  }
end

function config.gitsigns()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd [[packadd plenary.nvim]]
  end
  require('gitsigns').setup {
    signs = {
      add = {hl = 'GitGutterAdd', text = '▋'},
      change = {hl = 'GitGutterChange',text= '▋'},
      delete = {hl= 'GitGutterDelete', text = '▋'},
      topdelete = {hl ='GitGutterDeleteChange',text = '▔'},
      changedelete = {hl = 'GitGutterChange', text = '▎'},
    },
    keymaps = {
       -- Default keymap options
       noremap = true,
       buffer = true,

       ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
       ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

       ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
       ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
       ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
       ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
       ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

       -- Text objects
       ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
       ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>'
     },
  }
end

function config.indent_blakline()
  vim.g.indent_blankline_char = "│"
  vim.g.indent_blankline_show_first_indent_level = true
  vim.g.indent_blankline_show_end_of_line = true
  vim.g.indent_blankline_filetype_exclude = {
     "startify",
     "dashboard",
     "dotooagenda",
     "log",
     "fugitive",
     "gitcommit",
     "packer",
     "vimwiki",
     "markdown",
     "json",
     "txt",
     "vista",
     "help",
     "todoist",
     "NvimTree",
     "peekaboo",
     "git",
     "TelescopePrompt",
     "undotree",
     "flutterToolsOutline",
     "" -- for all buffers without a file type
  }
  vim.g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
  vim.g.indent_blankline_show_trailing_blankline_indent = false -- false default
  -- vim.g.indent_blankline_use_treesitter = true
  -- vim.g.indent_blankline_context_patterns 
  vim.g.indent_blankline_show_current_context = true
  vim.g.indent_blankline_context_patterns = {
    "class",
    "function",
    "method",
    "block",
    "list_literal",
    "selector",
    "^if",
    "^table",
    "if_statement",
    "while",
    "for",
    'import_statement',
    'labeled_statement'
  }
-- because lazy load indent-blankline so need readd this autocmd
  vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')
end

function config.nvim_bufferline()
  require('bufferline').setup{
    options = {
      -- modified_icon = '✥',
      buffer_close_icon = '',
      mappings = true,
      always_show_bufferline = false,
    }
  }
end

return config
