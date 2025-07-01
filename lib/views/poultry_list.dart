import 'package:flutter/material.dart';

class PoultryList extends StatelessWidget {
  const PoultryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.yellow[200],
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
