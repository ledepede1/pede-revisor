fx_version 'adamant'

game 'gta5'

author 'ledepede1'
description 'Pede Revisor'

--[[
Pede Revisor needs following dependencies:
ox_lib
ox_target
esx_society
esx_addonaccount
oxmysql
]]--

version '1.1'

lua54 'yes'

shared_scripts {
  '@ox_lib/init.lua',
  'Configs/Config.lua',
}

shared_script {'@es_extended/imports.lua'}


client_scripts {
  'Client/Main.lua',
  'Client/Menu.lua',
  'Client/Targets.lua',
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'Configs/SV_Config.lua',
  'Server/Server.lua',
}

dependencies {
	'es_extended',
}
