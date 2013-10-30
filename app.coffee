express = require "express"
path = require "path"
http = require "http"
swig = require "swig"
app = express()

app.configure () =>
    app.set 'port', process.env.PORT || 3000
    app.engine 'swig', swig.renderFile
    app.set 'views', __dirname + '/modules'
    app.set 'view engine', 'swig'
    app.use express.logger('dev')
    app.use express.urlencoded()
    app.use express.json()
    app.use express.methodOverride()
    app.use app.router
    app.use express.static(path.join(__dirname, 'public'))

app.configure 'development', () =>
    app.use express.errorHandler()
    app.set 'view cache', false
    swig.setDefaults { cache: false }

modloader = new(require "./modloader.coffee")
modloader.configure app

http.createServer(app).listen app.get('port'), () =>
    console.log "Express server listening on port #{app.get("port")}"
