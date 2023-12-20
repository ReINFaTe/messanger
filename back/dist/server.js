"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const http_1 = require("http");
const socket_io_1 = require("socket.io");
const express_1 = __importDefault(require("express"));
const app = (0, express_1.default)();
const http = (0, http_1.createServer)(app);
const io = new socket_io_1.Server(http);
const rooms = [];
app.use(express_1.default.static('public'));
io.use((socket, next) => {
    const username = socket.handshake.auth.username;
    if (!username) {
        return next(new Error("invalid username"));
    }
    socket.username = username;
    next();
});
io.on('connection', (socket) => {
    console.log('A user connected');
    const users = [];
    for (let [id, otherSocket] of io.of("/").sockets) {
        users.push({
            id: id,
            name: otherSocket.username,
            messages: [],
        });
    }
    socket.emit("rooms", users);
    socket.broadcast.emit('user connected', {
        id: socket.id,
        name: socket.username,
        messages: [],
    });
    socket.on('disconnect', () => {
        socket.broadcast.emit('user disconnected', socket.id);
    });
    socket.on('chat message', ({ to, text }) => {
        console.log('message: ' + text);
        socket.to(to).emit('chat message', {
            text: text,
            username: socket.username,
            userId: socket.id,
        });
    });
});
http.listen(3000, () => {
    console.log('Server running at http://localhost:3000');
});
//# sourceMappingURL=server.js.map