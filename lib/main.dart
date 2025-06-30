import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kifiya_test/core/di.dart';
import 'package:kifiya_test/presentation/authentication/auth_bloc/auth_bloc.dart';
import 'package:kifiya_test/presentation/authentication/login_screen.dart';
import 'package:kifiya_test/presentation/product/blocs/favorite/favorite_bloc/favorite_bloc.dart';
import 'package:kifiya_test/presentation/product/blocs/product/product_bloc/product_bloc.dart';
import 'package:kifiya_test/presentation/product/blocs/product/product_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(const KifiyaApp());
}

class KifiyaApp extends StatelessWidget {
  const KifiyaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(create: (context) => getIt<ProductBloc>()),
        BlocProvider<AuthBloc>(create: (context) => getIt<AuthBloc>()),
        BlocProvider<FavoriteBloc>(create: (context) => getIt<FavoriteBloc>()),
      ],
      child: MaterialApp(
        title: 'Kifiya Test Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: LoginScreen(),
      ),
    );
  }
}
