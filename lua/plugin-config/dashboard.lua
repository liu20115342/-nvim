vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_footer = { "https://github.com/liu20115342" }

vim.g.dashboard_custom_section = {
    a = { description = { "  Projects              " }, command = "Telescope projects" },
    b = { description = { "  Recently files        " }, command = "Telescope oldfiles" },
    c = { description = { "  Edit keybindings      " }, command = "edit ~/.config/nvim/lua/keybindings.lua" },
    d = { description = { "  Edit Projects         " }, command = "edit ~/.local/share/nvim/project_nvim/project_history", },
    i = { description = { "  Change Theme           "}, command = 'Telescope colorscheme'},
}

-- 文字生成网站 http://patorjk.com/software/taag/#p=display&f=ANSI%20Regular&t=1234

vim.g.dashboard_custom_header = {
    
[[                                                    ]],
[[     ██╗██╗ █████╗ ███╗   ██╗   ██╗     ██╗██╗   ██╗]],
[[     ██║██║██╔══██╗████╗  ██║   ██║     ██║██║   ██║]],
[[     ██║██║███████║██╔██╗ ██║   ██║     ██║██║   ██║]],
[[██   ██║██║██╔══██║██║╚██╗██║   ██║     ██║██║   ██║]],
[[╚█████╔╝██║██║  ██║██║ ╚████║██╗███████╗██║╚██████╔╝]],
[[ ╚════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚══════╝╚═╝ ╚═════╝ ]],
[[                                                    ]]
    
}
