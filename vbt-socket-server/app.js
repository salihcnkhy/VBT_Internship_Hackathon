const { json } = require('express');

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

b2nps.on("connect", (socket) => setListeners(socket));

function setListeners(socket){
    socket.on("SearchRoom", data => searchRoom(data,socket));
    socket.on("endGame", data => endGame(data));
    socket.on("sendWords", data => sendWords(data));
    socket.on("sendScore", data => sendScore(data));
}

function searchRoom(data,socket) {
    console.log(findInGRP(data.id) + " Hİiiiii");
    console.log(findInWRP(data.id) + " Hİiiiii2");
    
    if (findInGRP(data.id) == null && findInWRP(data.id) == null) {

        wrp.b2.push(new RoomUser(data.id, socket));

        if (wrp.b2.length % 2 == 0) {

            console.log("user came to room: " + data.id);

            var roomUsers = [wrp.b2.shift(), wrp.b2.shift()];
            var crossUser = 1;

            for (let i = 0; i < roomUsers.length; i++) {

                const user = roomUsers[i];

                user.socket.join(roomUsers[0].id);

                var data = {
                    roomID: roomUsers[0].id,
                    otherUser: roomUsers[crossUser].id
                };

                crossUser--;

                user.socket.emit("setRoomInfo", JSON.stringify(data));
            }
            grp.b2.push(new GameRoom(roomUsers[0].id, roomUsers));
            console.log(grp.b2[0]);
            console.log("room joined to " + roomUsers[0].id);
        } 
    }
}

function endGame(data) {
    var index = -1;
    for (let i = 0; i < grp.b2.length; i++) {
        const room = grp.b2[i];
        console.log(room.id + " === " + data.roomID);
        if (room.id === data.roomID) {
            index = i;
            break;
        }
    }
    if (index > -1) {
        console.log("game ended:  " + data.roomID);

        var users = grp.b2[index].users;
        users.forEach(user => {
            user.socket.emit("endGame",true);
            user.socket.leaveAll();
            user.socket.disconnect();
            console.log("socket disconnected from all room");
        });
        grp.b2.splice(index, 1);
    }

}

function sendWords(data) {

    console.log(data.words);

    const gameRoom = findInGRP(data.roomID);

    if (gameRoom != null) {
        gameRoom.words.push(data.words);

        if (gameRoom.words.length == 2) {
            gameRoom.users[0].socket.to(gameRoom.id).emit("setWords", gameRoom.words[1]);
            gameRoom.users[1].socket.to(gameRoom.id).emit("setWords", gameRoom.words[0]);
            //console.log("All words sended: " + gameRoom.words);

        }
    }
}

function sendScore(data) {

    const gameRoom = findInGRP(data.roomID);
    if(gameRoom != null){
        const users = gameRoom.users;
        users.forEach(user => {
            
            const score = {
                "score" : data.score,
                "money" : data.money
            }

            user.socket.to(gameRoom.id).emit("sendScore", JSON.stringify(score));

        });
    }

}

function findInGRP(roomID) {
    for (let i = 0; i < grp.b2.length; i++) {
        const room = grp.b2[i];
        console.log(i.toString() + ". Oda: " + room.id);
        console.log(room.id + " === " + roomID );
        if (room.id === roomID) {
            console.log("Room Found.");
            return room;
        }
    }
    return null;

}

function findInWRP(uuid) {

    for (let i = 0; i < wrp.b2.length; i++) {
        const roomUser = wrp.b2[i];
        if (roomUser.id === uuid) {
            console.log("Already in queue");
            return roomUser;
        }
    }
    return null;
}

let port_no = 3000;
http.listen(port_no, "172.20.10.3", () => {
    console.log('listening on *:' + port_no.toString());
});

module.exports = io;