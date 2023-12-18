import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/logic/main/main_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 0.5,
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                  controller: controller,
                  onSubmitted: (username) {
                    login(username, context);
                  },
                ),
              ),
            ),
            const SizedBox(height: 80),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: ElevatedButton(
                onPressed: () {
                  login(controller.text, context);
                },
                child: const Text('Login'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void login(String username, BuildContext context) {
    if (username.isEmpty) {
      return;
    }
    context.read<MainCubit>().login(username);
  }
}
