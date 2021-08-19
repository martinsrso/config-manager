local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_args = bind.map_args
require('keymap.config')

local plug_map = {
    ["i|<CR>"]       = map_cmd([[compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))]]):with_noremap():with_expr():with_nowait(),
    ["i|<TAB>"]      = map_cmd('v:lua.tab_complete()'):with_expr():with_silent(),
    ["i|<S-TAB>"]    = map_cmd('v:lua.s_tab_complete()'):with_silent():with_expr(),
    ["n|gb"]             = map_cr("BufferLinePick"):with_noremap():with_silent(),
    -- Packer
    ["n|<leader>pu"]     = map_cr("PackerUpdate"):with_silent():with_noremap():with_nowait();
    ["n|<leader>pi"]     = map_cr("PackerInstall"):with_silent():with_noremap():with_nowait();
    ["n|<leader>pc"]     = map_cr("PackerCompile"):with_silent():with_noremap():with_nowait();
    -- Lsp mapp work when insertenter and lsp start
    ["n|<leader>lli"]     = map_cr("LspInfo"):with_noremap():with_silent():with_nowait(),
    ["n|<leader>llo"]     = map_cr("LspLog"):with_noremap():with_silent():with_nowait(),
    ["n|<leader>llr"]     = map_cr("LspRestart"):with_noremap():with_silent():with_nowait(),

    --[[ ["n|gd"]             = map_cr('<cmd>lua vim.lsp.buf.definition()<CR>'):with_noremap():with_silent(),
    ["n|[e"]             = map_cr('Lspsaga diagnostic_jump_next'):with_noremap():with_silent(),
    ["n|]e"]             = map_cr('Lspsaga diagnostic_jump_prev'):with_noremap():with_silent(),
    ["n|K"]              = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
    ["n|ga"]             = map_cr("Lspsaga code_action"):with_noremap():with_silent(),
    ["v|ga"]             = map_cu("Lspsaga range_code_action"):with_noremap():with_silent(),
    ["n|sd"]             = map_cr('Lspsaga preview_definition'):with_noremap():with_silent(),
    ["n|gD"]             = map_cmd("<cmd>lua vim.lsp.buf.implementation()<CR>"):with_noremap():with_silent(),
    ["n|gs"]             = map_cr('Lspsaga signature_help'):with_noremap():with_silent(),
    ["n|gr"]             = map_cr('Lspsaga rename'):with_noremap():with_silent(),
    ["n|gh"]             = map_cr('Lspsaga lsp_finder'):with_noremap():with_silent(),
    ["n|gt"]             = map_cmd("<cmd>lua vim.lsp.buf.type_definition()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>cw"]     = map_cmd("<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"):with_noremap():with_silent(), ]]

    ["n|gD"]             = map_cmd("<cmd>lua vim.lsp.buf.declaration()<CR>"):with_noremap():with_silent(),
    ["n|gd"]             = map_cmd("<cmd>lua vim.lsp.buf.definition()<CR>"):with_noremap():with_silent(),
    ["n|K"]              = map_cmd("<cmd>lua vim.lsp.buf.hover()<CR>"):with_noremap():with_silent(),
    ["n|gi"]             = map_cmd("<cmd>lua vim.lsp.buf.implementation()<CR>"):with_noremap():with_silent(),
    ["n|<C-k>"]          = map_cmd("<cmd>lua vim.lsp.buf.signature_help()<CR>"):with_noremap():with_silent(),
    ["n|;wa"]             = map_cmd("<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>"):with_noremap():with_silent(),
    ["n|;wr"]             = map_cmd("<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>"):with_noremap():with_silent(),
    ["n|;wl"]             = map_cmd("<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>"):with_noremap():with_silent(),
    ["n|;D"]      = map_cmd("<cmd>lua vim.lsp.buf.type_definition()<CR>"):with_noremap():with_silent(),
    ["n|;rn"]     = map_cmd("<cmd>lua vim.lsp.buf.rename()<CR>"):with_noremap():with_silent(),
    ["n|;ca"]     = map_cmd("<cmd>lua vim.lsp.buf.code_action()<CR>"):with_noremap():with_silent(),
    ["n|gr"]             = map_cmd("<cmd>lua vim.lsp.buf.references()<CR>"):with_noremap():with_silent(),
    ["n|;e"]      = map_cmd("<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>"):with_noremap():with_silent(),
    ["n|[d"]             = map_cmd("<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>"):with_noremap():with_silent(),
    ["n|]d"]             = map_cmd("<cmd>lua vim.lsp.diagnostic.goto_next()<CR>"):with_noremap():with_silent(),
    ["n|;q"]      = map_cmd("<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>"):with_noremap():with_silent(),
    ["n|;f"]      = map_cmd("<cmd>lua vim.lsp.buf.formatting()<CR>"):with_noremap():with_silent(),

    -- Plugin nvim-tree
    ["n|<Leader>e"]      = map_cr('NvimTreeToggle'):with_noremap():with_silent(),
    ["n|<Leader>F"]      = map_cr('NvimTreeFindFile'):with_noremap():with_silent(),
    -- Plugin MarkdownPreview
    ["n|<Leader>mp"]     = map_cu('MarkdownPreview'):with_noremap():with_silent(),
    -- Plugin DadbodUI
    -- ["n|<Leader>od"]     = map_cr('DBUIToggle'):with_noremap():with_silent(),
    ["n|<Leader>g"]      = map_cu("LazyGit"):with_noremap():with_silent(),
    -- Far.vim
    ["n|<Leader>fz"]     = map_cr('Farf'):with_noremap():with_silent();
    ["v|<Leader>fz"]     = map_cr('Farf'):with_noremap():with_silent();
    -- Plugin Telescope
    -- Files
    ["n|<Leader>ff"]     = map_cu('Telescope find_files'):with_noremap():with_silent(),
    ["n|<Leader>gf"]     = map_cu('Telescope git_files'):with_noremap():with_silent(),
    ["n|<Leader>rg"]     = map_cu('Telescope grep_string'):with_noremap():with_silent(),
    ["n|<Leader>lr"]     = map_cu('Telescope live_grep'):with_noremap():with_silent(),
    ["n|<Leader>fb"]     = map_cu('Telescope file_browser'):with_noremap():with_silent(),
    -- Vim picker
    ["n|<Leader>bb"]     = map_cu('Telescope buffers'):with_noremap():with_silent(),
    ["n|<Leader>cm"]     = map_cu('Telescope commands'):with_noremap():with_silent(),
    ["n|<Leader>of"]     = map_cu('Telescope oldfiles'):with_noremap():with_silent(),
    ["n|<Leader>qf"]     = map_cu('Telescope quickfix'):with_noremap():with_silent(),
    ["n|<Leader>ch"]     = map_cu('Telescope command_history'):with_noremap():with_silent(),
    -- Lsp
    ["n|<Leader>ws"]     = map_cu('Telescope lsp_workspace_symbols'):with_noremap():with_silent(),
    ["n|<Leader>dd"]     = map_cu('Telescope lsp_document_diagnostics'):with_noremap():with_silent(),
    ["n|<Leader>wd"]     = map_cu('Telescope lsp_workspace_diagnostics'):with_noremap():with_silent(),
    -- Git
    ["n|<Leader>gc"]     = map_cu('Telescope git_commits'):with_noremap():with_silent(),
    ["n|<Leader>gbc"]     = map_cu('Telescope git_bcommits'):with_noremap():with_silent(),

    --[[ ["n|<Leader>fd"]     = map_cu('Telescope dotfiles path='..os.getenv("HOME")..'/.dotfiles'):with_noremap():with_silent(),
    ["n|<Leader>fs"]     = map_cu('Telescope gosource'):with_noremap():with_silent(),
    ["n|<Leader>fg"]     = map_cu('DashboardFindWord'):with_noremap():with_silent(),
    ["n|<Leader>fh"]     = map_cu('DashboardFindHistory'):with_noremap():with_silent(),
    ["n|<Leader>ff"]     = map_cu('DashboardFindFile'):with_noremap():with_silent(), ]]
    -- Plugin acceleratedjk
    -- ["n|j"]              = map_cmd('v:lua.enhance_jk_move("j")'):with_silent():with_expr(),
    -- ["n|k"]              = map_cmd('v:lua.enhance_jk_move("k")'):with_silent():with_expr(),
    -- Plugin Vista
    ["n|<Leader>v"]      = map_cu('Vista!!'):with_noremap():with_silent(),
    -- Plugin hrsh7th/vim-eft
    ["n|;"]              = map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    ["x|;"]              = map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    ["n|f"]              = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["x|f"]              = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["o|f"]              = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["n|F"]              = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    ["x|F"]              = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    ["o|F"]              = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
}

bind.nvim_load_mapping(plug_map)
