local hooks = require "ibl.hooks"

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "INDENT_0_HILIGHT", { fg = "#444444" })
    vim.api.nvim_set_hl(0, "INDENT_1_HILIGHT", { fg = "#333333" })
    vim.api.nvim_set_hl(0, "INDENT_2_HILIGHT", { fg = "#222222" })
    vim.api.nvim_set_hl(0, "INDENT_3_HILIGHT", { fg = "#333333" })
    vim.api.nvim_set_hl(0, "SCOPE_HIGHLIGHT", { fg = "#777777" })
end)

local indent_highlight = {
    "INDENT_0_HILIGHT",
    "INDENT_1_HILIGHT",
    "INDENT_2_HILIGHT",
    "INDENT_3_HILIGHT",
}

local scope_highlight = {
    "SCOPE_HIGHLIGHT",
}

require "ibl".setup {
    indent = {
        highlight = indent_highlight,
        char = "▏"
    },
    scope = {
        highlight = scope_highlight,
        char = "▏",
        show_start = false,
        show_end = false
    }
}

hooks.register(
    hooks.type.SCOPE_HIGHLIGHT,
    hooks.builtin.scope_highlight_from_extmark
)

