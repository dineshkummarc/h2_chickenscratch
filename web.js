(function() {
  var app, express;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  express = require('express');
  app = express.createServer(express.logger());
  app.use(express.bodyParser());
  app.use(express.cookieParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.register('.coffee', require('ejs'));
  app.set('views', process.cwd() + '/app/views');
  app.set('view engine', 'ejs');
  app.use(express.static(process.cwd() + '/public'));
  app.use(express.static(process.cwd() + '/public/css'));
  app.use(express.static(process.cwd() + '/public/js'));
  app.use(express.errorHandler({
    dumpExceptions: true,
    showStack: true
  }));
  app.get('/', __bind(function(req, res, next) {
    return res.render('index', {
      layout: false
    });
  }, this));
  app.listen(3000);
  console.log("Listening on 3000");
}).call(this);
