(function() {
  var app, express, port;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  express = require('express');
  app = express.createServer(express.logger());
  app.get('/', __bind(function(request, response) {
    return response.send('Hello World!');
  }, this));
  port = process.env.PORT || 3000;
  app.listen(port, __bind(function() {
    return console.log("Listening on " + port);
  }, this));
}).call(this);
