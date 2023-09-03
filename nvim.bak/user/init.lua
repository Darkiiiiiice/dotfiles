local exists,dap = pcall(require, "dap")

if exists then
    dap.adapters.delve = {
        type = 'server',
        port = '${port}',
        executable = {
          command = 'dlv',
          args = {'dap', '-l', '127.0.0.1:${port}'},
        }
    }

    -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    dap.configurations.go = {
        {
          type = "delve",
          name = "Debug",
          request = "launch",
          program = "${file}"
        },
        {
          type = "delve",
          name = "Debug test", -- configuration for debugging test files
          request = "launch",
          mode = "test",
          program = "${file}"
        },
        -- works with go.mod packages and sub packages 
        {
          type = "delve",
          name = "Debug test (go.mod)",
          request = "launch",
          mode = "test",
          program = "./${relativeFileDirname}"
        } 
    }
end

local ok, copilot = pcall(require, "copilot")
if ok then 
    require("astronvim.utils").notify(
      ("Load user init: `%s`"):format(copilot),
      vim.log.levels.ERROR
    )
end

return {
    colorscheme = "gruvbox",
    -- require("astronvim.utils").notify(
    --   ("Load user init: `%s`"):format(dap),
    --   vim.log.levels.ERROR
    -- ),
}
