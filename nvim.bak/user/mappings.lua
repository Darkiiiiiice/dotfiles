return {
  n = {
    ["<leader>dl"] = { "<cmd>lua require 'dap.ext.vscode'.load_launchjs(nil, { delve = {'go'}})<cr>", desc = "Load Vscode Launch.json" },
  },

}
