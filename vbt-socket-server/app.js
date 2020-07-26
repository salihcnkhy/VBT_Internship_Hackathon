var app = require('express')();
var http = require('http').createServer(app);
var io = require('socket.io')(http);


let RoomUser = require("./models/waiting_room_user").RoomUser;
let GameRoom = require("./models/game_room").GameRoom;

let WaitingRoomParams = require("./helpers/helperParams").WaitingRoomParams;
let GameRoomParams = require("./helpers/helperParams").GameRoomParams;


//Add RoomUser into wrp
var wrp = new WaitingRoomParams();

//add GameRoom into grp
var grp = new GameRoomParams();

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

            } else {
                var gamesockets = [wrp.a1.shift(), wrp.a1.shift()];

                for (let i = 0; i < gamesockets.length; i++) {
                    const user = gamesockets[i];
                    user.socket.join(gamesockets[0].id);
                    var data = {
                        roomID: gamesockets[0].id,
                        role: i == 0 ? "master" : "slave"
                    };
                    user.socket.emit("setRoomInfo", JSON.stringify(data));
                }
                grp.a1.push(new GameRoom(gamesockets[0].id, gamesockets));
                console.log(grp.a1[0]);
                console.log("room joined to " + gamesockets[0].id);
            }
        }
    });

    socket.on("sendWords", (data) => {
        console.log(data.words);

        var gameRoom; 
        for (let i = 0; i < grp.a1.length; i++) {
            const room = grp.a1[i];
            console.log(i.toString() +". Oda: "+room.id);
            console.log(room.id + " === " + data.roomID);
            if(room.id === data.roomID){
                console.log("Room Found.");
                gameRoom = room;
                break;
            }
        }

        gameRoom.words.push(data.words);

        if (gameRoom.words.length == 2) {
            gameRoom.user[0].socket.to(gameRoom.id).emit("setWords", gameRoom.words[1]);
            gameRoom.user[1].socket.to(gameRoom.id).emit("setWords", gameRoom.words[0]);
            console.log("All words sended: " + gameRoom.words);

        } else {
            console.log("One User Sended Words: " + gameRoom.words);
        }
    });


});



let port_no = 3000;
http.listen(port_no, "192.168.1.7", () => {
    console.log('listening on *:' + port_no.toString());
});

module.exports = io;