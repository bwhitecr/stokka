import 'package:flutter/material.dart';
import './orderPage.dart';

class StokkaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          title: new Text("Stokka - Want some stock Bro?")
          ),
        body: new Center(child: new FlatButton(
          child: new Text("Edit Order"),
          onPressed: () => 
            Navigator.push(context, new OrderPage())
          ),
        ),
      );
}
