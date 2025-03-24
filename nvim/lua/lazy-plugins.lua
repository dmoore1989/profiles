-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup {
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'github/copilot.vim',

  require 'lazy-packages.gitsigns',
  require 'lazy-packages.which-key',
  require 'lazy-packages.telescope',

  -- LSP Plugins
  require 'lazy-packages.lazydev',
  require 'lazy-packages.luvit-meta',
  require 'lazy-packages.lsp',

  require 'lazy-packages.autoformat',
  require 'lazy-packages.autocomplete',

  require 'lazy-packages.colorscheme',

  require 'lazy-packages.todo-comments',
  require 'lazy-packages.mini',
  require 'lazy-packages.treesitter',
  require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.neo-tree',
  require 'lazy-packages.oil',
  require 'lazy-packages.avante',

  ui = require 'lazy-packages.ui',
}
