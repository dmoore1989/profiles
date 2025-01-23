-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', '<leader>g]', function()
        gitsigns.nav_hunk 'next'
      end, { desc = 'Gitsigns next hunk' })
      map('n', '<leader>g[', function()
        gitsigns.nav_hunk 'prev'
      end, { desc = 'Gitsigns previous hunk' })
      --
      map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Gitsigns [S]tage hunk' })
      map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Gitsigns [R]eset hunk' })
      map('v', '<leader>gs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Gitsigns [S]tage hunks selected' })
      map('v', '<leader>gr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Gitsigns [R]eset hunks selected' })
      map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'Gitsigns [S]tage buffer' })
      map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = 'Gitsigns [U]ndo stage hunk' })
      map('n', '<leader>gU', gitsigns.reset_buffer_index, { desc = 'Gitsigns [U]ndo stage buffer' })
      map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'Gitsigns [R]eset buffer' })
      map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Gitsigns [P]review hunk' })
      map('n', '<leader>gP', gitsigns.preview_hunk_inline, { desc = 'Gitsigns [P]review hunk inline' })
      map('n', '<leader>gb', function()
        gitsigns.blame_line { full = true }
      end, { desc = 'Gitsigns [B]lame line' })
      map('n', '<leader>gP', gitsigns.preview_hunk_inline, { desc = 'Gitsigns [P]review hunk inline' })
      map('n', '<leader>gB', gitsigns.blame, { desc = 'Gitsigns [B]lame' })
      map('n', '<leader>gt', gitsigns.toggle_current_line_blame, { desc = 'Gitsigns [T]oggle line blame' })
      map('n', '<leader>ge', gitsigns.toggle_deleted, { desc = 'Gitsigns toggle d[E]leted' })
      map('n', '<leader>gd', gitsigns.diffthis, { desc = 'Gitsigns [D]iff this' })
      map('n', '<leader>gD', function()
        gitsigns.diffthis '~'
      end, { desc = 'Gitsigns [D]iff this origin' })
    end,
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
}
