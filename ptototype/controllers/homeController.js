var express = require('express');
var router = express.Router();


router.get('/', function(req, res){

	res.send("wellcome Mr Guest")
});

router.post('/login', function(req, res){

	
});
router.get('/index', function(req, res){

	res.render('home/index')
});





module.exports = router;