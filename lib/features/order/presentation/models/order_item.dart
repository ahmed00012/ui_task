// TODO Implement this library.
class OrderItem {
  final String name;
  final double price;
  int qtyGuest1;
  int qtyGuest2;

  OrderItem({
    required this.name,
    required this.price,
    this.qtyGuest1 = 0,
    this.qtyGuest2 = 0,
  });

  int get totalQty => qtyGuest1 + qtyGuest2;

  double get totalPrice => totalQty * price;
}
