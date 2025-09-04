import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:pinggo/features/auth/repository/auth_repository.dart';
import 'package:pinggo/features/home/cubit/home_state.dart';
import 'package:pinggo/core/di/service_locator.dart';
import 'package:pinggo/features/home/repository/home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  late final AuthRepository _authRepository;
  late final HomeRepository _homeRepository;
  StreamSubscription? _eventsSubscription;

  HomeCubit() : super(HomeState()) {
    _authRepository = sl<AuthRepository>();
    _homeRepository = sl<HomeRepository>();
    getProfile();
    loadEventsWithAttendance();
  }

  Future<void> getProfile() async {
    try {
      await _authRepository.getProfile();
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        error: e.toString(),
      ));
    }
  }

  void loadEventsWithAttendance() {
    emit(state.copyWith(isLoading: true, isSuccess: false, error: null));
    _eventsSubscription?.cancel();
    _eventsSubscription = _homeRepository.streamAllEvents().listen(
          (events) async {
        try {
          final List<Map<String, dynamic>> eventsWithCount = [];
          for (final event in events) {
            final id = event['id'];
            final count = await _homeRepository.getAttendanceCount(id);
            eventsWithCount.add({...event, 'attendanceCount': count});
          }
          emit(state.copyWith(
            events: eventsWithCount,
            isLoading: false,
            isSuccess: true,
            error: null,
          ));
        } catch (e) {
          emit(state.copyWith(
            isLoading: false,
            isSuccess: false,
            error: e.toString(),
          ));
        }
      },
      onError: (e) {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: false,
          error: e.toString(),
        ));
      },
    );
  }

  @override
  Future<void> close() {
    _eventsSubscription?.cancel();
    return super.close();
  }
}