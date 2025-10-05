local M = {
  'saghen/blink.cmp',

  version = '1.*',
  opts = {
    snippets = { preset = 'luasnip' },
    keymap = {
      preset = 'enter',
    --   ['<Tab>'] = {
    --     function(cmp)
    --       if cmp.snippet_active() then
    --         return cmp.accept()
    --       else
    --         return cmp.select_and_accept()
    --       end
    --     end,
    --     -- 'snippet_forward',
    --     'fallback',
    --   },
    --   ['<S-Tab>'] = {
    --     -- 'snippet_backward',
    --     'fallback',
    --   },
    },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = {
      menu = {
        draw = {
          padding = { 1, 1 },
        },
      },

      accept = {
        auto_brackets = {
          enabled = false
        },
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
        window = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:@comment.todo,CursorLine:CursorLine,Search:None",
        },
      }
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}

return M
