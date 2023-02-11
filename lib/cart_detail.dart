import 'package:flutter/material.dart';

class CartDetail extends StatelessWidget {
  const CartDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.only(left: 50,right: 50),
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
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ListOfCart();
                      },
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Colors.black26,
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                            Text("\$230",style: TextStyle(color: Colors.black38,fontSize: 17),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Taxes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                            Text("\$19",style: TextStyle(color: Colors.black38,fontSize: 17),)
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
                              Navigator.of(context).pushNamed('/mainPage');
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 180,
                              child: Text(
                                "Check Out",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17,fontWeight: FontWeight.bold),
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xFFF1C40F),
                                  borderRadius: BorderRadius.circular(30)),
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
