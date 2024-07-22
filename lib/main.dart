import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:todo_list_app/entities/item.dart';
import 'package:todo_list_app/models/item_model.dart';
import 'package:todo_list_app/pages/home/home_view.dart';

void main() {
  Configuration config = Configuration.local([Item.schema]);
  Realm realm = Realm(config);
  ItemModel itemModel = ItemModel(realm: realm);

  runApp(HomePage(itemModel: itemModel));
}
