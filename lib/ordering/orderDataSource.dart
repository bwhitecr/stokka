import 'package:flutter/material.dart';
import './order.dart';
import './orderLineItem.dart';

class OrderDataSource extends DataTableSource {
  Order _order = new Order();

  OrderLineItem addRow(String productCode, num quantity) {
    var product = _order.orderProduct(productCode, quantity);
    this.notifyListeners();
    return product;
  }

  @override
  DataRow getRow(int index) {
    var product = _order.orderedLines[index];

    var row = new DataRow(cells: [
      new DataCell(new Text('${product.productCode}')),
      new DataCell(new Text('${product.quantityOrdered}'))
    ]);
    return row;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _order.orderedLines.length;

  @override
  int get selectedRowCount => 0;

  String get description => _order.description;
}
