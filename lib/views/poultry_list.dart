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
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: "User Name", border: OutlineInputBorder()),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                    hintText: "Password", border: OutlineInputBorder()),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
