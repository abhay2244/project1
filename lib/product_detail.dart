import 'package:flutter/material.dart';
import 'package:project1/cart_detail.dart';

class ProductDetail extends StatelessWidget {
  String? imagePath;
  String? productName;
  ProductDetail({Key? key,required this.imagePath,required this.productName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Image.asset(
                  'assets/images/$imagePath',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
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
                      productName!,
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
                          image: 'assets/images/fujiyama-beer-glass.png',
                          color: Color(0xFFE3E3E0),
                        ),
                        ProductStyle(
                            image: 'assets/images/fujiyama-beer-glass.png',
                            color: Color(0xFFE3E3E0)),
                        ProductStyle(
                            image: 'assets/images/fujiyama-beer-glass.png',
                            color: Color(0xFFE3E3E0)),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text("\$",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                      Text(
                        "199",
                        style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return CartDetail();
                      },));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 180,
                      child: Text("Add to Cart",style: TextStyle(color: Color(0xFFF1C40F),fontSize: 17  ,fontWeight: FontWeight.bold),),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
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
  }
}

Widget ProductStyle({String? image, Color? color, String? text}) {
  return Container(
    alignment: Alignment.center,
    height: 60,
    width: 60,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: image != null
        ? Image.asset(image)
        : Text(
            text!,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
  );
}
