import 'package:balanced_meal/models/food_model.dart';
import 'package:balanced_meal/providers/order_provide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatefulWidget {
   FoodCard({required this.foodModel, super.key});  

    FoodModel foodModel;
    static int gained_calories = 0;
  

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {

   
  @override
  Widget build(BuildContext context) {
     OrderProvider orderprovider=Provider.of<OrderProvider>(context);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        width: MediaQuery.of(context).size.width * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.18,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(widget.foodModel.imagePath,fit: BoxFit.cover,),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.foodModel.name,style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  
                ),),
                Text("${widget.foodModel.calories} cal",style: TextStyle(color: Color(0XFF959595)),),
              ],
            ),
            SizedBox(height: 10,),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${widget.foodModel.price} EGP",style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),),
                Container(
                  
                  child: widget.foodModel.quantity > 0 ? Row(
                    mainAxisSize:MainAxisSize.min ,
                    children: [

                    InkWell(
                      onTap: () { 
                        orderprovider.removeQuantity(widget.foodModel);
                       
                      orderprovider.removetotal(widget.foodModel.price, widget.foodModel.calories);
                        

                      setState(() {

                      });},
                      child: Icon(Icons.remove_circle,color: Color(0xFFF25700),)),
                    Text("${widget.foodModel.quantity}",style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),),
                    InkWell(
                      onTap: () { 
                        orderprovider.addToOrder(widget.foodModel);
                       // widget.foodModel.quantity++;
                      orderprovider.addtotal(widget.foodModel.price, widget.foodModel.calories);
                       print(widget.foodModel.quantity);
                       setState(() {
                        
                      });} ,
                      child: Icon(Icons.add_circle,color: Color(0xFFF25700),)),
                  ],):ElevatedButton(onPressed: () {
                    orderprovider.addToOrder(widget.foodModel);
                    widget.foodModel.quantity++;
                    orderprovider.addtotal(widget.foodModel.price, widget.foodModel.calories);
                    setState(() {});
                    print(widget.foodModel.quantity);
                  }, child: Text("Add",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF25700),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(29, 29),
                  
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}