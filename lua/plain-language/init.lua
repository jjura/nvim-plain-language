-- init.lua

local callback = function (event)
    local path = string.format("plain-language.config.%s", event.match)
    local config = require(path)

    vim.lsp.start(config)
end

local M = {}

M.configure = function (pattern)
    local handlers = {
        ["textDocument/hover"] = vim.lsp.handlers.hover,
        ["textDocument/signatureHelp"] = vim.lsp.handlers.signature_help,
    }

    local overrides = {
        border = "single"
    }

    local options = {
        pattern = pattern,
        callback = callback,
    }

    for method, handler in pairs(handlers) do
        vim.lsp.handlers[method] = vim.lsp.with(handler, overrides)
    end

    vim.api.nvim_create_autocmd("FileType", options)
end

return M
