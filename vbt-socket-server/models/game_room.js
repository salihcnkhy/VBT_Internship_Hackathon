function GameRoom(id,roomUsers){
    this.id = id;
    this.users = roomUsers;
    this.words = [];
}
module.exports.GameRoom = GameRoom;
