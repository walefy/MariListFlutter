import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/services/item_service.dart';

class AppWidget extends StatelessWidget {
  final Widget home;
  final ItemService itemService;
  const AppWidget({super.key, required this.home, required this.itemService});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => itemService,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 40, 42, 54),
        ),
        title: 'MariList',
        home: home,
      ),
    );
  }
}
