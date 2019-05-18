resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- UI file that will render
ui_page 'html/index.html'

--Client side scripts
client_scripts {
	'client/mainc.lua'
}

-- Server side scripts
server_script {
	'server/mains.lua',
	'@mysql-async/lib/MySQL.lua'
}

-- Files that will be loaded
files {
	'html/assets/images/Logo.png',
	'html/index.html',
	'html/listener.js',
	'html/reset.css',
	'html/style.css',
	'html/assets/fonts/roboto/Roboto-Bold.woff',
	'html/assets/fonts/roboto/Roboto-Bold.woff2',
	'html/assets/fonts/roboto/Roboto-Light.woff',
	'html/assets/fonts/roboto/Roboto-Light.woff2',
	'html/assets/fonts/roboto/Roboto-Medium.woff',
	'html/assets/fonts/roboto/Roboto-Medium.woff2',
	'html/assets/fonts/roboto/Roboto-Regular.woff',
	'html/assets/fonts/roboto/Roboto-Regular.woff2',
	'html/assets/fonts/roboto/Roboto-Thin.woff',
	'html/assets/fonts/roboto/Roboto-Thin.woff2',
	'html/assets/css/materialize.css',
	'html/assets/css/style.css',
	'html/assets/js/jquery.js',
	'html/assets/js/materialize.js',
	'html/assets/js/init.js'
}