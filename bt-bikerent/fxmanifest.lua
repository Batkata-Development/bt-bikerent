fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Batkata'
description 'Bike rent system by Batkata'
version '1.5'

-- Files --

client_script {
    'client/client.lua',
}

server_script {
    'server/server.lua',
}

shared_script {
    'config.lua',
    '@ox_lib/init.lua',
}