import 'package:flutter/material.dart';
import 'package:project1/cart_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductDetail extends StatefulWidget {
  String? imagePath;
  String? productName;
  String? id;
  String? productPrice;

  ProductDetail(
      {Key? key,
      required this.imagePath,
      required this.productName,
      required this.id,
      required this.productPrice})
      : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  List<dynamic> list1 = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(future: callProductApi(),builder: (context, snapshot) {
      if (snapshot != null && snapshot.hasData) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xFFE3E3E0),
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black26,
                )),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black26,
                  size: 26,
                ),
              )
            ],
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 70,
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all()
                    // ),
                    //
                    height: 270,
                    width: 270,
                    // child: Image.asset(
                    //   'assets/images/${widget.imagePath}',
                    //   fit: BoxFit.cover,
                    //   height: double.infinity,
                    //   width: double.infinity,
                    // ),
                    child: Image.network('${widget.imagePath}'),
                  ),
                  height: 325,
                  color: Color(0xFFE3E3E0),
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                top: 300,
                child: Container(
                  padding: EdgeInsets.only(left: 40, right: 40, top: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFE3E3E0),
                            offset: Offset(0, 0),
                            blurRadius: 2.0)
                      ]),
                  height: 330,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          widget.productName!,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "A good drink requires good presentation.\nInspired by Japan's tallest mountain Mt. Fuji,this unique glass is designed by Keita Suzuki...",
                          style: TextStyle(
                              color: Colors.black38, fontSize: 14, height: 1.5),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 65),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProductStyle(
                                image: snapshot.data![0]['productImage'],
                                color: Color(0xFFE3E3E0),
                                id: snapshot.data![0]['id'],
                                context: context,
                                productName: snapshot.data![0]['productName'],
                                productPrice: snapshot.data![0]['productPrice']
                            ),
                            ProductStyle(
                                image: snapshot.data![1]['productImage'],
                                color: Color(0xFFE3E3E0),
                                id: snapshot.data![1]['id'],
                                context: context,
                                productName: snapshot.data![1]['productName'],
                                productPrice: snapshot.data![0]['productPrice']
                            ),
                            ProductStyle(
                                image: snapshot.data![2]['productImage'],
                                color: Color(0xFFE3E3E0),
                                id: snapshot.data![2]['id'],
                                context: context,
                                productName: snapshot.data![2]['productName'],
                                productPrice: snapshot.data![0]['productPrice']

                            ),
                            ProductStyle(text: "More", color: Color(0xFFF1C40F)),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 610,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    AppBar().preferredSize.height -
                    610,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFF1C40F),
                      borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(40))),
                  padding: EdgeInsets.only(left: 40, right: 40),

                  child: FutureBuilder<bool>(future: callCartApi(),builder: (context, snapshot1) {
                    if(snapshot.hasData && snapshot != null && snapshot1.data == true){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "\$",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${widget.productPrice}",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return CartDetail();
                                },
                              ));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 180,
                              child: Text(
                                "Go TO Cart",
                                style: TextStyle(
                                    color: Color(0xFFF1C40F),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                        ],
                      );
                    }
                    else{
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "\$",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${widget.productPrice}",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              insertCartApi().then((value) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return CartDetail();
                                  },
                                )).then((value) {
                                  if(value==true){
                                    setState(() {});
                                  }
                                });
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 180,
                              child: Text(
                                "Add To Cart",
                                style: TextStyle(
                                    color: Color(0xFFF1C40F),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                        ],
                      );
                    }
                  },),
                ),
              ),
            ],
          ),
        );
      } else{
       return Center(child: CircularProgressIndicator());
      }
    },);
  }

  Future<List<dynamic>> callProductApi() async {
    http.Response response = await http.get(
        Uri.parse('https://630da107109c16b9abe9b070.mockapi.io/data/products'));
    List<dynamic> resList = jsonDecode(response.body.toString());
    for(int i=0;i<resList.length;i++){
      // print("befire::$i");
      int choice = int.parse(resList[i]['id']);
      if(choice != int.parse(widget.id!)){
        list1.add(resList[i]);
      }
      // print("after of product::$i");
    }
    return list1;
  }

  Future<void> insertCartApi() async {
    Map map = {};
    map['productID'] = widget.id;
    map['productName'] = widget.productName;
    map['productImage'] = widget.imagePath;
    map['productPrice'] = widget.productPrice;

    http.Response response = await http.post(Uri.parse('https://630da107109c16b9abe9b070.mockapi.io/data/cart'),body: map);
  }

  Future<bool> callCartApi() async {
    http.Response response = await http.get(Uri.parse('https://630da107109c16b9abe9b070.mockapi.io/data/cart'));
    List<dynamic> resList = jsonDecode(response.body.toString());
    for(int i=0;i<resList.length;i++){
      if(resList[i]['productID'] == widget.id){
        return true;
      }
    }
    return false;
  }
}

Widget ProductStyle(
    {String? image,
    Color? color,
    String? text,
    String? id,
    context,
    String? productName,
    String? productPrice}) {
  return Container(
    alignment: Alignment.center,
    height: 60,
    width: 60,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: image != null
        ? InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return ProductDetail(
                    imagePath: image,
                    productName: productName,
                    id: id,
                    productPrice: productPrice,
                  );
                },
              ));
            },
            child: Image.network(image))
        // ? Image.asset(image)
        : Text(
            text!,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
  );
}
