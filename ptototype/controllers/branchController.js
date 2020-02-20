var express = require('express');
var router = express.Router();


router.get('/', function(req, res){

	res.render('branch/index',branch={branchname:"khilkhet"})
});






module.exports = router;