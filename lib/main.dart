import 'package:balanced_meal/cards/food_summary.dart';
import 'package:balanced_meal/create_order.dart';
import 'package:balanced_meal/ordersummary.dart';
import 'package:balanced_meal/providers/order_provide.dart';
import 'package:balanced_meal/userdetails_screen.dart';
import 'package:balanced_meal/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(ChangeNotifierProvider(
    create: (_) =>OrderProvider() ,
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        initialRoute: "welcome",
        debugShowCheckedModeBanner: false,
        routes: {
          "welcome": (context) => WelcomeScreen(),
          "userdetails": (context) => UserdetailsScreen(),
          "createorder": (context) => CreateOrder(),
          "ordersummary": (context) => Ordersummary(),
        },
      ),
    );
  }
}
