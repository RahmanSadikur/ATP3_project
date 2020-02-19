//declaration
var express = require('express');
var login = require('./controllers/loginController');
var home = require('./controllers/homeController');
var logout = require('./controllers/logoutController');
var branch = require('./controllers/branchController');
var customer = require('./controllers/customerController');
var employee = require('./controllers/employeeController');
var guide = require('./controllers/guideController');
var hotel = require('./controllers/hotelController');
var offer = require('./controllers/offersController');
var package = require('./controllers/packageController');
var payment = require('./controllers/paymentController');
var place = require('./controllers/placeController');
var profile = require('./controllers/profileController');
var tour = require('./controllers/tourController');
var transport = require('./controllers/transportController');
var ejs = require('ejs');
var exSession = require('express-session');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var app = express();

//configuration
app.set('view engine', 'ejs');

//middleware 
app.use(bodyParser.urlencoded({extended:true}));
app.use(exSession({secret: 'my top secret value', saveUninitialized: true, resave: false}));
app.use(cookieParser());

app.use('/login', login);
app.use('/customer', customer);
app.use('/branch', branch);
app.use('/logout', logout);
app.use('/employee', employee);
app.use('/guide', guide);
app.use('/hotel', hotel);
app.use('/offer', offer);
app.use('/package', package);
app.use('/payment', payment);
app.use('/place', place);
app.use('/profile', profile);
app.use('/tour', tour);
app.use('/transport', transport);

app.use('/',home);
//routes

//server startup
app.listen(69, function(){
	console.log('node server started at 69!');
});