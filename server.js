var express= require('express');
var http= require('http');
var app= require('./app');
var app2= express();
var io= require('socket.io')(http);

http.createServer(app.handleRequest).listen(8000);


io.sockets.on('connection', function (socket) {
 	console.log('socket connection');
});