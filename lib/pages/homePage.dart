import 'package:flutter/material.dart';
import './orderListPage.dart';

class StokkaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(title: new Text("Stokka - Want some stock Bro?")),
        body: new Center(
          child: new RaisedButton(
              child: new Text("Orders"),
              onPressed: () => Navigator.push(context, new OrderListPage())),
        ),
      );
}
