
express = require 'express'
request = require 'request'
util    = require 'util'
ins     = util.inspect

app     = express.createServer(express.logger())

docrapt_api_key = process.env.DOCRAPTOR_API_KEY
docrapt_url     = process.env.DOCRAPTOR_URL
redis_url       = process.env.REDISTOGO_URL

app.use express.bodyParser()
app.use express.cookieParser()
app.use express.methodOverride()
app.use app.router
app.register '.coffee', require('ejs')
app.set 'views', process.cwd() + '/app/views'
app.set 'view engine', 'ejs'
app.set 'view options', {layout: false }
app.use express.static(process.cwd() + '/public')
app.use express.static(process.cwd() + '/public/css')
app.use express.static(process.cwd() + '/public/js')
app.use(express.errorHandler { dumpExceptions: true, showStack: true })

app.get '/', (req, res, next) => 
  res.render 'index'

app.post '/', (req, res, next) =>
  res.render 'index'
  console.log req.body.firstName
  console.log req.body.lastName
  console.log req.body.dateOfBirth
  console.log req.body.dateOfPrescription
  console.log req.body.medicationName
  console.log req.body.medicationStrength
  console.log req.body.medicationQuantity
  console.log req.body.medicationDirections
  console.log req.body.signature

  to_uri = docrapt_url+"?user_credentials="+docrapt_api_key+"&doc[document_type]=pdf"+"&doc[name]="+(req.body.firstName+req.body.lastName)+"&doc[document_url]=http://chickenscratch.heroku.com/pdf/tpl&strict=false&test=false" #&doc[async]=true&doc[callback_url]=http://chickenscratch.heroku.com/pdf/show"

  request {uri:to_uri}, (error, response, body) =>
    if !error && response.statusCode == 200
      console.log "ok docrapt response"
      
app.get '/pdf/show', (req, res, next) => 
  console.log "/pdf/show "+ins(req.body)
  res.render 'pdfshow'

app.get '/pdf/tpl', (req, res, next) => 
  console.log "/pdf/tpl "+ins(req.body)
  res.render 'pdftpl'

port = process.env.PORT || 3000
app.listen port
console.log("Listening on "+port)

