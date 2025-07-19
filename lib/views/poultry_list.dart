import 'package:flutter/material.dart';

class PoultryList extends StatelessWidget {
  final TextEditingController controller1;
  final TextEditingController controller2;

  const PoultryList({
    super.key,
    required this.controller1,
    required this.controller2,
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
                controller: controller1,
                decoration: InputDecoration(
                    hintText: "User Name", border: OutlineInputBorder()),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              TextField(
                controller: controller2,
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
