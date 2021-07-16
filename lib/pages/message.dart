import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:whatsapp/pages/contact_message.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<String> items = List.generate(10, (item) => '$item');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            InkWell(
              child: ListTile(
                leading: Icon(Icons.image_rounded),
                title: Text('Username'),
                subtitle: Text('Message'),
                trailing: Column(
                  children: [
                    Text('10:00 PM'),
                    Badge(
                      badgeContent: Text('3', style: TextStyle(color: Colors.white),),
                      badgeColor: Colors.lightGreenAccent,
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => ContactMessagePage())
                );
              },
            ),
            Divider()
          ],
        );
      },
    );
  }
}