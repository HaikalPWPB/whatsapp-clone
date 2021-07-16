import 'package:flutter/material.dart';

class CallPage extends StatelessWidget {
  const CallPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> items = List.generate(5, (item) => '$item');

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
              subtitle: Row(
                children: [
                  Icon(Icons.call_missed, color: Colors.red,),
                  Text('3 minutes ago')
                ],
              ),
              trailing: Icon(Icons.call)
            ),
            Divider()
          ],
        );
      },
    );
  }
}