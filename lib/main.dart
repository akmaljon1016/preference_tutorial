import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController txtController = TextEditingController();
  String? text = "";

  write(String txt) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("txt", txt);
  }

  read() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    text = await pref.getString("txt");
  }

  @override
  void initState() {
    super.initState();
    read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: txtController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Tekst kiriting...")),
            ),
          ),
          MaterialButton(
            onPressed: () {
              write(txtController.text);
            },
            child: Text("Saqlash"),
            color: Colors.orange,
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                read();
              });
            },
            child: Text("Oqish"),
            color: Colors.orange,
          ),
          SizedBox(
            height: 20,
          ),
          Text(text.toString())
        ],
      ),
    );
  }
}
