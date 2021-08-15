local config = {}

function config.nvim_lsp()
  require('modules.completion.lspconfig')
end

function config.golang()
  require'go'.setup{}
end

function config.lspkind() 
  require'lspkind'.init({
    with_text = false,
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
  })
end

function config.nvim_compe()
  require'compe'.setup {
    enabled = true;
    debug = false;
    min_length = 1;
    preselect = 'enabled';
    documentation = false;
    allow_prefix_unmatch = false;
    map_cr = true; --  map <CR> on insert mode
    map_complete = true; -- it will auto insert `(` after select function or method item
    source = {
      path = true;
      buffer = true;
      calc = true;
      vsnip = true;
      nvim_lsp = true;
      nvim_lua = true;
      spell = true;
      tags = true;
      snippets_nvim = false;
    };
  }
end

-- function config.vim_vsnip()
--   vim.g.vsnip_snippet_dir = os.getenv('HOME') .. '/.config/nvim/snippets'
-- enderror_sign

function config.telescope()
  local icons = require "nvim-nonicons"

  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd [[packadd plenary.nvim]] vim.cmd [[packadd popup.nvim]]
    vim.cmd [[packadd telescope-fzy-native.nvim]]
  end

  require('telescope').setup {
    defaults = {
      prompt_prefix = icons.get('telescope') .. " ",
      -- prompt_position = 'top',
      selection_caret = icons.get("arrow-right") .. " ",
      sorting_strategy = 'ascending',
      -- results_width = 0.6,
      -- preview_width = 0.6,
      -- prompt_position = 'top',
      layout_strategy = 'horizontal',
      file_ignore_patterns = {"node_modules"},
      layout_config = {
      	mirror = false,
        horizontal = {
          preview_cutoff = 120,
          prompt_position = "top"
        },
      },
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
  }
  require('telescope').load_extension('fzy_native')
--  require'telescope'.load_extension('dotfiles')
--  require'telescope'.load_extension('gosource')
end

function config.vim_vista()
  vim.g['vista#renderer#enable_icon'] = 1
  vim.g.vista_disable_statusline = 1
  vim.g.vista_default_executive = 'ctags'
  vim.g.vista_echo_cursor_strategy = 'floating_win'
  vim.g.vista_vimwiki_executive = 'markdown'
  vim.g.vista_executive_for = {
    vimwiki =  'markdown',
    pandoc = 'markdown',
    markdown = 'toc',
    typescript = 'nvim_lsp',
    typescriptreact =  'nvim_lsp',
    python = 'nvim_lsp',
    clangd = 'nvim_lsp',
    terraform = 'nvim_lsp',
    docker = 'nvim_lsp',
    go = 'nvim_lsp',
    javascript = 'nvim_lsp',
  }
end

function config.emmet()
  vim.g.user_emmet_complete_tag = 0
  vim.g.user_emmet_install_global = 0
  vim.g.user_emmet_install_command = 0
  vim.g.user_emmet_mode = 'i'
end

return config
