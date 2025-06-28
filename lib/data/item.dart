class Item {
  String? name;
  int? totalPrice;
  int? quantity;

  Item({this.name, this.totalPrice, this.quantity});
  Map<String, dynamic> toJson() => {
    'name': name,
    'total_price': totalPrice,
    'quantity': quantity,
  };
}
