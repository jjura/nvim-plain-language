-- init.lua

local callback = function (event)
    local path = string.format("plain-language.config.%s", event.match)
    local config = require(path)

    pcall(vim.lsp.start, config)
end

local M = {}

M.configure = function (pattern)
    local options = {
        pattern = pattern,
        callback = callback,
    }

    vim.api.nvim_create_autocmd("FileType", options)
end

return M
