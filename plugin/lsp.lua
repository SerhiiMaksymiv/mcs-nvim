---[[ LSP configuration

-- INFO: read filenames on lsp/ directory and enable those
local lsp_files = {}
local lsp_dir = vim.fn.stdpath("config") .. "/lsp/"

for _, file in ipairs(vim.fn.globpath(lsp_dir, "*.lua", false, true)) do
    -- Read the first line of the file
    local f = io.open(file, "r")
    local first_line = f and f:read("*l") or ""
    if f then
        f:close()
    end
    -- Only include the file if it doesn't start with "-- disable"
    if not first_line:match("^%-%- disable") then
        local name = vim.fn.fnamemodify(file, ":t:r") -- `:t` gets filename, `:r` removes extension
        table.insert(lsp_files, name)
    end
end

vim.lsp.enable(lsp_files)

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.ERROR] = " ",
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if not client then
            return
        end

        ---[[ Format and autoimport on Save
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                if client:supports_method("textDocument/formatting") then
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end

                --[[
                if client:supports_method("textDocument/codeAction") then
                    local function apply_code_action(action_type)
                        local ctx = { only = action_type, diagnostics = {} }
                        local actions = vim.lsp.buf.code_action({ context = ctx, apply = true, return_actions = true })

                        -- only apply if code action is available
                        if actions and #actions > 0 then
                            vim.lsp.buf.code_action({ context = ctx, apply = true })
                        end
                    end
                    -- apply_code_action({ "source.fixAll" })
                    apply_code_action({ "source.organizeImports" })
                end
                --]]
            end,
        })
        ---]]

        ---[[ Disable default formatting
        if client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
        end

        if client.name == "lua_ls" then
            client.server_capabilities.documentFormattingProvider = false
        end
        ---]]

        ---[[ Lsp Keymaps
        local nmap = function(keys, func, desc)
            if desc then
                desc = "LSP: " .. desc
            end
            vim.keymap.set("n", keys, func, { buffer = args.buf, noremap = true, silent = true, desc = desc })
        end


        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap("<leader>dr", vim.lsp.buf.references, "References")

        nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
        nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- See `:help K` for why this keymap
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        -- Lesser used LSP functionality
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        nmap("K", vim.lsp.buf.hover, "Open hover")
        nmap("<leader>ds", "<cmd>vs | lua vim.lsp.buf.definition()<cr>", "Goto definition (v-split)")
        nmap("<leader>dh", "<cmd>sp | lua vim.lsp.buf.definition()<cr>", "Goto definition (h-split)")

        -- Diagnostic
        nmap("dn", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Goto next diagnostic")
        nmap("dN", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Goto prev diagnostic")
        nmap("<leader>q", vim.diagnostic.setloclist, "Open diagnostics list")
        nmap("<leader>e", vim.diagnostic.open_float, "Open diagnostic float")

        -- inlay hints
        nmap("<leader>lh", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, "Toggle inlay hints")

        vim.api.nvim_buf_create_user_command(args.buf, "Fmt", function(_) vim.lsp.buf.format() end, { desc = "Format current buffer with LSP" })
        ---]]

        require("illuminate").configure({
            delay = 200,
            large_file_cutoff = 2000,
            large_file_overrides = {
                providers = { "lsp" },
            },
        })
        require("illuminate").on_attach(client)
    end,
})
