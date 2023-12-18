import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/model/message/message.dart';
import 'package:front/model/room/room.dart';

part 'main_state.freezed.dart';

@freezed
sealed class MainState with _$MainState {
  const MainState._();
  const factory MainState.initial() = MainStateInitial;

  const factory MainState.logged({
    required String username,
    Room? selectedRoom,
    @Default([]) List<Room> rooms,
  }) = MainStateLogged;

  @override
  bool operator ==(Object other) {
    return identical(this, other);
  }

}