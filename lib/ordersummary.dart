import 'package:balanced_meal/API/api_service.dart';
import 'package:balanced_meal/cards/food_summary.dart';
import 'package:balanced_meal/models/user_detils_model.dart';
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
    List<dynamic> args = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    double total_calories = args[0] as double;
    UserDetailsModel userDetails = args[1] as UserDetailsModel;
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
                        if (orderprovider.gained_cal < (10/100) * total_calories) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("You need to add more food to your order!"))
                          );
                          
                          return;
                        }else{

                          bool success = await sendOrder(orderprovider);
                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Order placed successfully!"))
                              );
                              // Clear the order
                              orderprovider.clearOrder();
                              Navigator.of(context).pushReplacementNamed("createorder",arguments: userDetails);

                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Failed to place order. Please try again."),backgroundColor: Colors.red,)
                              );
                            }

                          
                           
                           

                          
                        }

                        //orderprovider.addToOrder(FoodModel)
                       
                        setState(() {
                          
                        });
                        
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