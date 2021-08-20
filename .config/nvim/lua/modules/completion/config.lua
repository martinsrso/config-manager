local config = {}

function config.nvim_lsp()
    require('modules.completion.lspconfig')
end

function config.coq()
    local vim = vim
    vim.g.coq_settings = {
        ["auto_start"] = 'shut-up',
    }
end

function config.telescope()
local icons = require "codicons"

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
        file_ignore_patterns = {"node_modules, vendors"},
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

return config
