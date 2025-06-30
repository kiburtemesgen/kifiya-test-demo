import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kifiya_test/presentation/authentication/auth_bloc/auth_bloc.dart';
import 'package:kifiya_test/presentation/product_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userNameTextField = TextEditingController();
  final TextEditingController _passwordTextField = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductScreen()),
          );
        }
        if (state is AuthError) {
          const snackBar = SnackBar(
            duration: Duration(milliseconds: 2000),
            content: Text('Something went wrong please try again'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Username'),
                  TextField(controller: _userNameTextField),
                  Text('Password'),
                  TextField(controller: _passwordTextField),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: OutlinedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          AuthEvent.login(
                            username: _userNameTextField.text,
                            password: _passwordTextField.text,
                          ),
                        );
                      },
                      child: (state is AuthLoading)
                          ? Center(
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
