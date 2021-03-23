import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _itemList(),
    );
  }

  Widget _itemList(){
    /* 
    menuProvider.loadData().then((options) {
      print(options);
    }); 
    */
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        print(snapshot.data);
        return ListView(
          children: _widgetList(snapshot.data, context),
        );
      },
    );


    /*
    return ListView(
      children: _widgetList(),
    );
    */
  }

  List<Widget> _widgetList(List<dynamic> data, BuildContext context){
    final List<Widget> opts = [];
    data.forEach((opt) {
      final widgetTmp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        onTap: (){
          /* final route = MaterialPageRoute(
            builder: (context) => AlertPage(),
          );
          Navigator.push(context, route); */
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opts.add(widgetTmp);
    });
    return opts;
  }
}