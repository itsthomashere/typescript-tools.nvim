local rpc = require "typescript-tools.rpc"
local plugin_config = require "typescript-tools.config"
local util = require "typescript-tools.utils"

local M = {}

function M.setup(config)
  local settings = config.settings or {}

  plugin_config.load_settings(settings)

  vim.lsp.config(
    plugin_config.plugin_name,
    vim.tbl_deep_extend("force", {
      cmd = function(...)
        return rpc.start(...)
      end,
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      root_markers = { "package.json", "jsconfig.json", ".git" },
      single_file_support = true,
    }, config)
  )

  vim.lsp.enable(plugin_config.plugin_name, true)
end

return M
