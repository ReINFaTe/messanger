import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/logic/main/main_state.dart';
import 'package:front/model/message/message.dart';
import 'package:front/model/room/room.dart';
import 'package:front/utils/globals.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MainCubit extends Cubit<MainState> {

  late String username;
  late IO.Socket socket;
  List<Message> messages = <Message>[];
  List<Room> rooms = <Room>[];
  Room? selectedRoom;

  MainCubit() : super(const MainState.initial());

  void login(String username) {
    socket = IO.io(Globals.socketURL, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.auth = {'username': username};
    socket.on('chat message', _onChatMessage);
    socket.on('rooms', _onRooms);

    socket.connect();
    emit(MainState.logged(username: username));
    this.username = username;
  }

  void sendMessage(String roomId, String text) {
    final room = rooms.firstWhere((element) => element.id == roomId);
    room.messages.add(Message(userId: '', username: username, text: text));
    if (room.id == selectedRoom?.id) {
      selectedRoom = room.copyWith();
    }
    emit(switch (state) {
      MainStateLogged() => (state as MainStateLogged).copyWith(
        rooms: [...rooms],
        selectedRoom: selectedRoom,
      ),
      MainStateInitial() => throw Error(),
    });
    socket.emit('chat message', {
      'text': text,
      'to': roomId,
    });
  }

  void _onChatMessage(dynamic data) {
    final message = Message.fromJson(data);
    final room = rooms.firstWhere((element) => element.id == message.userId);
    room.messages.add(message);
    if (room.id != selectedRoom?.id) {
      room.hasNewMessages = true;
    }
    else {
      selectedRoom = room.copyWith();
    }
    emit((state as MainStateLogged).copyWith(
      rooms: [...rooms],
      selectedRoom: selectedRoom!.copyWith(),
    ));
  }

  void _onRooms(dynamic data) {
    rooms = [];
    for (final room in data) {
      rooms.add(Room.fromJson(room));
    }
    emit((state as MainStateLogged).copyWith(
        rooms: [...rooms]
    ));
  }

  void selectRoom(String roomId) {
    final room = rooms.firstWhere((element) => element.id == roomId);
    room.hasNewMessages = false;
    selectedRoom = room;
    emit((state as MainStateLogged).copyWith(
      selectedRoom: selectedRoom,
    ));
  }

}