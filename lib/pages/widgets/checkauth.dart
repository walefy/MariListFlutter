import 'package:flutter/material.dart';
import 'package:todo_list_app/pages/widgets/main_app.dart';

class CheckAuth extends StatelessWidget {
  final bool userIsAuthenticated = false;
  final Widget home;
  final Widget auth;

  const CheckAuth({super.key, required this.home, required this.auth});

  @override
  Widget build(BuildContext context) {
    return userIsAuthenticated
        ? MainApp(home: home, title: 'MariList')
        : MainApp(home: auth, title: 'MariList');
  }
}
