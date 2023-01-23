require('lualine').setup{
    options = {
        theme = 'auto'
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = { 'windows'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location', {'diagnostics',
            sources = {'nvim_diagnostic', 'coc'},
            sections = {'error', 'warn', 'info', 'hint'},

            diagnostic_color = {
                -- Same values as the general color option can be used here.
                error = 'DiagnosticError',
                warn  = 'DiagnosticWarn',
                info  = 'DiagnosticInfo',
                hint  = 'DiagnosticHint',
            },
            symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
            colored = false,
            update_in_insert = false,
            always_visible = false,
            }
        }
    },
}
