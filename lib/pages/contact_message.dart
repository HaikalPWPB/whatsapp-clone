import 'package:flutter/material.dart';

class ContactMessagePage extends StatefulWidget {
  const ContactMessagePage({ Key? key }) : super(key: key);

  @override
  _ContactMessagePageState createState() => _ContactMessagePageState();
}

class _ContactMessagePageState extends State<ContactMessagePage> {
  final _messageController = TextEditingController();
  bool _isMessageFormFilled = false;

  _sendMessage(String type) {
    switch(type) {
      case 'text':
        return Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xff075e54),
            borderRadius: BorderRadius.circular(100)
          ),
          child: InkWell(
            child: Icon(Icons.send, color: Colors.white,),
        )
      );
      case 'voice':
      return Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xff075e54),
            borderRadius: BorderRadius.circular(100)
          ),
          child: InkWell(
            child: Icon(Icons.mic, color: Colors.white,),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: DefaultTextStyle(
          style: TextStyle(color: Colors.white),
          child: InkWell(
            child: ListTile(
              leading: Icon(Icons.image_rounded),
              title: Text('Username'),
              subtitle: Text('Message'),
            ),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => ContactMessagePage())
              );
            },
          ),
        ),
        leading: InkWell(
          child: Icon(Icons.arrow_back, color: Colors.white),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                Icon(Icons.call),
                SizedBox(width: 10),
                Icon(Icons.more_vert)
              ],
            ),
          )
        ],
        backgroundColor: Color(0xff075e54),
      ),
      body: SingleChildScrollView(
        child: Column(
          // Container()
        ),
      ),
      bottomNavigationBar: Container(
        width: size.width,
        margin: EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.emoji_emotions),
                  suffixIcon: Icon(Icons.attachment),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100)
                  )
                ),
                onChanged: (value) {
                  if(value.length > 0) {
                    setState(() {
                      _isMessageFormFilled = true;
                    });
                  }else {
                    setState(() {
                      _isMessageFormFilled = false;
                    });
                  }
                } ,
              ),
            ),
            SizedBox(width:4),
            _isMessageFormFilled ? _sendMessage('text') : _sendMessage('voice')
          ],
        ),
      ),
    );
  }
}