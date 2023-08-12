vim.cmd [[highlight IndentBlanklineContextChar guifg=#777777 gui=nocombine]]

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
}

