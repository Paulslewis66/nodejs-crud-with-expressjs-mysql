var mysql = require('mysql');
var connection = mysql.createConnection({
	host:'mariadb.default.svc.cluster.local',
	user:'root',
	password:'password',
	database:'books'
});
connection.connect(function(error){
	if(!!error) {
		console.log(error);
	} else {
		console.log('Connected..!');
	}
});

module.exports = connection;