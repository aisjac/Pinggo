import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final List<Map<String, dynamic>> events;
  final bool isLoading;
  final bool isSuccess;
  final String? error;

  const HomeState({
    this.events = const [],
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
  });

  HomeState copyWith({
    List<Map<String, dynamic>>? events,
    bool? isLoading,
    bool? isSuccess,
    String? error,
  }) {
    return HomeState(
      events: events ?? this.events,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error,
    );
  }

  @override
  List<Object?> get props => [events, isLoading, isSuccess, error];
}