import 'package:flutter/material.dart';
import 'package:poultry_to_list/pages/home_page.dart';
import 'package:poultry_to_list/views/dialog_builder.dart';
import 'package:poultry_to_list/views/poultry_list.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Text(
              "Poultry",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            PoultryList(),
            ElevatedButton(
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                //dialogBuilder(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Text('Create Batch'),
            ),
            Container(
              child: SizedBox(
                height: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
