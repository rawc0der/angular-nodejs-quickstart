# Load Dependencies
express = require 'express'
routes = require './routes'

# Create server
app = express.createServer()
app.config = require './config'

# Configure app
app.configure ->
	app.set 'views', "#{__dirname}/views"
	app.set 'view engine', 'jade'
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use express.static("#{__dirname}/public")
	app.use app.router

app.configure 'development', ->
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }))

# Routes Setup
app.get '/', routes.index

# Start Server
app.listen app.config.port, ->
	console.log "server running on port #{app.config.port}"