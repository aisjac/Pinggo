import 'package:equatable/equatable.dart';

class RegistrationState extends Equatable {
  final bool isLoading;
  final bool isObscured;
  final bool isConfObscured;
  final bool isSuccess;
  final String? errorMessage;

  const RegistrationState({
    this.isLoading = false,
    this.isObscured = true,
    this.isSuccess = false,
    this.isConfObscured = true,
    this.errorMessage,
  });

  RegistrationState copyWith({
    bool? isLoading,
    bool? isObscured,
    bool? isConfObscured,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return RegistrationState(
      isLoading: isLoading ?? this.isLoading,
      isObscured: isObscured ?? this.isObscured,
      isConfObscured: isConfObscured ?? this.isConfObscured,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isObscured,
    isConfObscured,
    isSuccess,
    errorMessage,
  ];
}
