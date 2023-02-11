import 'package:flutter/material.dart';
import 'package:project1/cart_detail.dart';
import 'package:project1/dimension.dart';
import 'package:project1/product_detail.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("height of context : "+MediaQuery.of(context).size.height.toString());
    print("height of context : "+MediaQuery.of(context).size.width.toString());
    List<String> imgeList = ['paper-bagks.png','archiblocks.png','fujiyama-beer-glass.png','Bamboo-Utensil.png'];
    List<String> productList = ['Paper Bags','Archiblocks','Fujiyama Glass','Bamboo Utensil'];
    List<int> productPrice = [26,98,199,10];
    List<String> artistPath = ['artist1.jpg','artist2.jpg','artist3.jpg','artist4.jpg'];
    List<String> artistName = ['Angella','Mendy','Anna','Melody'];
    PageController pageCntroller = PageController(
      viewportFraction: 0.60,
    );
    bool selected = false;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: Dimensions.width20, top: Dimensions.height10),
          child: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(
                  Icons.short_text,
                  color: Colors.black54,
                  size: Dimensions.icon30,
                ),
              );
            },
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: Dimensions.width50, top: Dimensions.height10),
            child: CircleAvatar(
                radius: Dimensions.radius18,
                backgroundImage:
                    AssetImage('assets/images/profile.jpg')),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFF1C40F),
              ),
              child: Text(
                "Electricity App",
                style: TextStyle(color: Colors.white, fontSize: Dimensions.font24),
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return CartDetail();
                      },
                    ),
                  );
                },
                child: ListTile(
                  title: Text("Cart"),
                )),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: Dimensions.width30, top: Dimensions.height15),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, Daniel",
                style: TextStyle(fontSize: Dimensions.font25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Dimensions.height18,
              ),
              Container(
                padding: EdgeInsets.only(right: Dimensions.width60),
                child: Text(
                  "Welcome to ode to the things, Let us open exquisite life together",
                  style: TextStyle(color: Colors.black54, fontSize: Dimensions.font16),
                ),
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
              Padding(
                padding: EdgeInsets.only(right: Dimensions.width50),
                child: TextFormField(
                  style: TextStyle(),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.black26,
                        fontSize: Dimensions.font18,
                        fontWeight: FontWeight.w500),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black26,
                      size: Dimensions.icon30,
                    ),
                    hintText: "Search",
                    filled: true,
                    fillColor: Color(0xFFF8F8F7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     buttonStyle(name: "Popular"),
              //     buttonStyle(name: "New"),
              //     Container(
              //       padding: EdgeInsets.only(right: 90),
              //       child: buttonStyle(name: "Discount"),
              //     )
              //   ],
              // ),
              Container(
                padding: EdgeInsets.only(right: Dimensions.width70),
                child: TabBar(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  labelColor: Colors.black,
                  indicatorColor: Colors.transparent,
                  controller: _tabController,
                  unselectedLabelColor: Colors.black26,
                  labelStyle: TextStyle(
                    fontSize: Dimensions.font22,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(
                      fontSize: Dimensions.font18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black26),
                  labelPadding: EdgeInsets.zero,
                  tabs: [
                    Tab(
                      text: "Popular",
                    ),
                    Tab(text: "New"),
                    Tab(text: "Discount")
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              Container(
                height: Dimensions.height300,
                child: PageView.builder(
                  itemCount: 4,
                  controller: pageCntroller,
                  padEnds: false,
                  itemBuilder: (context, index) {
                    return buildPageItem(context,index,imagePath: imgeList[index],productName: productList[index],productPrice: productPrice[index]);
                  },
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Container(
                child: Text(
                  "Artists",
                  style: TextStyle(fontSize: Dimensions.font22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomArtists(artistImage: artistPath[0],artistName: artistName[0]),
                  CustomArtists(artistImage: artistPath[1],artistName: artistName[1]),
                  CustomArtists(artistImage: artistPath[2],artistName: artistName[2]),
                  CustomArtists(artistImage: artistPath[3],artistName: artistName[3]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buttonStyle({required String name}) {
  return TextButton(
    onPressed: () {},
    child: Text(
      name,
      style: TextStyle(color: Colors.black26, fontSize: Dimensions.font18),
    ),
  );
}

Widget buildPageItem(BuildContext context,int index,{required imagePath,required productName,required productPrice}) {

  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return ProductDetail(imagePath: imagePath,productName: productName,);
      },));
    },
    child: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          alignment: Alignment.bottomRight,
          decoration: BoxDecoration(
            color: Color(0xFFE3E3E0),
            borderRadius: BorderRadius.circular(Dimensions.radius20)
          ),
          height: Dimensions.height300,
          margin: EdgeInsets.only(right: Dimensions.width15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            child: Image.asset(
              'assets/images/$imagePath',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                productName,
                style: TextStyle(fontSize: Dimensions.font18, fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.only(top: Dimensions.height40, left: Dimensions.width20),
            ),
            Container(
              padding: EdgeInsets.only(left: Dimensions.width20, top: Dimensions.height5),
              child: Text(
                "\$$productPrice",
                style: TextStyle(
                    fontSize: Dimensions.font18,
                    color: Colors.black26,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget CustomArtists({required artistImage,required artistName}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.only(right: Dimensions.width50),
        child: CircleAvatar(
            radius: Dimensions.radius20,
            backgroundImage:
                AssetImage('assets/images/$artistImage')
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: Dimensions.height10),
          child: Text(
        artistName,
        style: TextStyle(
          color: Colors.black26,
        ),
        textAlign: TextAlign.left,
      ))
    ],
  );
}

