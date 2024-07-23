import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:todo_list_app/pages/widgets/add_item_button.dart';
import 'package:todo_list_app/pages/widgets/item_input.dart';
import 'package:todo_list_app/pages/widgets/item_tile.dart';
import 'package:todo_list_app/pages/widgets/items_list.dart';
import 'package:todo_list_app/services/item_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _addItemInputController;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  late ItemService itemService;

  @override
  void initState() {
    _addItemInputController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _addItemInputController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    itemService = Provider.of<ItemService>(context, listen: false);
  }

  void _addItem() {
    itemService.addItem(_addItemInputController.text);

    _addItemInputController.clear();
    _listKey.currentState!.insertItem(itemService.items.length - 1);
  }

  void _removeItem(ObjectId id) {
    Map<String, dynamic> result = itemService.removeItem(id);

    _listKey.currentState!.removeItem(
      result['index'],
      (BuildContext context, Animation<double> animation) => ItemTile(
        item: result['item'],
        animation: animation,
        removeItem: (_) {},
        toggleItemCompleted: (_, __) {},
      ),
    );
  }

  void _toggleItemCompleted(ObjectId id, bool state) {
    itemService.toggleItemCompleted(id, state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: AnimatedItemList(
                listKey: _listKey,
                items: itemService.items,
                toggleItemCompleted: _toggleItemCompleted,
                removeItem: _removeItem,
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 40, 42, 54),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ItemInput(controller: _addItemInputController),
                    ),
                    const SizedBox(width: 10),
                    AddItemButton(onPress: _addItem),
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
