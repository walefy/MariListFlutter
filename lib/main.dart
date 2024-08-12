import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/config/config_helper.dart';
import 'package:todo_list_app/config/configuration_result.dart';
import 'package:todo_list_app/pages/auth/auth_view.dart';
import 'package:todo_list_app/pages/home/home_view_controller.dart';
import 'package:todo_list_app/pages/widgets/checkauth.dart';
import 'package:todo_list_app/repositories/auth_repository.dart';

void main() async {
  ConfigurationResult configurationResult = await ConfigHelper.config();

  runApp(ChangeNotifierProvider(
    create: (context) => AuthRepository(),
    child: CheckAuth(
      home: HomeViewController(itemModel: configurationResult.itemModel),
      auth: const AuthView(),
    ),
  ));
}
