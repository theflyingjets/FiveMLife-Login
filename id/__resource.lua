ui_page 'interface/index.html'

client_scripts {
    "client/id-c.lua",
    "client/functions.lua"
}

server_script {
    "id-s.lua"
}

files (
    'interface/index.html',
    'interface/listener.js',
    'interface/loader.js',
    -- 'interface/assert/images/',
    'interface/assert/libraries/axios.min.js',
    'interface/assert/libraries/vue.min.js',
    'interface/assert/libraries/vuetify.min.css',
    'interface/assert/libraries/vuetify.min.js',
    -- 'interface/assert/sounds/',
    'interface/pages/character.html',
    'interface/scripts/character,js'
)
