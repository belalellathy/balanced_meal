import 'item.dart';

class Data {
  List<Item>? items;

  Data({this.items});

  

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
