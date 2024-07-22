fx_version 'adamant'
game 'gta5'
lua54 'yes'

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'shared/***',
}

client_scripts {
    '@es_extended/locale.lua',
    'src/RageUI.lua',
    'src/Menu.lua',
    'src/MenuController.lua',
    'src/components/*.lua',
    'src/elements/*.lua',
    'src/items/*.lua',
    'client/***',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/***',
}