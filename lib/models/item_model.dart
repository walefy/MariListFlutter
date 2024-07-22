import 'package:realm/realm.dart';
import 'package:todo_list_app/entities/item.dart';

class ItemModel {
  Realm realm;

  ItemModel({required this.realm});

  Item create(String value) {
    return realm.write(() => realm.add(Item(ObjectId(), value)));
  }

  Item? findById(ObjectId id) {
    return realm.find(id);
  }

  List<Item> findAll() {
    return realm.all<Item>().toList();
  }

  void delete(Item item) {
    realm.write(() => realm.delete(item));
  }

  Item updateIsChecked(Item item, bool isChecked) {
    realm.write(() {
      item.isChecked = isChecked;
    });

    return item;
  }
}
