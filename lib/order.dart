import './orderLineItem.dart';

class Order {
  int _lineId;
  int orderNumber;
  List<OrderLineItem> orderedLines;

  Order() {
    orderNumber = 1;
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

  String get description => 'Order: $orderNumber';
}