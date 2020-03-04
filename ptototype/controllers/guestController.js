var express = require('express');
var router = express.Router();
var userModel = require.main.require('./models/user-model');


router.get('*', function(req, res, next){
	if(req.cookies['username'] != null){
		res.render('customer/index');
	}else{
		next();
	}
});

router.get('/', function(req, res){
	
		res.render('guest/index');
	
});
router.get('/package', function(req, res){
	
	res.render('guest/package');

});

router.get('/place', function(req, res){
	
	// res.send('place shown')
	 res.render('guest/place');

});





module.exports = router;