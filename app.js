
var url= require('url');
var fs= require('fs');

function renderHtml(path, res){
	fs.readFile(path, null, function(error, data){
		if(error){
			res.writeHead(404);
			res.write('File not found');
		}else {
			res.write(data);
		}
		res.end();
	});
}

module.exports = {
	handleRequest: function(req, res) {
		//response.writeHead(200 )
		var path = url.parse(req.url).pathname;
		switch (path) {
			case '/Juego':
				renderHtml('./index.html' , res);
				break;
			case  '/Inicio':
				renderHtml('./inicio.html', res);
				break;
			default:
				res.writeHead(404);
				res.write('Route not defined');
				res.end();
		}

	}
};

