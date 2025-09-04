import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinggo/core/di/service_locator.dart';
import 'package:pinggo/features/auth/repository/auth_repository.dart';
import 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  late AuthRepository _authRepository;

  RegistrationCubit() : super(const RegistrationState()){
    _authRepository = sl<AuthRepository>();
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isObscured: !state.isObscured));
  }

  void toggleConfirmPasswordVisibility() {
    emit(state.copyWith(isConfObscured: !state.isConfObscured));
  }

  Future<void> registerUser(Map<String, dynamic> data) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    try {
      await _authRepository.doRegistration(data);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        isSuccess: false,
      ));
    }
  }
}
