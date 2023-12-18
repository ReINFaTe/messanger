import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/model/message/message.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@Freezed(
  toJson: false,
  equal: false,
  addImplicitFinal: false,
  makeCollectionsUnmodifiable: false,
)
sealed class Room with _$Room {
  const Room._();
  factory Room({
    required String id,
    required String name,
    required List<Message> messages,
    @Default(true) bool hasNewMessages,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}