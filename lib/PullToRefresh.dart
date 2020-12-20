import 'dart:async';

import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.purple,
//       ),
//       home: new PullToRefresh(),
//     );
//   }
// }

class PullToRefresh extends StatefulWidget {
  @override
  _PullToRefresh createState() => new _PullToRefresh();
}

class _PullToRefresh extends State<PullToRefresh> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      child: new ListView(
        children: _getItems(),
      ),
      onRefresh: _handleRefresh,
    );
  }

  List<Widget> _getItems() {
    var items = <Widget>[];
    for (int i = _count; i < _count + 4; i++) {
      var item = new Column(
        children: <Widget>[
          new ListTile(
            title: new Text("Item $i"),
          ),
          new Divider(
            height: 2.0,
          )
        ],
      );

      items.add(item);
    }
    return items;
  }

  Future<Null> _handleRefresh() async {
    await new Future.delayed(new Duration(seconds: 2));

    setState(() {
      _count += 5;
    });

    return null;
  }
}
