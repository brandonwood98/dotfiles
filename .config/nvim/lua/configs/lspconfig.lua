-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- Servers with default configurations
local servers = {
  "volar",
  "html",
  "cssls",
  "tailwindcss",
  "svelte",
  "emmet_ls",
  "eslint",
  "zls",
  "yamlls",
  "jsonls"
}

local nvlsp = require "nvchad.configs.lspconfig"

local on_attach = function(client, buffer)
  nvlsp.on_attach()
  if client.supports_method "textDocument/inlayHint" then
    if vim.api.nvim_buf_is_valid(buffer) and vim.bo[buffer].buftype == "" then
      vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
    end
  end
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

local mason_registry = require "mason-registry"
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
  .. "/node_modules/@vue/language-server"

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}

lspconfig.svelte.setup {
  on_attach = function(client)
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.js", "*.ts" },
      callback = function(ctx)
        -- Here use ctx.match instead of ctx.file
        client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
      end,
    })
  end,
}
