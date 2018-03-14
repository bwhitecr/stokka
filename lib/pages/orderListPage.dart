import 'package:flutter/material.dart';
import '../ordering/order.dart';
import './orderPage.dart';

class OrderListPage extends MaterialPageRoute<Null> {
  OrderListPage()
      : super(builder: (BuildContext context) => new _OrderListPageWidget());
}

class _OrderListPageWidget extends StatefulWidget {
  @override
  _OrderListDetailState createState() => new _OrderListDetailState();
}

class _OrderListDetailState extends State<_OrderListPageWidget> {
  List<Order> _orders = new List<Order>();

  void _addOrder(String description) {
    setState(() {
      String orderName = description;
      if (orderName.length == 0) {
        orderName = "Order " + (_orders.length + 1).toString();
      }
      _orders.add(
          new Order(orderNumber: _orders.length + 1, description: orderName));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stokka - Orders"),
      ),
      body: new Center(
        child: new ListView.builder(
            itemCount: _orders.length,
            itemBuilder: (context, index) {
              return new Card(
                child: new ListTile(
                  subtitle: new Text(_orders[index].orderNumber.toString()),
                  title: new Text(_orders[index].description),
                  onTap: () =>
                      Navigator.push(context, new OrderPage(_orders[index])),
                ),
                elevation: 2.0,
              );
            },
          ),
        ),
      
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _addOrder(""),
        tooltip: 'New Order',
        child: new Icon(Icons.add),
      ),
    );
  }
}
