import 'package:balanced_meal/providers/order_provide.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> sendOrder(OrderProvider orderprovider) async {
  final url = Uri.parse('https://your-api-endpoint.com/orders'); // Replace with your API URL

  final items = orderprovider.orderedfood.map((food) => {
    "name": food.name,
    "total_price": food.price * food.quantity,
    "quantity": food.quantity,
  }).toList();

  final body = jsonEncode({"items": items});

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: body,
  );

  if (response.statusCode == 200) {
    // Success logic
    print("Order sent successfully!");
  } else {
    // Error logic
    print("Failed to send order: ${response.body}");
  }
}