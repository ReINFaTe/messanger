import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/logic/main/main_cubit.dart';
import 'package:front/logic/main/main_state.dart';
import 'package:front/model/room/room.dart';
import 'package:front/presentation/page/chat.page.dart';
import 'package:front/presentation/page/rooms.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? selectedRoom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 1,
            child: RoomsPage(callback: selectRoom),
          ),
          const Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: ChatPage(),
          ),
        ],
      ),
    );
  }

  void selectRoom(String id) {
    context.read<MainCubit>().selectRoom(id);
  }
}
