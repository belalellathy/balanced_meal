import 'package:balanced_meal/providers/order_provide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodSummary extends StatelessWidget {
   FoodSummary({required this.index, super.key});
  int index;

  @override
  Widget build(BuildContext context) {
    OrderProvider orderprovider = Provider.of<OrderProvider>(context);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset(orderprovider.orderedfood[index].imagePath,fit: BoxFit.cover,),),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                Text(orderprovider.orderedfood[index].name),
                Text("${orderprovider.orderedfood[index].calories} cal"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("${orderprovider.orderedfood[index].price} EGP"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   InkWell(
              onTap: () {
                orderprovider.removeQuantity(orderprovider.orderedfood[index]);
                orderprovider.removetotal(orderprovider.orderedfood[index].price, orderprovider.orderedfood[index].calories);
              },
              child: Icon(Icons.remove_circle,color: Color(0xFFF25700),),
            ),
            Text("${orderprovider.orderedfood[index].quantity}"),
            InkWell(
              onTap: () { 
                orderprovider.addToOrder(orderprovider.orderedfood[index]);
                orderprovider.addtotal(orderprovider.orderedfood[index].price, orderprovider.orderedfood[index].calories);
                
              },
              child: Icon(Icons.add_circle,color: Color(0xFFF25700),),
            ),

                ],
              )
            ],),
           
            
            
        
          ],
        ),
      ),
      
    );
  }
}