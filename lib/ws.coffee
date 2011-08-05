
fs         = require 'fs'
util       = require 'util'
sys        = require 'sys'
_          = require 'underscore'

exports.WS = class WS
  constructor: (@logger) ->
  createServer: (app) =>
    io = require('socket.io').listen(app)
    io.configure () ->
      io.set('heartbeats', false)
      io.set('log level', 2)
    #io.sockets.on 'connection', (socket) =>
      #socket.on 'vr_start_talker', (data) =>
        #ct = new @callTalker('14246530757', '13108768635')
        #socket.emit('vr_start_talker_resp', {txt: ct.callFilePath})

