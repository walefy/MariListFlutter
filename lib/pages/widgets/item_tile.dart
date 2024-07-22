import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:realm/realm.dart';
import 'package:todo_list_app/entities/item.dart';

class ItemTile extends StatefulWidget {
  final Item item;
  final Animation<double> animation;
  final void Function(ObjectId id, bool state) toggleItemCompleted;
  final void Function(ObjectId id) removeItem;

  const ItemTile({
    super.key,
    required this.item,
    required this.toggleItemCompleted,
    required this.removeItem,
    required this.animation,
  });

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  bool visible = true;

  void handleRemoveItem() {
    widget.removeItem(widget.item.id);
  }

  void handleCheckItem(bool state) {
    widget.toggleItemCompleted(widget.item.id, state);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: widget.animation,
      child: ListTile(
        key: ValueKey(widget.item.id),
        tileColor: const Color.fromARGB(255, 68, 71, 90),
        textColor: const Color.fromARGB(255, 139, 233, 253),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        leading: GestureDetector(
          onTap: handleRemoveItem,
          child: const Icon(CupertinoIcons.trash, color: Colors.red, size: 20),
        ),
        title: Text(widget.item.value),
        trailing: MSHCheckbox(
          value: widget.item.isChecked,
          onChanged: handleCheckItem,
          size: 25,
          style: MSHCheckboxStyle.fillScaleColor,
          colorConfig: MSHColorConfig(
            borderColor: (_) => const Color.fromARGB(255, 10, 190, 83),
            checkColor: (_) => Colors.white,
            fillColor: (_) => const Color.fromARGB(255, 10, 190, 83),
          ),
        ),
      ),
    );
  }
}
