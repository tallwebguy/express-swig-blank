fs = require "fs"
path = require "path"

#go into the modules directory and include everything in there..
class ModLoader
	
	configure : (app) =>
		modules = []
		files = fs.readdirSync path.join __dirname, "modules"
		for f in files
			modules[f] = require path.join __dirname, "modules", f
			try
				modules[f].configure app
			catch
				console.log "Could not load #{f}"

module.exports = ModLoader
