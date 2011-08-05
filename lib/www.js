(function() {
  var WWW;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  exports.WWW = WWW = (function() {
    function WWW(logger) {
      this.logger = logger;
      this.createServer = __bind(this.createServer, this);
      this.express = require('express');
      this.stylus = require('stylus');
    }
    WWW.prototype.createServer = function() {
      this.app = this.express.createServer();
      this.app.use(this.express.logger({
        stream: this.logger
      }));
      this.app.use(this.express.bodyParser());
      this.app.use(this.express.cookieParser());
      this.app.use(this.express.methodOverride());
      this.app.use(this.app.router);
      this.app.register('.coffee', require('coffeekup'));
      this.app.set('views', process.cwd() + '/app/views');
      this.app.set('view engine', 'coffee');
      this.app.use(this.stylus.middleware({
        debug: true,
        force: true,
        src: "" + (process.cwd()) + "/public"
      }));
      this.app.use(this.express.static(process.cwd() + '/public'));
      this.app.use(this.express.static(process.cwd() + '/public/css'));
      this.app.use(this.express.static(process.cwd() + '/public/js'));
      this.app.use(this.express.errorHandler({
        dumpExceptions: true,
        showStack: true
      }));
      this.app.get('/', function(req, res, next) {
        return res.render('index');
      });
      return this.app.listen(80);
    };
    return WWW;
  })();
}).call(this);
