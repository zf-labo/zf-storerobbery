fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'LeZach'
description 'Storerobbery'
version '1.0.0'

client_script 'client/*.lua'
server_script 'server/*.lua'
shared_scripts {
    'shared/*.lua',

    -- ### UNCOMMENT BELOW FOR ESX ###
    --'@ox_lib/init.lua',
    --'@es_extended/imports.lua',
    --'@es_extended/locale.lua',
    --'esx_locales/*.lua',
    
    
    -- ### UNCOMMENT BELOW FOR QBCORE ###
    --'@qb-core/shared/locale.lua',
    --'qb_locales/*.lua',
}
