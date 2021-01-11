//Required
    const http = require('http');
    const express = require('express');
    const cors = require('cors');
    const itemsRouter = require('./routes/api');
    const cookieParser = require("cookie-parser");
    const app = express();

// create new app
    app.use(express.json());
    app.use(cookieParser());
    //app.use(cors({origin: 'localhost'}));
    app.use(cors({origin: 'http://localhost'}),);

//Routes
    app.use('/api', itemsRouter);

//Root
    app.use('/', function(req, res) {
    res.send('This is root');

});


//Server start listening
    const server = http.createServer(app);
    const port = 3000;
    server.listen(port);
    console.debug('\u001b[32m Server listening on port \033[0m' + port);