local M = {
  'saghen/blink.cmp',

  version = '1.*',
  opts = {
    snippets = { preset = 'luasnip' },
    keymap = { preset = 'enter' },

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
        auto_show = true
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
