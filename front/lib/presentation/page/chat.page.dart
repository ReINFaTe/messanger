import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/logic/main/main_cubit.dart';
import 'package:front/logic/main/main_state.dart';
import 'package:front/model/room/room.dart';
import 'package:front/presentation/page/chat.message.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatPage extends StatefulWidget {

  const ChatPage({
    super.key,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final TextEditingController messageC = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final ScrollController scrollController = ScrollController();
  late final IO.Socket socket;

  String? lastRoomId;

  @override
  Widget build(BuildContext context) {
    final room = context.select((MainCubit cubit) => (cubit.state as MainStateLogged).selectedRoom);
    if (room == null) {
      return const Center(child: Text('Select Room'));
    }
    final messages = room.messages;
    final currentUser = context.select((MainCubit cubit) => (cubit.state as MainStateLogged).username);
    if (lastRoomId != room.id) {
      lastRoomId = room.id;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.jumpTo(
          scrollController.position.maxScrollExtent,
        );
      });
    }
    else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
        );
      });
    }

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900.withOpacity(0.05),
      appBar: AppBar(
        title: Text(room.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                controller: scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return Align(
                    alignment: message.username == currentUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: ChatMessage(message, alignEnd: message.username == currentUser)
                  );
                }
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 0,
                maxHeight: 500,
              ),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF494F55),
                elevation: 20,
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            enabled: room.online,
                            keyboardType: TextInputType.text,
                            maxLines: null,
                            autofocus: true,
                            controller: messageC,
                            focusNode: focusNode,
                            onFieldSubmitted: _submitMessage,

                            decoration: const InputDecoration(
                              hintText: 'Type a message',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsets.all(8),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: room.online ? _submitMessage : null,
                          child: const Text('Send'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitMessage([String? _]) {
    final text = messageC.text;
    focusNode.requestFocus();
    if (text.isEmpty) return;
    context.read<MainCubit>().sendMessage((context.read<MainCubit>().state as MainStateLogged).selectedRoom!.id, text);
    messageC.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    });
  }
}
