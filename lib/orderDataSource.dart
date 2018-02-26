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
    var cells = new List<DataCell>();
    cells.add(new DataCell(new Text('${product.productCode}')));
    cells.add(new DataCell(new Text('${product.quantityOrdered}')));

    var row = new DataRow(
      cells: cells
    );
    return row;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _order.orderedLines.length;

  @override
  int get selectedRowCount => 0;

}