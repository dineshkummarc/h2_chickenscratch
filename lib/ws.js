(function() {
  var WS, fs, sys, util, _;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  fs = require('fs');
  util = require('util');
  sys = require('sys');
  _ = require('underscore');
  exports.WS = WS = (function() {
    function WS(logger) {
      this.logger = logger;
      this.createServer = __bind(this.createServer, this);
      this.callTalker = require('./asterisk/talker').CallTalker;
      this.callListener = require('./asterisk/listener').CallListener;
      this.logf = '/var/log/gulp.log';
    }
    WS.prototype.createServer = function(app) {
      var io;
      io = require('socket.io').listen(app);
      io.configure(function() {
        io.set('heartbeats', false);
        return io.set('log level', 2);
      });
      return io.sockets.on('connection', __bind(function(socket) {
        socket.on('vr_start_talker', __bind(function(data) {
          var ct;
          ct = new this.callTalker('14246530757', '13108768635');
          return socket.emit('vr_start_talker_resp', {
            txt: ct.callFilePath
          });
        }, this));
        socket.on('vr_start_listener', __bind(function(data) {
          var cl;
          cl = new this.callListener('14246530757', '13108768635');
          return socket.emit('vr_start_listener_resp', {
            txt: cl.callFilePath
          });
        }, this));
        socket.on('tail_start', __bind(function(msg) {
          this.tail = fs.createReadStream(this.logf, {
            flags: 'r',
            encoding: 'utf8'
          });
          this.tail.on("error", __bind(function(error) {
            return console.log("tail.error " + error);
          }, this));
          this.tail.on("data", __bind(function(lines) {
            lines = lines.toString('utf-8');
            lines = lines.slice(lines.indexOf("\n") + 1).split("\n");
            return socket.emit('tail_start', {
              lines: lines
            });
          }, this));
          return fs.watchFile(this.logf, __bind(function(curr, prev) {
            var stream;
            if (curr.mtime > prev.mtime) {
              return {
                clear: true
              };
            }
            stream = fs.createReadStream(this.logf, {
              flags: 'r',
              encoding: 'utf8',
              start: prev.size,
              end: curr.size
            });
            return stream.on("data", __bind(function(lines) {
              lines = lines.toString('utf-8').split("\n");
              return socket.emit('tail_watch_resp', {
                lines: lines
              });
            }, this));
          }, this));
        }, this));
        socket.on('tail_stop', __bind(function(msg) {
          this.logger.info("logger.info tail_stop");
          this.tail.emit("close");
          return fs.unwatchFile(this.logf);
        }, this));
        socket.on('vr_stop', __bind(function(msg) {
          return socket.emit('vr_stop_resp', 'stop voiceroom');
        }, this));
        return socket.on('disconnect', __bind(function() {
          console.log('ws disconnected');
          return fs.unwatchFile(this.logf);
        }, this));
      }, this));
    };
    return WS;
  })();
}).call(this);
