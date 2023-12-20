import { createServer } from "http";
import { Server, Socket } from "socket.io";
import express, { Express, Request, Response } from "express";
import { Message } from "./model/message";


const app: Express = express();
const http = createServer(app);
const io = new Server(http);

const rooms = [];

app.use(express.static('public'));

io.use((socket, next) => {
  const username = socket.handshake.auth.username;
  if (!username) {
    return next(new Error("invalid username"));
  }
  socket.username = username;
  next();
});

io.on('connection', (socket: Socket) => {
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
  })

  socket.on('disconnect', () => {
      socket.broadcast.emit('user disconnected', socket.id);
  });
  socket.on('chat message', ({to, text}) => {
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