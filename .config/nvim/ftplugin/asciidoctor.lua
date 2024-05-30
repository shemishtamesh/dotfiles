vim.cmd("set spell")

-- a function that saves the current buffer and converts it to pdf and opens it in the default pdf viewer
function AsciidocToPdf()
    vim.cmd("w")
    vim.cmd("Asciidoctor2PDF")
    vim.cmd("AsciidoctorOpenPDF")
end

vim.keymap.set("n", "<leader>rr", AsciidocToPdf)

