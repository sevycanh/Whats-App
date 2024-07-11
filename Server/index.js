const express = require("express");
const http = require("http");
const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
var io = require("socket.io")(server);

//middleware
app.use(express.json());

io.on("connection", () => {
    console.log("connected");
});

server.listen(port, ()=>{
    console.log("server started");
})