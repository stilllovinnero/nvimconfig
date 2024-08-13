vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>h", vim.cmd.tabprevious)
vim.keymap.set("n", "<leader>l", vim.cmd.tabnext)
vim.keymap.set('n', '<leader>j', ':tabnew<CR>', { noremap = true, silent = true })


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap = true, silent = true})

-- Remap <leader>n to follow a tag (jump to definition)
vim.api.nvim_set_keymap('n', '<leader>n', '<C-]>', { noremap = true, silent = true })

-- Function to close the terminal window
function close_terminal()
  local win_id = vim.api.nvim_get_current_win()
  local buf_id = vim.api.nvim_win_get_buf(win_id)

  -- Check if the buffer type is 'terminal'
  if vim.bo[buf_id].buftype == 'terminal' then
    vim.api.nvim_win_close(win_id, true)
  else
    -- If not a terminal, do nothing or add custom behavior
    vim.cmd('normal! \\<Esc>')
  end
end

-- Set the key mapping in terminal mode
-- vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>:lua close_terminal()<CR>', { noremap = true, silent = true })

-- Escape terminal mode via <Esc> 
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})

function toggle_terminal()
    local term_buf = nil
    -- Check for existing terminal buffer
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].buftype == "terminal" then
            term_buf = buf
            break
        end
    end

    if term_buf then
        -- Terminal exists, switch to it
        local found = false
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_buf(win) == term_buf then
                vim.api.nvim_set_current_win(win)
                found = true
                break
            end
        end
        if not found then
            --  If terminal buffer is found but not in any window reopen it
            vim.cmd("botright split")
            vim.cmd("resize 10")
            vim.cmd("buffer" .. term_buf)
        end
    else
        -- No terminal exists, open a new one in vertical split
        vim.cmd("botright split")
        vim.cmd("resize 10")
        vim.cmd("terminal")
    end
end

-- Open Terminal below or switch to terminal with <leader>t
vim.api.nvim_set_keymap("n", "<leader>t", ":lua toggle_terminal()<CR>",
        { noremap = true, silent = true }
    )
