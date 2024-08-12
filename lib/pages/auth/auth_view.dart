import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/repositories/auth_repository.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthRepository authRepository = Provider.of<AuthRepository>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                authRepository.userIsAuthenticated ? 'true' : 'false',
                style: const TextStyle(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: ElevatedButton(
                  onPressed: authRepository.loginWithGoogle,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 68, 71, 90),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.login,
                        color: Color.fromARGB(255, 139, 233, 253),
                      ),
                      SizedBox(width: 30.0),
                      Text(
                        'Entrar com google',
                        style: TextStyle(
                          color: Color.fromARGB(255, 139, 233, 253),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
