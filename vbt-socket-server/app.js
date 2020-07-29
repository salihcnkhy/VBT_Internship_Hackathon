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

b2nps.on("connect", (socket) => {


    socket.on("SearchRoom", (data) => {

        var isAlreadyInWRP = false;
        var isAlreadyInGRP = false;

        for (let i = 0; i < wrp.b2.length; i++) {
            const roomUser = wrp.b2[i];
            if (roomUser.id === data.id) {
                console.log("Already in queue");
                isAlreadyInWRP = true;
                break;
            }
        }

        for (let i = 0; i < grp.b2.length; i++) {
            const gameRoom = grp.b2[i];
            if (gameRoom.user[0].id === data.id ||gameRoom.user[1].id === data.id) {
                console.log("Already in game");
                isAlreadyInGRP = true;
                break
            }
        }
        if (!isAlreadyInWRP && !isAlreadyInGRP) {
            wrp.b2.push(new RoomUser(data.id, socket));
            console.log(wrp.b2.length);
            if (wrp.b2.length % 2 == 1) {
                console.log("room created by: "+ data.id);

            } else {
                console.log("user came to room: "+ data.id);

                var gamesockets = [wrp.b2.shift(), wrp.b2.shift()];
                var crossUser = 1;
                for (let i = 0; i < gamesockets.length; i++) {
                    const user = gamesockets[i];
                    user.socket.join(gamesockets[0].id);
                    var data = {
                        roomID: gamesockets[0].id,
                        otherUser: gamesockets[crossUser].id
                    };
                    crossUser--;
                    user.socket.emit("setRoomInfo", JSON.stringify(data));
                }
                grp.b2.push(new GameRoom(gamesockets[0].id, gamesockets));
                console.log(grp.b2[0]);
                console.log("room joined to " + gamesockets[0].id);
            }
        }
    });
    socket.on("endGame", (data)=>{
        var index = -1;
        for (let i = 0; i < grp.b2.length; i++) {
            const room = grp.b2[i];
            console.log(room.id + " === " + data.roomID);
            if(room.id === data.roomID){
                index = i;
                break;
            }
        }
        if(index > -1){
            console.log("game ended:  "+ data.roomID);
            
            var users = grp.b2[index].user;
            users.forEach(user => {
                user.socket.leaveAll();
                user.socket.disconnect();
                console.log("socket disconnected from all room");
            });
            grp.b2.splice(index,1);
        }
       
    });
    socket.on("sendWords", (data) => {
        console.log(data.words);

        var gameRoom; 
        for (let i = 0; i < grp.b2.length; i++) {
            const room = grp.b2[i];
            console.log(i.toString() +". Oda: "+room.id);
            console.log(room.id + " === " + data.roomID);
            if(room.id === data.roomID){
                console.log("Room Found.");
                gameRoom = room;
                break;
            }
        }

        gameRoom.words.push(data.words);
        console.log("Olum çalışmıyor ");
        if (gameRoom.words.length == 2) {
            gameRoom.user[0].socket.to(gameRoom.id).emit("setWords", gameRoom.words[1]);
            gameRoom.user[1].socket.to(gameRoom.id).emit("setWords", gameRoom.words[0]);
            //console.log("All words sended: " + gameRoom.words);

        }
    });


});



let port_no = 3000;
http.listen(port_no, "172.20.10.3", () => {
    console.log('listening on *:' + port_no.toString());
});

module.exports = io;