import 'package:flutter/material.dart';

Future<void> dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Create Layer Batch'),
        backgroundColor: Colors.yellow,
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Number Of Heads"),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Chicken Bread"),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Price per Head"),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Number of Weeks"),
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge),
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge),
            child: const Text('Save'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
