import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pinggo/features/auth/register/cubit/registration_cubit.dart';
import 'package:pinggo/features/auth/register/cubit/registration_state.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (_) => RegistrationCubit(),
      child: Scaffold(
        body: SizedBox.expand(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: BlocConsumer<RegistrationCubit, RegistrationState>(
                  listener: (BuildContext context, RegistrationState state) {
                    if (state.isLoading) {
                      Center(child: SizedBox(height:40,width:40, child: CircularProgressIndicator()));
                    } else if (state.isSuccess) {
                      context.go('/');
                    } else if (state.errorMessage != null) {
                      Text("Error: ${state.errorMessage}");
                    }
                  },
                  builder: (context, state) {
                    final cubit = context.read<RegistrationCubit>();
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Create Account",
                            style: theme.textTheme.headlineMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Join us and manage your account easily",
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32),

                          // Card container for form
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 8,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: FormBuilder(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    // Role selection
                                    FormBuilderRadioGroup<String>(
                                      name: 'role',
                                      decoration: const InputDecoration(
                                        labelText: 'Select your role',
                                      ),
                                      options: const [
                                        FormBuilderFieldOption(
                                            value: 'admin', child: Text('Admin')),
                                        FormBuilderFieldOption(
                                            value: 'user', child: Text('User')),
                                      ],
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                      wrapAlignment: WrapAlignment.spaceEvenly,
                                    ),
                                    const Gap(16),

                                    // Full Name
                                    FormBuilderTextField(
                                      name: 'username',
                                      decoration: InputDecoration(
                                        labelText: 'Full Name',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        prefixIcon: const Icon(Icons.person),
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                        FormBuilderValidators.minLength(3),
                                      ]),
                                    ),
                                    const Gap(16),

                                    // Email
                                    FormBuilderTextField(
                                      name: 'email',
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        prefixIcon: const Icon(Icons.email),
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                        FormBuilderValidators.email(),
                                      ]),
                                    ),
                                    const Gap(16),

                                    // Password
                                    FormBuilderTextField(
                                      name: 'password',
                                      obscureText: state.isObscured,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        prefixIcon: const Icon(Icons.lock),
                                        suffixIcon: IconButton(
                                          icon: Icon(state.isObscured
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                          onPressed: cubit.togglePasswordVisibility,
                                        ),
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                        FormBuilderValidators.minLength(6),
                                      ]),
                                    ),
                                    const Gap(16),

                                    // Confirm Password
                                    FormBuilderTextField(
                                      name: 'confirmPassword',
                                      obscureText: state.isConfObscured,
                                      decoration: InputDecoration(
                                        labelText: 'Confirm Password',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        prefixIcon: const Icon(Icons.lock_outline),
                                        suffixIcon: IconButton(
                                          icon: Icon(state.isConfObscured
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                          onPressed: cubit
                                              .toggleConfirmPasswordVisibility,
                                        ),
                                      ),
                                      validator: (value) {
                                        final password = _formKey
                                            .currentState?.fields['password']?.value;
                                        if (value != password) {
                                          return "Passwords do not match";
                                        }
                                        return null;
                                      },
                                    ),
                                    const Gap(24),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Already have an account? ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {

                                            context.go('/');
                                          },
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Gap(24),

                                    // Submit button
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          backgroundColor:
                                          const Color(0xFF6A11CB),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState
                                              ?.saveAndValidate() ??
                                              false) {
                                            final formData =
                                                _formKey.currentState!.value;

                                            cubit.registerUser(formData);

                                            print(formData);

                                          }
                                        },
                                        child: state.isLoading ? Center(
                                          child: CircularProgressIndicator(),
                                        ) :  Text(
                                          "Register",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
