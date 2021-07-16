import 'package:flutter/material.dart';
import 'package:whatsapp/pages/call.dart';
import 'package:whatsapp/pages/message.dart';
import 'package:whatsapp/pages/status.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DefaultTabController(
    length: 3,
    child: MyApp(),
  )));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  _dropDownMenu() {
    return DropdownButton<String>(
      icon: const Icon(Icons.more_vert, color: Colors.white),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (String? newValue) {
        setState(() {
          // 'dropdownValue' = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp', style: TextStyle(fontSize: 20),),
        backgroundColor: Color(0xff075e54),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 10),
                _dropDownMenu()
              ],
            ),
          )
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            // Tab(icon: Icon(Icons.camera)),
            Tab(text: 'Pesan'),
            Tab(text: 'Status'),
            Tab(text: 'Panggilan',)
          ],
        ),
      ),
      body: TabBarView(
        children: [
          // Icon(Icons.camera),
          MessagePage(),
          StatusPage(),
          CallPage()
        ],
      ),
    );
  }
}