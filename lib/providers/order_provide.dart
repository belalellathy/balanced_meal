import 'package:balanced_meal/models/food_model.dart';
import 'package:flutter/foundation.dart';

class OrderProvider extends ChangeNotifier {
 int totalPrice=0;
  int gained_cal=0;
  List<FoodModel> vegetables = FoodModel.getVegetables();
  List<FoodModel> meat = FoodModel.getMeat();
  List<FoodModel> carbs = FoodModel.getCarbs();
  List<FoodModel> orderedfood = [
    
  ];

  void addtotal(int price, int cal){
    totalPrice+=price;
    gained_cal+=cal;
    notifyListeners();
  }
  void removetotal(int price, int cal){
    totalPrice-=price;
    gained_cal-=cal;
    notifyListeners();
  }

  void addToOrder(FoodModel food) {
    if (orderedfood.contains(food)) {
      orderedfood[orderedfood.indexOf(food)].quantity++;
     

    }else{
      orderedfood.add(food);
    }
    notifyListeners();
  }
  void removeQuantity(FoodModel food) {
    if (food.quantity > 0) {
      food.quantity--;
      if (food.quantity == 0) {
        orderedfood.remove(food);
      }
    }
    notifyListeners();
  }

  

}