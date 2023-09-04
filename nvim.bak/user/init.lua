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
    polish = function()
      vim.t.is_transparent = 0
      function toggle_transparent()
          if vim.t.is_transparent == 0 then
              vim.api.nvim_set_hl(0, "Normal", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "NormalNC", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "NvimTreeNormal", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "CursorColumn", { cterm = {}; ctermbg = NONE; ctermfg = NONE})
              vim.api.nvim_set_hl(0, "CursorLine", { cterm = {}; ctermbg = NONE; ctermfg = NONE})
              vim.api.nvim_set_hl(0, "CursorLineNr", { cterm = {}; ctermbg = NONE; ctermfg = NONE})
              vim.api.nvim_set_hl(0, "WinBar", { cterm = {}; ctermbg = NONE; ctermfg = NONE})
              vim.api.nvim_set_hl(0, "TabLine", { cterm = {}; ctermbg = NONE; ctermfg = NONE})
              vim.api.nvim_set_hl(0, "TabLineFill", { cterm = {}; ctermbg = NONE; ctermfg = NONE})
              vim.api.nvim_set_hl(0, "FloatBoard", { cterm = {}; ctermbg = NONE; ctermfg = NONE})
              vim.api.nvim_set_hl(0, "LineNr", {})
              vim.api.nvim_set_hl(0, "SignColumn", {})
              vim.api.nvim_set_hl(0, "StatusLine", {})
              vim.api.nvim_set_hl(0, "StatusLineNC", {})
              vim.api.nvim_set_hl(0, "NeoTreeNormal", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "NeoTreeNormalNC", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "NotifyINFOBody", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "NotifyWARNBody", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "NotifyERRORBody", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "NotifyDEBUGBody", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "NotifyTRACEBody", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "NotifyINFOBorder", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "NotifyERRORBorder", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "NotifyTRACEBorder", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "NotifyBackgroud", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "Pmenu", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "PmenuSel", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "PmenuSbar", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "PmenuThumb", {guibg = NONE; ctermbg = NONE})
              vim.api.nvim_set_hl(0, "QuickFixLine", {guibg = NONE; ctermbg = NONE})
              vim.t.is_transparent = 1
          else
              vim.opt.background = "dark"
              vim.t.is_transparent = 0
          end
      end
      toggle_transparent()
    end,
    plugins = {
    -- ...
      ["notify"] = function(config)
        config.background_colour = "#00000000";
        return config
      end
    }
    -- require("astronvim.utils").notify(
    --   ("Load user init: `%s`"):format(dap),
    --   vim.log.levels.ERROR
    -- )
}
