var app = require('express')();
var http = require('http').createServer(app);
var io = require('socket.io')(http);


let RoomUser = require("./models/waiting_room_user");
let WaitingRoomParams = require("./helpers/helperParams").WaitingRoomParams;

var wrp = new WaitingRoomParams();

var a1nps = io.of("a1");
var a2nps = io.of("a2");
var b1nps = io.of("b1");
var b2nps = io.of("b2");
var c1nps = io.of("c1");
var c2nps = io.of("c2");


io.on("connect", (socket) => {
    console.log("someone joined io");
});
a1nps.on("connect", (socket) => {
    console.log("someone joined a1");

    socket.on("SearchRoom", (data) => {

        var isAlreadyInWRP = false;

        for (let i = 0; i < wrp.a1.length; i++) {
            const roomUser = wrp.a1[i];
            if (roomUser.id === data.id) {
                isAlreadyInWRP = true;
                break;
            }
        }
        if (!isAlreadyInWRP) {
            wrp.a1.push(new RoomUser(data.id, socket));
            console.log(wrp.a1.length);
            if (wrp.a1.length % 2 == 1) {
                console.log("room created");
                socket.join(data.id);
                socket.emit("setRoomInfo", data);
            } else {
                var gamesockets = [wrp.a1.shift(), wrp.a1.shift()];

                for (let i = 0; i < gamesockets.length; i++) {
                    const user = gamesockets[i];
                    user.socket.join(gamesockets[0].id);
                    var data = {
                        roomID: gamesockets[0].id,
                        role: i == 0 ? "master" : "slave"
                    };
                    user.socket.emit("setRoomInfo",JSON.stringify(data));
                }
                console.log("room joined to " + gamesockets[0].id);
            }
        }
    });

    socket.on("sendWords",(data)=>{
        console.log(data.words);
        socket.to(data.roomID).emit("getWords",data.words);
    });


});



let port_no = 3000;
http.listen(port_no, "192.168.1.7", () => {
    console.log('listening on *:' + port_no.toString());
});

module.exports = io;