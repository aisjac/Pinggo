import 'package:equatable/equatable.dart';

class EventMapState extends Equatable {
  final List<Map<String, dynamic>> events;
  final bool success;

  const EventMapState({
    this.events = const [],
    this.success = false,
  });

  EventMapState copyWith({
    List<Map<String, dynamic>>? events,
    bool? success,
  }) {
    return EventMapState(
      events: events ?? this.events,
      success: success ?? this.success,
    );
  }

  @override
  List<Object?> get props => [events, success];
}