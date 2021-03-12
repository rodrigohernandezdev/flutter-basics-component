import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final options = ['One', 'Two', 'Three', 'Four', 'Five', 'Six'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: ListView(
        children: _mapList(),
      ),
    );
  }

  List<Widget> _generateList() {
    List<Widget> list = [];
    for (var opt in options) {
      final tmpW = ListTile(
        title: Text(opt),
      );
      list..add(tmpW)
          ..add(Divider());
    }
    return list;
  }

  List<Widget> _mapList() {
    return options.map( (e) {
      return Column(
        children: [
          ListTile(
            title: Text(e+"!"),
            subtitle: Text('SubTitle'),
            leading: Icon(Icons.camera),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}