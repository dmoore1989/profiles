-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '\\', '<CMD>Oil<CR>', { silent = true })
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>z', function()
  -- iterate through the list of buffers
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    -- get the buffer type
    local buftype = vim.bo[buf].buftype
    -- open the buffer if it's a terminal
    if buftype == 'terminal' then
      vim.api.nvim_set_current_buf(buf)
      return
    end
  end
  -- if no terminal buffer is found, open a new terminal
  vim.cmd 'term'
end, { silent = true, desc = 'Open a new [T]erminal' })
-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<leader>v', '<C-w>v', { desc = 'Open new vertical window' })

vim.keymap.set('n', '<leader>n', ':bnext<CR>', { silent = true, desc = 'Go to [N]ext buffer' })
vim.keymap.set('n', '<leader>b', ':bprev<CR>', { silent = true, desc = 'Go to Previous [B]uffer' })
vim.keymap.set('n', '<leader>x', ':bd<CR>', { silent = true, desc = '[X] Close buffer' })
vim.keymap.set('n', '<leader>u', ':buffers<CR>', { silent = true, desc = 'Check b[U]ffers' })

-- ensure we stay in visual mode after shifting
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- fugitive keymaps
vim.keymap.set('n', '<leader>gg', ':Git<CR>', { desc = 'Pull up [G]it status tool' })
vim.keymap.set({ 'n', 'v' }, '<leader>gh', ':GBrowse main:%<CR>', { silent = true, desc = 'View on Git[H]ub' })
vim.keymap.set('n', '<leader>gH', ':Git push origin head<CR>', { silent = true, desc = 'Pus[H] to upstream' })
vim.keymap.set('n', '<leader>gF', ':Git push origin head -f<CR>', { silent = true, desc = '[F]orce push to upstream' })
vim.keymap.set('n', '<leader>ga', ':Git branch<CR>', { silent = true, desc = 'Open br[A]nch tool' })
vim.keymap.set('n', '<leader>gC', ':Git checkout -b ', { desc = '[C]heckout new branch' })
vim.keymap.set('n', '<leader>gM', function()
  vim.cmd 'Git checkout main'
  vim.cmd 'Git pull'
  vim.cmd 'Git checkout -'
  vim.cmd 'Git rebase main'
end, { desc = 'Rebase on [M]ain' })
vim.keymap.set('n', '<leader>gG', function()
  vim.cmd 'Git checkout main'
  vim.cmd 'Git pull'
  vim.cmd 'Git checkout -'
  vim.cmd 'Git merge main'
end, { desc = 'Mer[G]ge on main' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
