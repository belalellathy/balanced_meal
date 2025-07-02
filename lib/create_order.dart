import 'package:balanced_meal/cards/food_card.dart';
import 'package:balanced_meal/models/food_model.dart';
import 'package:balanced_meal/models/user_detils_model.dart';
import 'package:balanced_meal/providers/order_provide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateOrder extends StatefulWidget {
   CreateOrder({super.key});

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
   
   int total_price = 0;

   double total_calories = 0;

  @override
  Widget build(BuildContext context) {
    OrderProvider orderprovider=Provider.of<OrderProvider>(context);
    UserDetailsModel userDetails = ModalRoute.of(context)!.settings.arguments as UserDetailsModel;
    if(userDetails.gender=="Female"){
      total_calories=((655.1)+9.56*userDetails.weight+1.85*userDetails.height-4.68*userDetails.age);
    }
    else{
      total_calories=((666.47)+(13.75*userDetails.weight)+(5*userDetails.height)-(6.76*userDetails.age));


    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create your Order",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Vegetables",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              Container(
                height: MediaQuery.of(context).size.height * 0.285,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context, index) => FoodCard(foodModel: orderprovider.vegetables[index],),itemCount: orderprovider.vegetables.length, ),
              ),
              Text("Meat",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              Container(
                height: MediaQuery.of(context).size.height * 0.285,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context, index) => FoodCard(foodModel: orderprovider.meat[index],),itemCount: orderprovider.meat.length, ),
              ),
              SizedBox(height: 20,),
              Text( "Carbs",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              Container(
                height: MediaQuery.of(context).size.height * 0.285,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context, index) => FoodCard(foodModel: orderprovider.carbs[index],),itemCount: orderprovider.carbs.length, ),
              ),
              SizedBox(height: 20,),
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
                      onPressed: () {
                        if (orderprovider.gained_cal < (10/100) * total_calories) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("You need to add more food to your order!"),backgroundColor: Colors.red,)
                          );
                          
                          return;
                        }else{
                          Navigator.of(context).pushNamed("ordersummary",arguments: [total_calories,userDetails
                          ] );
                        }
                        
                        
                        setState(() {
                          
                        });
                       
                      },
                      child: Text("Place Order",
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
        ),
      )
    );
  }
}