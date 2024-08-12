import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:todo_list_app/config/configuration_result.dart';
import 'package:todo_list_app/entities/item.dart';
import 'package:todo_list_app/firebase_options.dart';
import 'package:todo_list_app/models/item_model.dart';

class ConfigHelper {
  static Future<ConfigurationResult> config() async {
    WidgetsFlutterBinding.ensureInitialized();

    await _configFirebase();
    ItemModel itemModel = _configItemModel();

    return ConfigurationResult(itemModel: itemModel);
  }

  static ItemModel _configItemModel() {
    Configuration config = Configuration.local([Item.schema]);
    Realm realm = Realm(config);
    return ItemModel(realm: realm);
  }

  static Future<void> _configFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.debug,
    );
  }
}
