
express = require 'express'
request = require 'request'
app     = express.createServer(express.logger())

docrapt_api_key = process.env 'DOCRAPTOR_API_KEY' #   => ZoOGmPUlV1GpX5LootMi
docrapt_url = process.env 'DOCRAPTOR_URL' #       => https://docraptor.com
redis_url = process.env 'REDISTOGO_URL' #       => redis://redistogo:61776ab49c227845116a904a1a746e2f@angler.redistogo.com:9309/

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
  res.render 'index', {layout: false}

app.post '/', (req, res, next) =>
  res.render 'index', {layout: false}
  console.log req.body.firstName
  console.log req.body.lastName
  console.log req.body.dateOfBirth
  console.log req.body.dateOfPrescription
  console.log req.body.medicationName
  console.log req.body.medicationStrength
  console.log req.body.medicationQuantity
  console.log req.body.medicationDirections
  console.log req.body.signature
  console.log docrapt_api_key+" "+docrapt_url+" "+redis_url

port = process.env.PORT || 3000
app.listen port
console.log("Listening on "+port)

