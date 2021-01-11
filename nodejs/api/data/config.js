//Required
const mysql = require('mysql');


//Setting up database connection values
const config = {
    host: 'localhost',
    port: '3306',
    user: 'nodeconn',
    password: 'test',
    database: 'joboard'
};

//Setting up result pool
const pool = mysql.createPool(config);

pool.on('connection', function () {
    console.log('\u001b[35m POOL | A new query have been made \u001b[0m');
});
pool.on('release', function (connection) {
    console.log('\u001b[35m POOL | Connection %d released \u001b[0m', connection.threadId);
});


//Exporting the result pool
module.exports = pool;
