(function() {
  var app, express, port;
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
  app.set('view options', {
    layout: false
  });
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
  app.post('/', __bind(function(req, res, next) {
    res.render('index', {
      layout: false
    });
    console.log(req.body.firstName);
    console.log(req.body.lastName);
    console.log(req.body.dateOfBirth);
    console.log(req.body.dateOfPrescription);
    console.log(req.body.medicationName);
    console.log(req.body.medicationStrength);
    console.log(req.body.medicationQuantity);
    console.log(req.body.medicationDirections);
    return console.log(req.body.signature);
  }, this));
  port = process.env.PORT || 3000;
  app.listen(port);
  console.log("Listening on " + port);
}).call(this);
