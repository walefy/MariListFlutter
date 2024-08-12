import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:todo_list_app/entities/item.dart';
import 'package:todo_list_app/models/item_model.dart';
import 'package:todo_list_app/pages/home/home_view.dart';
import 'package:todo_list_app/pages/widgets/item_tile.dart';

class HomeViewController extends StatefulWidget {
  final ItemModel itemModel;

  const HomeViewController({super.key, required this.itemModel});

  @override
  State<HomeViewController> createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {
  late final TextEditingController _addItemInputController;
  late final List<Item> _items;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  void initState() {
    _addItemInputController = TextEditingController();
    _items = widget.itemModel.findAll();
    super.initState();
  }

  @override
  void dispose() {
    _addItemInputController.dispose();
    super.dispose();
  }

  void _addItem() {
    if (_addItemInputController.text.isEmpty) return;

    setState(() {
      Item item = widget.itemModel.create(_addItemInputController.text);
      _items.add(item);
      _addItemInputController.clear();
      _listKey.currentState!.insertItem(_items.length - 1);
    });
  }

  void _removeItem(ObjectId id) {
    setState(() {
      int index = _items.indexWhere((e) => e.id == id);
      Item item = _items.removeAt(index);
      Item itemFreezed = item.freeze();
      widget.itemModel.delete(item);

      _listKey.currentState!.removeItem(
        index,
        (BuildContext context, Animation<double> animation) => ItemTile(
          item: itemFreezed,
          animation: animation,
          removeItem: (_) {},
          toggleItemCompleted: (_, __) {},
        ),
      );
    });
  }

  void _toggleItemCompleted(ObjectId id, bool state) {
    setState(() {
      Item item = _items.firstWhere((e) => e.id == id);
      widget.itemModel.updateIsChecked(item, state);
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(
      toggleItemCompleted: _toggleItemCompleted,
      removeItem: _removeItem,
      addItem: _addItem,
      listKey: _listKey,
      items: _items,
      itemInputController: _addItemInputController,
    );
  }
}
