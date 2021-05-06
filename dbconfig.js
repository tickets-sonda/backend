const configuration = {
	user: process.env.DBUSER,
	password: process.env.DBPASS,
	server: process.env.DBSERVER,
	database: process.env.DBNAME,
	options: {
		trustedconnection: true,
		enableArithAbort: true,
		instancename: process.env.DBINSTANCE,
	},
	port: parseInt(process.env.DBPORT),
};

module.exports = configuration;
