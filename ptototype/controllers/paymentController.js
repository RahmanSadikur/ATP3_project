var express = require('express');
var router = express.Router();


router.get('/', function(req, res){

	res.send("wellcome Mr Guest")
});






module.exports = router;