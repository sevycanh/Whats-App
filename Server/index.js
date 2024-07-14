const express = require("express");
const http = require("http");
const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
var io = require("socket.io")(server);

//middleware
app.use(express.json());
var clients = {};

io.on("connection", (socket) => {
    console.log("connected");
    console.log(socket.id, "has joined");
    socket.on("signin", (id)=>{
        console.log(id);
        clients[id] = socket;
        console.log(clients);
    });

    socket.on("message", (msg)=> {
        console.log(msg);
        let targetId = msg.targetId;
        if(clients[targetId]) clients[targetId].emit("message", msg);
    });
});

server.listen(port, ()=>{
    console.log("server started");
})