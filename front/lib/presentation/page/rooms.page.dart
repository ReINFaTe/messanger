import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/logic/main/main_cubit.dart';
import 'package:front/logic/main/main_state.dart';
import 'package:front/model/message/message.dart';

class RoomsPage extends StatefulWidget {
  final void Function(String id) callback;

  const RoomsPage({
    required this.callback,
    super.key
  });

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  Widget build(BuildContext context) {
    final rooms = context.select((MainCubit cubit) => (cubit.state as MainStateLogged).rooms);
    final selectedRoom = context.select((MainCubit cubit) => (cubit.state as MainStateLogged).selectedRoom);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView.builder(
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            final room = rooms[index];
            Message? lastMessage = room.messages.lastOrNull;
            return SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedRoom?.id == room.id ? Colors.deepPurple.shade900.withOpacity(0.3) : Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () {
                  widget.callback(room.id);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(room.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium),
                          Text(lastMessage != null ? lastMessage.text : '', maxLines: 1, overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: room.hasNewMessages ? Colors.blue : Colors.transparent
                        ),
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
