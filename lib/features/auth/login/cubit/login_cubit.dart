import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinggo/core/di/service_locator.dart';
import 'package:pinggo/features/auth/repository/auth_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  late AuthRepository _authRepository;

  LoginCubit() : super(const LoginState()){
    _authRepository = sl<AuthRepository>();

  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isObscured: !state.isObscured));
  }

  Future<void> loginUser(Map<String, dynamic> data) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    try {
      await _authRepository.doLogin(data);
      await _authRepository.getProfile();
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        isSuccess: false,
      ));
    }
  }

  void resetState() {
    emit(const LoginState());
  }
}
