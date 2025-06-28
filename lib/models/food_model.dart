class FoodModel {
  String name;
  String imagePath;
  int price;
  int calories;
  int quantity = 0;

  FoodModel({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.calories,
    this.quantity = 0,
  });
  static List<FoodModel> getVegetables() {
    return [
      FoodModel(
        name: "Pepper",
        imagePath: "assets/images/Bell_Pepper.png",
        price: 12,
        calories: 12,
        quantity: 0,
      ),
      FoodModel(
        name: "Carrot",
        imagePath: "assets/images/Carrot.png",
        price: 12,
        calories: 12,
        quantity: 0,
      ),
    ];
  }
  static List<FoodModel> getMeat() {
    return [
      FoodModel(
        name: "Lean Beef",
        imagePath: "assets/images/Lean_Beef.png",
        price: 12,
        calories: 12,
        quantity: 0,
      ),
      FoodModel(
        name: "salmon",
        imagePath: "assets/images/Salmon.png",
        price: 12,
        calories: 12,
        quantity: 0,
      ),
    ];
  }
  static List<FoodModel> getCarbs() {
    return [
      FoodModel(
        name: "Sweet Corn",
        imagePath: "assets/images/Sweet_Corn.png",
        price: 12,
        calories: 12,
        quantity: 0,
      ),
      FoodModel(
        name: "Brown Rice",
        imagePath: "assets/images/Brown_Rice.png",
        price: 12,
        calories: 12,
        quantity: 0,
      ),
    ];
  }


}
