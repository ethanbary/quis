// importing modules

const express = require('express');
const http = require('http');
const mongoose = require('mongoose');

const  app = express();
const port = process.env.port || 3000;
var server = http.createServer(app);
const Room = require('./models/room');

var  io = require("socket.io")(server);

//middleware
app.use(express.json());

const DB = "mongodb+srv://mongouser1:S642i9IhOBfMPkEY@cluster0.xaolojx.mongodb.net/?retryWrites=true&w=majority";

//setting socket io
io.on('connection',(socket) => {
    console.log("socket connected!");
    socket.on('createRoom', async ({nickname}) => {
        console.log(nickname);
        console.log(socket.id);
        try{
            //room is created
        let room = new Room();
        let player = {
            socketID: socket.id,
            nickname: nickname,
            playerType:'X',

        };

        //player stored in room
        room.players.push(player);
        room.turn = player;
        
        //save to mongodb
        room = await room.save();

        const roomId = room._id.toString();
        socket.join(roomId);
        // tell client to move to the room(page)
        io.to(roomId).emit('createRoomSuccess', room);

        }
        catch(e){
            console.log(e);
        }
        
        
        
    });

});

mongoose.connect(DB).then(()=>{
    console.log("connection successful");
})
    .catch((e) => {
    console.log(e);
 });

server.listen(port,"0.0.0.0",()=>{
    console.log('Server  started abd runnning on'  + port);
});
