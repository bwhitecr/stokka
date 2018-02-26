import './orderLineItem.dart';

class Order {
  num _lineId;
  num orderNumber;
  List<OrderLineItem> orderedLines;

  Order() {
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