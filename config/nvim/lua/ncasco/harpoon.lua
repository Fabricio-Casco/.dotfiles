require("harpoon").setup({
    nav_first_in_list = true,
    projects = {
        ["~/git/dotfiles"] = {
            term = {
                cmds = {
                    "ls -la ~\r",
                }
            }
        }
    }
})
