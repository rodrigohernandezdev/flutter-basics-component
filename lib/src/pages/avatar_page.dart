import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://www.techmasters.co.zm/imgs/avatar.png'),
              radius: 30.0,
            ),
            padding: EdgeInsets.all(5.0),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('RH'),
              backgroundColor: Colors.brown,
            )
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://www.w3schools.com/howto/img_avatar.png'),
          fadeInDuration: Duration(milliseconds: 200)
        ),
          
      ),
    );
  }
}