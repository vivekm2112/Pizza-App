import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/model.dart';
import 'package:pizza_app/cart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // screen height and width
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mediaQueryWidth * 0.025,
          ),
          child: const Text(
            'Pizza App',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: <Widget>[

          // Order Page Icon
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mediaQueryWidth * 0.025,
            ),
            child: Badge(
              badgeContent: const Text(
                "5",
                style: TextStyle(color: Colors.white),
              ),
              position: BadgePosition(
                  top: mediaQueryHeight * 0.002, start: mediaQueryWidth * 0.07),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Cart(),
                        ));
                  },
                  icon: const Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.black,
                  )),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      
      //Order Now button
      bottomNavigationBar: InkWell(
        onTap: () {

          // for making an order
          // Section where you give details of the order
          showModalBottomSheet<void>(
              context: context,
              // elevation: 1,
              builder: (BuildContext ctxt) {
                return Wrap(
                  children: <Widget>[OrderNow()],
                );
              });
        },
        child: Container(
          // width: mediaQueryWidth * 0.4,
          height: mediaQueryHeight * 0.075,
          decoration: const BoxDecoration(
            color: Colors.red,
            // borderRadius: BorderRadius.circular(15)
          ),
          child: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQueryWidth * 0.025,
                vertical: mediaQueryHeight * 0.01),
            child: const Text(
              "ORDER   NOW",
              style: TextStyle(
                  fontSize: 20, letterSpacing: 1.5, color: Colors.white),
            ),
          )),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: mediaQueryHeight * 0.02,
              ),

              // Pizza Image
              Center(
                child: Image.asset(
                  "assets/images/pizza.png",
                  height: mediaQueryHeight * 0.4,
                ),
              ),
              SizedBox(
                height: mediaQueryHeight * 0.02,
              ),

              // Pizza Text
              const Text(
                'Custom Pizza',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: mediaQueryHeight * 0.02,
              ),

              // Pizza Description
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mediaQueryWidth * 0.05,
                ),
                child: const Text(
                  'A large disc of dough, covered with tomato paste, then either'
                  'only grated cheese or pieces of mozzarella cheese, or other'
                  ' toppings like chopped vegetables, sausages, salami, etc. and '
                  'cheese, which is then baked together in a very hot oven, then '
                  'cut into slices so that one can eat it conveniently by taking '
                  'one wedge-shaped slice at a time. ',
                  textAlign: TextAlign.justify,
                  style:
                      TextStyle(color: Colors.black, fontStyle: FontStyle.italic
                          // fontSize: 25,
                          // letterSpacing: 1.2,
                          // fontWeight: FontWeight.w800,
                          ),
                ),
              ),
              SizedBox(
                height: mediaQueryHeight * 0.09,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// For making order and giving pizza details

class OrderNow extends StatefulWidget {
  OrderNow({Key? key}) : super(key: key);

  final List<PizzaModel> orderList = [];

  @override
  State<OrderNow> createState() => _OrderNowState();
}

class _OrderNowState extends State<OrderNow> {
  String? _pizzaCategory;
  String? _pizzaCrust;
  String? _pizzaSize;
  var _pizzaPrice = 0;

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    // To determine pizza price on the basis of the details provided
    if (_pizzaCategory != null && _pizzaCrust != null && _pizzaSize != null) {
      setState(() {
        _pizzaPrice = 0;
      });
      if (_pizzaCrust == 'Cheese Burst') {
        setState(() {
          _pizzaPrice += 100;
        });
      }
      if (_pizzaCategory == 'Non-Veg') {
        setState(() {
          _pizzaPrice += 150;
        });
      }
      if (_pizzaSize == 'Regular') {
        setState(() {
          _pizzaPrice += 130;
        });
      } else if (_pizzaSize == 'Large') {
        setState(() {
          _pizzaPrice += 390;
        });
      } else {
        setState(() {
          _pizzaPrice += 260;
        });
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: <Widget>[

                // Drop down menu for selecting pizza category
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: mediaQueryWidth * 0.025),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Category:",
                        style: TextStyle(fontSize: 18),
                      ),
                      DropdownButton<String>(
                        alignment: Alignment.topRight,
                        focusColor: Colors.black,
                        value: _pizzaCategory,
                        //elevation: 5,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        iconEnabledColor: Colors.black,
                        items: <String>['Veg', 'Non-Veg']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        }).toList(),
                        hint: const Text("Select Category",
                            style: TextStyle(fontSize: 18)),
                        onChanged: (String? value) {
                          setState(() {
                            _pizzaCategory = value;
                            print(_pizzaCategory);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                
                // Drop down menu for selecting pizza crust
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: mediaQueryWidth * 0.025),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Crust:",
                        style: TextStyle(fontSize: 18),
                      ),
                      DropdownButton<String>(
                        alignment: Alignment.topRight,
                        focusColor: Colors.black,
                        value: _pizzaCrust,
                        //elevation: 5,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        iconEnabledColor: Colors.black,
                        items: <String>['Hand-Tossed', 'Cheese Burst']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: const TextStyle(fontSize: 18)),
                          );
                        }).toList(),
                        hint: const Text("Select Crust",
                            style: TextStyle(fontSize: 18)),
                        onChanged: (String? value) {
                          setState(() {
                            _pizzaCrust = value;
                            print(_pizzaCrust);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                
                // Drop down menu for selecting pizza size
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: mediaQueryWidth * 0.025),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Size:",
                        style: TextStyle(fontSize: 18),
                      ),
                      DropdownButton<String>(
                        alignment: Alignment.topRight,
                        focusColor: Colors.black,
                        value: _pizzaSize,
                        //elevation: 5,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        iconEnabledColor: Colors.black,
                        items: <String>['Regular', 'Medium', 'Large']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: const TextStyle(fontSize: 18)),
                          );
                        }).toList(),
                        hint: const Text("Select Size",
                            style: TextStyle(fontSize: 18)),
                        onChanged: (String? value) {
                          setState(() {
                            _pizzaSize = value;
                            print(_pizzaSize);
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mediaQueryWidth * 0.03,
                  vertical: mediaQueryHeight * 0.01),
              child: 

              // TO show pizza price
                Text(
                    "\u{20B9} $_pizzaPrice",
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),

            // "Add to cart" button
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mediaQueryWidth * 0.03,
                  vertical: mediaQueryHeight * 0.02),
              child: InkWell(
                onTap: () {
                  if (_pizzaCategory != null &&
                      _pizzaCrust != null &&
                      _pizzaSize != null) {
                    final newOrder = PizzaModel(
                        pizzaCategory: _pizzaCategory,
                        pizzaSize: _pizzaSize,
                        pizzaCrust: _pizzaCrust,
                        pizzaPrice: _pizzaPrice);

                    setState(() {
                      OrderNow().orderList.add(newOrder);
                    });
                    print(OrderNow().orderList);
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: mediaQueryWidth * 0.35,
                  height: mediaQueryHeight * 0.06,
                  decoration: BoxDecoration(
                      color: (_pizzaCategory != null &&
                              _pizzaCrust != null &&
                              _pizzaSize != null)
                          ? Colors.red
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryWidth * 0.015,
                        vertical: mediaQueryHeight * 0.005),
                    child: const Text(
                      "Add to cart",
                      style: TextStyle(
                          fontSize: 20,
                          // letterSpacing: 1.5,
                          color: Colors.white),
                    ),
                  )),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
