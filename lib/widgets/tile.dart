import 'package:flutter/material.dart';

class AlarmTile extends StatelessWidget {
  const AlarmTile({
    required this.title,
    required this.onPressed,
    super.key,
    this.onDismissed,
  });

  final String title;
  final void Function() onPressed;
  final void Function()? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Dismissible(
        key: key!,
        direction: onDismissed != null
            ? DismissDirection.endToStart
            : DismissDirection.none,
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 30),
          child: const Icon(
            Icons.delete,
            size: 30,
            color: Colors.white,
          ),
        ),
        onDismissed: (_) => onDismissed?.call(),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            height: 100,
            padding: const EdgeInsets.all(35),
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_right_rounded, size: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
