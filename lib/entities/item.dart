import 'package:realm/realm.dart';

part 'item.realm.dart';

@RealmModel()
class _Item {
  @PrimaryKey()
  late ObjectId id;
  late String value;
  bool isChecked = false;
}
