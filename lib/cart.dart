import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    final orderList = [
      // {
      //   'category': "Veg",
      //   'crust': "Hand-Tossed",
      //   'size': "Regular",
      //   'price': 130,
      //   'count': 2
      // },
      // {
      //   'category': "Non-Veg",
      //   'crust': "Hand-Tossed",
      //   'size': "Regular",
      //   'price': 130,
      //   'count': 1
      // },
      // {
      //   'category': "Veg",
      //   'crust': "Hand-Tossed",
      //   'size': "Large",
      //   'price': 390,
      //   'count': 1
      // },
      // {
      //   'category': "Veg",
      //   'crust': "Cheese-Burst",
      //   'size': "Large",
      //   'price': 490,
      //   'count': 1
      // },
      // {
      //   'category': "Veg",
      //   'crust': "Hand-Tossed",
      //   'size': "Regular",
      //   'price': 130,
      //   'count': 2
      // },
      // {
      //   'category': "Non-Veg",
      //   'crust': "Hand-Tossed",
      //   'size': "Regular",
      //   'price': 130,
      //   'count': 1
      // },
      // {
      //   'category': "Veg",
      //   'crust': "Hand-Tossed",
      //   'size': "Large",
      //   'price': 390,
      //   'count': 1
      // },
      // {
      //   'category': "Veg",
      //   'crust': "Cheese-Burst",
      //   'size': "Large",
      //   'price': 490,
      //   'count': 1
      // },
      // {
      //   'category': "Veg",
      //   'crust': "Hand-Tossed",
      //   'size': "Regular",
      //   'price': 130,
      //   'count': 2
      // },
      // {
      //   'category': "Non-Veg",
      //   'crust': "Hand-Tossed",
      //   'size': "Regular",
      //   'price': 130,
      //   'count': 1
      // },
      // {
      //   'category': "Veg",
      //   'crust': "Hand-Tossed",
      //   'size': "Large",
      //   'price': 390,
      //   'count': 1
      // },
      // {
      //   'category': "Veg",
      //   'crust': "Cheese-Burst",
      //   'size': "Large",
      //   'price': 490,
      //   'count': 1
      // },
      // {
      //   'category': "Veg",
      //   'crust': "Hand-Tossed",
      //   'size': "Regular",
      //   'price': 130,
      //   'count': 2
      // },
      // {
      //   'category': "Non-Veg",
      //   'crust': "Hand-Tossed",
      //   'size': "Regular",
      //   'price': 130,
      //   'count': 1
      // },
      // {
      //   'category': "Veg",
      //   'crust': "Hand-Tossed",
      //   'size': "Large",
      //   'price': 390,
      //   'count': 1
      // },
      // {
      //   'category': "Veg",
      //   'crust': "Cheese-Burst",
      //   'size': "Large",
      //   'price': 490,
      //   'count': 1
      // }
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        // Back button
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        // "Cart" text
        title: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mediaQueryWidth * 0.0,
          ),
          child: const Text(
            'Cart',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: orderList.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/order-delivery.png",
                        height: mediaQueryHeight * 0.1,
                        color: Colors.grey.shade300,
                      ),
                      Text(
                        "No Orders yet",
                        style: TextStyle(
                          color: Colors.grey.shade300,
                        ),
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: ListView.builder(
                      itemCount: orderList.length,
                      itemBuilder: (ctxt, index) {
                        return Card(
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/pizza.png",
                              height: mediaQueryHeight * 0.2,
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  orderList[index]['crust'].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Image.asset(
                                    (orderList[index]['category'] == 'Veg')
                                        ? "assets/images/vegSign.png"
                                        : "assets/images/nonVegSign.png",
                                    height: mediaQueryHeight * 0.02)
                              ],
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(orderList[index]['size'].toString()),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Quantity: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(orderList[index]['count']
                                            .toString())
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                  "\u{20B9} ${orderList[index]['price'].toString()}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )),
    );
  }
}
