import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:todo_list_app/entities/item.dart';
import 'package:todo_list_app/models/item_model.dart';
import 'package:todo_list_app/pages/home/home_view.dart';
import 'package:todo_list_app/pages/widgets/app_widget.dart';
import 'package:todo_list_app/services/item_service.dart';

void main() {
  Configuration config = Configuration.local([Item.schema]);
  Realm realm = Realm(config);
  ItemModel itemModel = ItemModel(realm: realm);
  ItemService itemService = ItemService(itemModel);

  runApp(
    AppWidget(
      home: const HomePage(),
      itemService: itemService,
    ),
  );
}
