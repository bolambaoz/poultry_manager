import 'package:flutter/material.dart';
import 'package:poultry_to_list/pages/home_page.dart';
import 'package:poultry_to_list/views/dialog_builder.dart';
import 'package:poultry_to_list/views/poultry_list.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

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
            PoultryList(
              controller1: myController1,
              controller2: myController2,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                if (myController1.text == dotenv.env["USERNAME"] &&
                    myController2.text == dotenv.env["PASSWORD"]) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("Incorrect Input"),
                          // "${myController1.text} :: ${dotenv.env["USERNAME"]}"),
                        );
                      });
                }
                //_dialogBuilder(context);
              },
              child: Text('Login'),
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
