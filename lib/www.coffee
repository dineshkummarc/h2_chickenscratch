
exports.WWW = class WWW
  constructor: (@logger) ->
    @express = require 'express'
    @stylus  = require 'stylus'
  createServer: () =>
    @app = @express.createServer()
    @app.use @express.logger({stream: @logger})
    @app.use @express.bodyParser()
    @app.use @express.cookieParser()
    @app.use @express.methodOverride()
    @app.use @app.router
    @app.register '.coffee', require('coffeekup')
    @app.set 'views', process.cwd() + '/app/views'
    @app.set 'view engine', 'coffee'
    @app.use @stylus.middleware {debug: true, force: true, src: "#{process.cwd()}/public"}
    @app.use @express.static(process.cwd() + '/public')
    @app.use @express.static(process.cwd() + '/public/css')
    @app.use @express.static(process.cwd() + '/public/js')
    @app.use(@express.errorHandler { dumpExceptions: true, showStack: true })

    @app.get '/', (req, res, next) -> res.render 'index'
    @app.listen 80

