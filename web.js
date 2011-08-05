(function() {
  var app, docrapt_api_key, docrapt_url, express, ins, port, redis_url, request, util;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  express = require('express');
  request = require('request');
  util = require('util');
  ins = util.inspect;
  app = express.createServer(express.logger());
  docrapt_api_key = process.env.DOCRAPTOR_API_KEY;
  docrapt_url = process.env.DOCRAPTOR_URL;
  redis_url = process.env.REDISTOGO_URL;
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
    return res.render('index');
  }, this));
  app.post('/', __bind(function(req, res, next) {
    var to_uri;
    res.render('index');
    console.log(req.body.firstName);
    console.log(req.body.lastName);
    console.log(req.body.dateOfBirth);
    console.log(req.body.dateOfPrescription);
    console.log(req.body.medicationName);
    console.log(req.body.medicationStrength);
    console.log(req.body.medicationQuantity);
    console.log(req.body.medicationDirections);
    console.log(req.body.signature);
    to_uri = docrapt_url + "?user_credentials=" + docrapt_api_key + "&doc[document_type]=pdf" + "&doc[name]=" + (req.body.firstName + req.body.lastName) + "&doc[document_url]=http://chickenscratch.heroku.com/pdf/tpl&strict=false&test=false";
    return request({
      uri: to_uri
    }, __bind(function(error, response, body) {
      if (!error && response.statusCode === 200) {
        return console.log("ok docrapt response");
      }
    }, this));
  }, this));
  app.get('/pdf/show', __bind(function(req, res, next) {
    console.log("/pdf/show " + ins(req.body));
    return res.render('pdfshow');
  }, this));
  app.get('/pdf/tpl', __bind(function(req, res, next) {
    console.log("/pdf/tpl " + ins(req.body));
    return res.render('pdftpl');
  }, this));
  port = process.env.PORT || 3000;
  app.listen(port);
  console.log("Listening on " + port);
}).call(this);
