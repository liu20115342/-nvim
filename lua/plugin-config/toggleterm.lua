
local status, toggleterm = pcall(require, "toggleterm")
if not status then
    vim.notify("没有找到 toggleterm")
  return
end

toggleterm.setup(
    {
        --  开启的终端默认进入插入模式
        start_in_insert = true,
        -- 设置终端打开的大小
        size = 6,
        -- 打开普通终端时，关闭拼写检查
        on_open = function()
            vim.cmd("setlocal nospell")
        end
    }
)
-- 新建终端
local Terminal  = require('toggleterm.terminal').Terminal

-- 新建浮动终端
local floatTerm =
    Terminal:new(
    {
        hidden = true,
        direction = "float",
        float_opts = {
            border = "double"
        }
    }
)

-- 新建 lazygit 终端
local lazyGit =
    Terminal:new(
    {
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = {
            border = "double"
        }
    }
)

-- 定义新的方法
function float_toggle()
    floatTerm:toggle()
end

function lazygit_toggle()
    lazyGit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua float_toggle()<CR>", {noremap = true, silent = true})

