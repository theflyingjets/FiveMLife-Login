description 'ID'

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page 'html/index.html'

client_script {
    'client/mainC.lua'
}


server_scripts {
    "server/mainS.lua",
    "@mysql-async/lib/MySQL.lua"
}

files {
    "html/index.html",
    "html/style.css",
    "html/reset.css",
    "html/listener.js"
}