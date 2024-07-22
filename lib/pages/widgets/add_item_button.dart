import 'package:flutter/material.dart';

class AddItemButton extends StatelessWidget {
  final void Function()? onPress;

  const AddItemButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPress,
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.all(14),
        backgroundColor: const Color.fromARGB(255, 10, 190, 83),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      child: const Icon(Icons.add),
    );
  }
}
