vim.g.startify_lists = {
    { type = 'files', header = { '   Files' } },
    { type = 'dir', header = { '   Current Directory ' .. vim.fn.getcwd() } },
    { type = 'sessions', header = { '   Sessions' } },
    { type = 'bookmarks', header = { '   Bookmarks' } }
}

vim.g.startify_bookmarks = {
    { a = '~/.config/hypr/hyprland.conf' },
    { b = '~/.config/nvim/' },
    { c = '~/.zshrc' },
    { d = '~/ctf' },
    { e = '~/code' }
}

vim.g.startify_custom_header = {
    "   ▄████████    ▄████████ ",
    "  ███    ███   ███    ███ ",
    "  ███    █▀    ███    █▀  ",
    "  ███         ▄███▄▄▄     ",
    "▀███████████ ▀▀███▀▀▀     ",
    "         ███   ███    █▄  ",
    "   ▄█    ███   ███    ███ ",
    " ▄████████▀    ██████████ ",
    "                          ",
    "  Don't Fucking Give Up ! "
}
