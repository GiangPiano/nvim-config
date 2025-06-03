return {
    cmd = {
        'pylsp'
    },
    filetypes = {
        'python'
    },
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = { ignore = {'W391', 'E302', 'E305', 'E501'} }
            }
        }
    }
}
