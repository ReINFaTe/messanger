import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/logic/main/main_cubit.dart';
import 'package:front/logic/main/main_state.dart';
import 'package:front/presentation/page/chat.page.dart';
import 'package:front/presentation/page/home.page.dart';
import 'package:front/presentation/page/login.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple, brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => MainCubit(),
        child: const App(title: 'Messenger'),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key, required this.title});
  final String title;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    context.select((MainCubit cubit) => cubit.state is MainStateLogged);
    final mainCubit = context.read<MainCubit>();
    return switch (mainCubit.state) {
      MainStateInitial() => LoginPage(),
      MainStateLogged() => const HomePage(),
    };
  }
}
