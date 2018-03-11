import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:barcode_scan/barcode_scan.dart';

import '../ordering/order.dart';
import '../ordering/OrderDataSource.dart';

class OrderPage extends MaterialPageRoute<Order> {
  OrderPage(Order order)
      : super(builder: (BuildContext context) => new _OrderPageWidget(order));
}

class _OrderPageWidget extends StatefulWidget {
  final Order order;

  _OrderPageWidget(this.order);

  @override
  _OrderDetailState createState() => new _OrderDetailState(order);
}

class _OrderDetailState extends State<_OrderPageWidget> {
  int _counter = 10000;
  Random _random = new Random(654);
  OrderDataSource _dataSource;

  _OrderDetailState(Order order) {
    _dataSource = new OrderDataSource(order);
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      var productCode = '$_counter';
      var quantity = (_random.nextDouble() * 10).floor() + 1;
      _addProduct(productCode, quantity);
    });
  }

  void _addProduct(String productCode, num quantity) {
    var p = _dataSource.addRow(productCode, quantity);
      print('Ordered product ${p.productCode}');
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => _addProduct(barcode, 1));
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
          print('The user did not grant the camera permission!');
      } else {
        print('Unknown error: $e');
      }
    } on FormatException{
      print('null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      print('Unknown error: $e');
    }
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
              key: new Key('add'),
              onPressed: _incrementCounter,
              tooltip: 'Add product',
              child: new Icon(Icons.add),
              heroTag: null,
            ),
            new FloatingActionButton(
              key: new Key('scan'),
              onPressed: scan,
              tooltip: 'Scan',
              child: new Icon(Icons.scanner),
              heroTag: null,
            )
          ],
        ),
      ),
    );
  }
}
