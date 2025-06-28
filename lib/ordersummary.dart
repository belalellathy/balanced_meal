import 'package:balanced_meal/API/api_service.dart';
import 'package:balanced_meal/cards/food_summary.dart';
import 'package:balanced_meal/providers/order_provide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Ordersummary extends StatefulWidget {
  const Ordersummary({super.key});

  @override
  State<Ordersummary> createState() => _OrdersummaryState();
}

class _OrdersummaryState extends State<Ordersummary> {
  @override
  Widget build(BuildContext context) {
    double total_calories = ModalRoute.of(context)!.settings.arguments as double;
    //double total_calories = 2000; // Example value, replace with actual logic
   OrderProvider orderprovider = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Summary"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: orderprovider.orderedfood.length,
              itemBuilder: (context, index) {
                return FoodSummary(index: index,);
              },
            ),
          ),
           Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Price:"),
                        Text(" ${orderprovider.totalPrice} EGP", style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFFF25700)
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Calories:"),
                        Text("${orderprovider.gained_cal} cal out of ${total_calories.toStringAsFixed(0)} cal", style: TextStyle(
                          fontWeight: FontWeight.w500,))
                      ],
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () async {
                        await sendOrder(orderprovider);
                        //orderprovider.addToOrder(FoodModel)
                       
                        setState(() {
                          
                        });
                        // Handle order creation logic here
                      },
                      child: Text("Confirm",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orderprovider.gained_cal >= (10/100) * total_calories ? Color(0xFFF25700) : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),))
                  ],
                ),
              )
        ],
      ),
    );
  }
}