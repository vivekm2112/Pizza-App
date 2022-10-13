import 'package:flutter/foundation.dart';

class PizzaModel {
  final String? pizzaCategory;
  final String? pizzaCrust;
  final String? pizzaSize;
  final int? pizzaPrice;
  int pizzaTotalPrice = 0;

  // var pizzaOrderList = [];

  // PizzaModel(
  //     this.pizzaCategory, this.pizzaCrust, this.pizzaSize, this.pizzaPrice) {
  //   bool elementFound = false;
  //   pizzaTotalPrice += pizzaPrice!;
  // for (int i = 0; i < pizzaOrderList.length; i++) {
  //   if (pizzaOrderList[i]['category'] == pizzaCategory &&
  //       pizzaOrderList[i]['crust'] == pizzaCrust &&
  //       pizzaOrderList[i]['size'] == pizzaSize) {
  //     pizzaOrderList[i]['price'] += pizzaPrice;
  //     pizzaOrderList[i]['count'] += 1;
  //     elementFound = true;
  //   }
  // }
  // if (!elementFound) {
  //   pizzaOrderList.add({
  //     'category': pizzaCategory,
  //     'crust': pizzaCrust,
  //     'size': pizzaSize,
  //     'price': pizzaPrice,
  //     'count': 1
  //   });
  // }
  // print(pizzaOrderList);
  // }
  PizzaModel(
      {@required this.pizzaCategory,
      @required this.pizzaCrust,
      @required this.pizzaSize,
      @required this.pizzaPrice});
}
