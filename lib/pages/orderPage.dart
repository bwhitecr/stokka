import 'package:flutter/material.dart';
import 'dart:math';
import '../ordering/OrderDataSource.dart';

class OrderPage extends MaterialPageRoute<Null> {
  OrderPage()
      : super(builder: (BuildContext context) => new _OrderPageWidget());
}

class _OrderPageWidget extends StatefulWidget {
  @override
  _OrderDetailState createState() => new _OrderDetailState();
}

class _OrderDetailState extends State<_OrderPageWidget> {
  int _counter = 10000;
  Random _random = new Random(654);
  OrderDataSource _dataSource = new OrderDataSource();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      var productCode = '$_counter';
      var qty = (_random.nextDouble() * 10).floor() + 1;
      var p = _dataSource.addRow(productCode, qty);
      print('Ordered product ${p.productCode}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stokka - Edit Order"),
      ),
      body: new Center(
        child: new PaginatedDataTable(
          header: new Text(_dataSource.description),
          columns: [
            new DataColumn(
                label: new Text(
              'Product Code',
              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            )),
            new DataColumn(
                label: new Text('Quantity',
                    style: new TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold)),
                numeric: true)
          ],
          source: _dataSource,
          rowsPerPage: 6,
          actions: [
            new FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: new Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
