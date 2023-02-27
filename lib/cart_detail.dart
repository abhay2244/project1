import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartDetail extends StatefulWidget {
  const CartDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  int? subTotal;
  int? choosenValue;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: callCartApi(),
      builder: (context, snapshot) {
        if (snapshot != null && snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFF1C40F),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  // height: 110,
                  padding: EdgeInsets.only(
                      top: 40.0, left: 30.0, right: 30.0, bottom: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Check out",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 5),
                      ),
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 26,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 470,
                          padding: EdgeInsets.only(top: 25),
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(bottom: 32),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE3E3E0),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.network(
                                          '${snapshot.data![index]['productImage']}'),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      height: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${snapshot.data![index]['productName']}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          Container(
                                            width: 100,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Quantity",
                                                  style: TextStyle(
                                                      color: Colors.black26,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                DropdownButton(
                                                  // isExpanded: true,
                                                  // style: TextStyle(fontSize: 16),
                                                  itemHeight: null,
                                                  icon: Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.black26,
                                                  ),
                                                  value: choosenValue,
                                                  items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9,].map<DropdownMenuItem<int>>( (int value) {
                                                    return DropdownMenuItem<int>(
                                                      child: Text(
                                                          value.toString()),
                                                      value: value,
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      choosenValue = value;
                                                    });
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                          Text(
                                              "\$${snapshot.data![index]['productPrice']}"),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.black26,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subtotal",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  Text(
                                    "\$230",
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 17),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Taxes",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  Text(
                                    "\$19",
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 17),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "\$",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFFF1C40F),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "249",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0xFFF1C40F),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed('/mainPage');
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 60,
                                    width: 180,
                                    child: Text(
                                      "Check Out",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF1C40F),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<List<dynamic>> callCartApi() async {
    http.Response response = await http.get(
        Uri.parse('https://630da107109c16b9abe9b070.mockapi.io/data/cart'));
    List<dynamic> resList = jsonDecode(response.body.toString());
    return resList;
  }
}

Widget ListOfCart() {
  return Container(
    padding: EdgeInsets.only(bottom: 32),
    child: Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Color(0xFFE3E3E0),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset('assets/images/fujiyama-beer-glass.png'),
        ),
        SizedBox(
          width: 40,
        ),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Aura Table Mirror",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Container(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity",
                      style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text("1"),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black26,
                    )
                  ],
                ),
              ),
              Text("\$89")
            ],
          ),
        )
      ],
    ),
  );
}
