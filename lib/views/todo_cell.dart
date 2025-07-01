import 'package:flutter/material.dart';

class TodoCell extends StatelessWidget {
  const TodoCell({super.key, required this.day});

  final String day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.amberAccent, borderRadius: BorderRadius.circular(12)),
        child: Text(day),
      ),
    );
  }
}
