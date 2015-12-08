var http = require('http');
var fs = require('fs');

var handleRequest = function(request, response) {
  response.writeHead(200);
  
  var logtxt = new Date().toISOString() + " :request received from " + request.connection.remoteAddress;
  
  console.log(logtxt);

  fs.appendFile("/data/log.txt", logtxt + " in file\n", function(err){
      if(err) throw err;
  });
 
   
  response.end("Hello World!");
}

var www = http.createServer(handleRequest);
www.listen(8080);
