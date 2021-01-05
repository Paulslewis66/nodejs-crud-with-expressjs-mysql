var express = require('express');
var router = express.Router();

/* GET home page. */
//changed index to login res.render
router.get('/', function(req, res, next) {
  res.render('login', { title: 'Node.js Lewis CRUD with Express.js and MySQL Tutorial' });
});

module.exports = router;
