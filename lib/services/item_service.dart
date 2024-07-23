import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:todo_list_app/entities/item.dart';
import 'package:todo_list_app/models/item_model.dart';

class ItemService extends ChangeNotifier {
  final ItemModel _itemModel;
  late List<Item> _items;

  ItemService(this._itemModel) {
    _items = _itemModel.findAll();
  }

  List<Item> get items => _items;

  void addItem(String value) {
    if (value.isEmpty) return;

    Item item = _itemModel.create(value);
    _items.add(item);
    notifyListeners();
  }

  Map<String, dynamic> removeItem(ObjectId id) {
    int index = _items.indexWhere((e) => e.id == id);
    Item item = _items.removeAt(index);
    Item itemFreezed = item.freeze();
    _itemModel.delete(item);
    notifyListeners();
    return {'index': index, 'item': itemFreezed};
  }

  void toggleItemCompleted(ObjectId id, bool state) {
    Item item = _items.firstWhere((e) => e.id == id);
    _itemModel.updateIsChecked(item, state);
    notifyListeners();
  }
}
