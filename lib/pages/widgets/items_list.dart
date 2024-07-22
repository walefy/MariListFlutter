import 'package:flutter/cupertino.dart';
import 'package:realm/realm.dart';
import 'package:todo_list_app/entities/item.dart';
import 'package:todo_list_app/pages/widgets/item_tile.dart';

class AnimatedItemList extends StatelessWidget {
  final List<Item> items;
  final GlobalKey<AnimatedListState> listKey;
  final void Function(ObjectId id, bool state) toggleItemCompleted;
  final void Function(ObjectId id) removeItem;

  const AnimatedItemList({
    super.key,
    required this.items,
    required this.toggleItemCompleted,
    required this.removeItem,
    required this.listKey,
  });

  Widget _builder(BuildContext context, int i, Animation<double> animation) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ItemTile(
        item: items[i],
        animation: animation,
        toggleItemCompleted: toggleItemCompleted,
        removeItem: removeItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: listKey,
      itemBuilder: _builder,
      initialItemCount: items.length,
    );
  }
}
