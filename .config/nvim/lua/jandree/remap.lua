-- Set leader to spacebar
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Open explorer' })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Movement
vim.keymap.set("n", "J", "mzJ`z", { desc = 'Collapse next line onto current and keep cursor at current position' })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Move down 20 lines and focus scroll on cursor' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Move up 20 lines and focus scroll on cursor' })
vim.keymap.set("n", "n", "nzzzv", { desc = "Move cursor forward" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move cursor backward" })

-- Yank + Paste
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "paste over selection without erasing unnamed register" })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank whole line" })

vim.keymap.set("n", "Q", "<nop>", { desc = 'Disable Q' })
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open tmux session manager" })
vim.keymap.set({ "n", "v" }, "<leader>f", vim.lsp.buf.format, { desc = 'format with LSP' })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word at cursor across file" })

-- Reload config
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "Reload config" })
