local on_attach = require("plugins.configs.lspconfig").on_attach 
local capabilites = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.terraformls.setup {
  on_attach = on_attach,
  capabilites = capabilites,
  cmd = {"terraform-ls", "serve"},
  filetypes = {"terraform", "terraform-vars"},
  root_dir = util.root_pattern(".terraform", ".git"),
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilites = capabilites,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotempl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
