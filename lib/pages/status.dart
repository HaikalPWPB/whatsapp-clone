import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  StatusPage({Key? key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  List<String> items = List.generate(3, (item) => '$item');

  _listStatus() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            ListTile(
              leading: Icon(Icons.image_rounded),
              title: Text('Status Saya'),
              subtitle: Text('Today 8:00 PM'),
              trailing: Icon(Icons.more_horiz)
            ),
            Divider()
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
       child: Column(
         children: [
           ListTile(
            leading: Icon(Icons.image_rounded),
            title: Text('Status Saya'),
            subtitle: Text('Today 8:00 PM'),
            trailing: Icon(Icons.more_horiz)
          ),
          Container(
            width: size.width,
            color: Color(0xffede9e8),
            padding: EdgeInsets.only(left: 10, top: 2, bottom: 2),
            child: Text('Recent Updates', style: TextStyle(color: Color(0xff075e54)))
          ),
          _listStatus()
         ],
       ),
    );
  }
}