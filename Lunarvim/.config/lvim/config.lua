require "corrupter.alphadashboard"
require "corrupter.plugins"

lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "catppuccin"
lvim.transparent_window = true
-- lvim.builtin.lualine.options.theme = "catppuccin"

lvim.leader = "space"

lvim.builtin.alpha.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.lsp.automatic_servers_installation = true

-- To load specific servers on single file format
local server_opts = {
  single_file_support = true,
}
local servers = {
  -- "gopls",
  "tsserver",
  "jdtls",
}
for _, v in ipairs(servers) do
  require("lvim.lsp.manager").setup(v, server_opts)
end

lvim.autocommands.custom_groups = {
  { "BufWritePost", "*", ":NvimTreeRefresh" },
}
