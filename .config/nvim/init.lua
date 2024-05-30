require("general") -- general settings
-- require("commands") -- general commands
require("keymaps") -- change keymaps
require("highlights") -- colourscheme and other highlights
require("plugins") -- use plugins
require("vimwiki") -- configure vimwiki

if vim.g.neovide then
    require("neovide")
end
