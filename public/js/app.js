var WSCli;
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
WSCli = (function() {
  function WSCli() {
    this.appendLines = __bind(this.appendLines, this);    this.socket = io.connect();
    this.socket.on('connect', function() {
      return console.log('ws:connect ok');
    });
    this.socket.on('vr_start_talker_resp', __bind(function(data) {
      console.log("vr_start_talker_resp: " + data.txt);
      return this.appendLines(data);
    }, this));
    this.socket.on('vr_stop_talker_resp', __bind(function(data) {
      console.log("vr_stop_talker_resp: " + data.txt);
      return this.appendLines(data);
    }, this));
    this.socket.on('vr_start_listener_resp', __bind(function(data) {
      console.log("vr_start_listener_resp: " + data.txt);
      return this.appendLines(data);
    }, this));
    this.socket.on('vr_stop_listener_resp', __bind(function(data) {
      console.log("vr_stop_listener_resp: " + data.txt);
      return this.appendLines(data);
    }, this));
    this.socket.on('tail_start_resp', this.appendLines);
    this.socket.on('tail_watch_resp', this.appendLines);
    $('#tail_start').click(__bind(function() {
      return this.socket.emit('tail_start', {});
    }, this));
    $('#tail_stop').click(__bind(function() {
      return this.socket.emit('tail_stop', {});
    }, this));
    $('#vr_start_talker').click(__bind(function() {
      return this.socket.emit('vr_start_talker', {
        talker: '14246530757',
        listener: '13108768635'
      });
    }, this));
    $('#vr_stop_talker').click(__bind(function() {
      return this.socket.emit('vr_stop_talker', {
        talker: '14246530757',
        listener: '13108768635'
      });
    }, this));
    $('#vr_start_listener').click(__bind(function() {
      return this.socket.emit('vr_start_listener', {
        talker: '14246530757',
        listener: '13108768635'
      });
    }, this));
    $('#vr_stop_listener').click(__bind(function() {
      return this.socket.emit('vr_stop_listener', {
        talker: '14246530757',
        listener: '13108768635'
      });
    }, this));
  }
  WSCli.prototype.appendLines = function(data) {
    if (data && !_.isEmpty(data)) {
      return _.each(data.lines, __bind(function(l) {
        return $("#ws_console").append("<p>" + l + "</p>");
      }, this));
    }
  };
  return WSCli;
})();