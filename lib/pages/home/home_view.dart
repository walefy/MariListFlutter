import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:todo_list_app/entities/item.dart';
import 'package:todo_list_app/pages/widgets/add_item_button.dart';
import 'package:todo_list_app/pages/widgets/item_input.dart';
import 'package:todo_list_app/pages/widgets/items_list.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<AnimatedListState> listKey;
  final List<Item> items;
  final TextEditingController itemInputController;

  final void Function(ObjectId id, bool state) toggleItemCompleted;
  final void Function(ObjectId id) removeItem;
  final void Function() addItem;

  const HomeView({
    super.key,
    required this.toggleItemCompleted,
    required this.removeItem,
    required this.addItem,
    required this.listKey,
    required this.items,
    required this.itemInputController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: AnimatedItemList(
                listKey: listKey,
                items: items,
                toggleItemCompleted: toggleItemCompleted,
                removeItem: removeItem,
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 40, 42, 54),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ItemInput(controller: itemInputController),
                    ),
                    const SizedBox(width: 10),
                    AddItemButton(onPress: addItem),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
