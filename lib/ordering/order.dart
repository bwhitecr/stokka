import './orderLineItem.dart';

class Order {
  int _lineId;
  int orderNumber;
  String description;
  List<OrderLineItem> orderedLines;

  Order({this.orderNumber, this.description}) {
    orderedLines = new List<OrderLineItem>();
    _lineId = 1;
  }

  OrderLineItem orderProduct(String productCode, num quantity) {
    var prod = new OrderLineItem();
    _lineId++;
    prod.id = _lineId;
    prod.productCode = productCode;
    prod.quantityOrdered = quantity;
    orderedLines.add(prod);
    return prod;
  }
}