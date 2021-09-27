local config = {}

function config.toggleterm()
    require('toggleterm').setup{
        direction = 'horizontal',
        start_in_insert = false,
        open_mapping = [[<c-\>]]
    }
end

function config.autopair()
    local remap = vim.api.nvim_set_keymap
    local npairs = require('nvim-autopairs')

    npairs.setup({ map_bs = false })

    -- these mappings are coq recommended mappings unrelated to nvim-autopairs
    remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
    remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
    remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
    remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

    -- skip it, if you use another global object
    _G.MUtils= {}

    MUtils.CR = function()
        if vim.fn.pumvisible() ~= 0 then
            if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
                return npairs.esc('<c-y>')
            else
            -- you can change <c-g><c-g> to <c-e> if you don't use other i_CTRL-X modes
                return npairs.esc('<c-g><c-g>') .. npairs.autopairs_cr()
            end
        else
            return npairs.autopairs_cr()
        end
    end

    remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

    MUtils.BS = function()
        if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
            return npairs.esc('<c-e>') .. npairs.autopairs_bs()
        else
            return npairs.autopairs_bs()
        end
    end
    remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
end

function config.markdown_preview()
    vim.g.mkdp_auto_start = 1
    vim.g.mkdp_echo_preview_url = 0
    -- vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')
end

function config.debug()
    local dap = require("dap")

    dap.adapters.go = function(callback, config)
        local stdout = vim.loop.new_pipe(false)
        local handle
        local pid_or_err
        local port = 38697
        local opts = {
            stdio = {nil, stdout},
            args = {"dap", "-l", "127.0.0.1:" .. port},
            detached = true
        }
        handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
            stdout:close()
            handle:close()
            if code ~= 0 then
                print('dlv exited with code', code)
            end
        end)
        assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
        stdout:read_start(function(err, chunk)
            assert(not err, err)
            if chunk then
                vim.schedule(function()
                    require('dap.repl').append(chunk)
                end)
            end
        end)
        -- Wait for delve to start
        vim.defer_fn(
            function()
                callback({type = "server", host = "127.0.0.1", port = port})
            end,
            100)
      end

    dap.configurations.go = {
        {
            type = "go",
            name = "Debug",
            request = "launch",
            program = "${file}"
        },
        {
            type = "go",
            name = "Debug test", -- configuration for debugging test files
            request = "launch",
            mode = "test",
            program = "${file}"
        },
        {
            type = "go",
            name = "Stdin test", -- configuration for debugging test files
            request = "launch",
            program = "${file}",
            args = {"<", "examples/operations"}
        },
    }

    dap.configurations.lua = {
        {
            type = 'nlua',
            request = 'attach',
            name = "Attach to running Neovim instance",
            host = function()
                local value = vim.fn.input('Host [127.0.0.1]: ')
                if value ~= "" then
                    return value
                end
                    return '127.0.0.1'
            end,
            port = function()
                local val = tonumber(vim.fn.input('Port: '))
                assert(val, "Please provide a port number")
                return val
            end,
        }
    }

    dap.adapters.nlua = function(callback, config)
        callback({ type = 'server', host = config.host, port = config.port })
    end

end

return config
