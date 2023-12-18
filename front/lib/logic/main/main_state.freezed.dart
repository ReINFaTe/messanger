// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String username, Room? selectedRoom, List<Room> rooms)
        logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String username, Room? selectedRoom, List<Room> rooms)?
        logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String username, Room? selectedRoom, List<Room> rooms)?
        logged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MainStateInitial value) initial,
    required TResult Function(MainStateLogged value) logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainStateInitial value)? initial,
    TResult? Function(MainStateLogged value)? logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainStateInitial value)? initial,
    TResult Function(MainStateLogged value)? logged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MainStateInitialImplCopyWith<$Res> {
  factory _$$MainStateInitialImplCopyWith(_$MainStateInitialImpl value,
          $Res Function(_$MainStateInitialImpl) then) =
      __$$MainStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MainStateInitialImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$MainStateInitialImpl>
    implements _$$MainStateInitialImplCopyWith<$Res> {
  __$$MainStateInitialImplCopyWithImpl(_$MainStateInitialImpl _value,
      $Res Function(_$MainStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MainStateInitialImpl extends MainStateInitial {
  const _$MainStateInitialImpl() : super._();

  @override
  String toString() {
    return 'MainState.initial()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String username, Room? selectedRoom, List<Room> rooms)
        logged,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String username, Room? selectedRoom, List<Room> rooms)?
        logged,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String username, Room? selectedRoom, List<Room> rooms)?
        logged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MainStateInitial value) initial,
    required TResult Function(MainStateLogged value) logged,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainStateInitial value)? initial,
    TResult? Function(MainStateLogged value)? logged,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainStateInitial value)? initial,
    TResult Function(MainStateLogged value)? logged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MainStateInitial extends MainState {
  const factory MainStateInitial() = _$MainStateInitialImpl;
  const MainStateInitial._() : super._();
}

/// @nodoc
abstract class _$$MainStateLoggedImplCopyWith<$Res> {
  factory _$$MainStateLoggedImplCopyWith(_$MainStateLoggedImpl value,
          $Res Function(_$MainStateLoggedImpl) then) =
      __$$MainStateLoggedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String username, Room? selectedRoom, List<Room> rooms});

  $RoomCopyWith<$Res>? get selectedRoom;
}

/// @nodoc
class __$$MainStateLoggedImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$MainStateLoggedImpl>
    implements _$$MainStateLoggedImplCopyWith<$Res> {
  __$$MainStateLoggedImplCopyWithImpl(
      _$MainStateLoggedImpl _value, $Res Function(_$MainStateLoggedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? selectedRoom = freezed,
    Object? rooms = null,
  }) {
    return _then(_$MainStateLoggedImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      selectedRoom: freezed == selectedRoom
          ? _value.selectedRoom
          : selectedRoom // ignore: cast_nullable_to_non_nullable
              as Room?,
      rooms: null == rooms
          ? _value._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomCopyWith<$Res>? get selectedRoom {
    if (_value.selectedRoom == null) {
      return null;
    }

    return $RoomCopyWith<$Res>(_value.selectedRoom!, (value) {
      return _then(_value.copyWith(selectedRoom: value));
    });
  }
}

/// @nodoc

class _$MainStateLoggedImpl extends MainStateLogged {
  const _$MainStateLoggedImpl(
      {required this.username,
      this.selectedRoom,
      final List<Room> rooms = const []})
      : _rooms = rooms,
        super._();

  @override
  final String username;
  @override
  final Room? selectedRoom;
  final List<Room> _rooms;
  @override
  @JsonKey()
  List<Room> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  @override
  String toString() {
    return 'MainState.logged(username: $username, selectedRoom: $selectedRoom, rooms: $rooms)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainStateLoggedImplCopyWith<_$MainStateLoggedImpl> get copyWith =>
      __$$MainStateLoggedImplCopyWithImpl<_$MainStateLoggedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String username, Room? selectedRoom, List<Room> rooms)
        logged,
  }) {
    return logged(username, selectedRoom, rooms);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String username, Room? selectedRoom, List<Room> rooms)?
        logged,
  }) {
    return logged?.call(username, selectedRoom, rooms);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String username, Room? selectedRoom, List<Room> rooms)?
        logged,
    required TResult orElse(),
  }) {
    if (logged != null) {
      return logged(username, selectedRoom, rooms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MainStateInitial value) initial,
    required TResult Function(MainStateLogged value) logged,
  }) {
    return logged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainStateInitial value)? initial,
    TResult? Function(MainStateLogged value)? logged,
  }) {
    return logged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainStateInitial value)? initial,
    TResult Function(MainStateLogged value)? logged,
    required TResult orElse(),
  }) {
    if (logged != null) {
      return logged(this);
    }
    return orElse();
  }
}

abstract class MainStateLogged extends MainState {
  const factory MainStateLogged(
      {required final String username,
      final Room? selectedRoom,
      final List<Room> rooms}) = _$MainStateLoggedImpl;
  const MainStateLogged._() : super._();

  String get username;
  Room? get selectedRoom;
  List<Room> get rooms;
  @JsonKey(ignore: true)
  _$$MainStateLoggedImplCopyWith<_$MainStateLoggedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
