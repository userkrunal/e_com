import 'package:e_com/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Shop_Screen extends StatefulWidget {
  const Shop_Screen({Key? key}) : super(key: key);

  @override
  State<Shop_Screen> createState() => _Shop_ScreenState();
}

class _Shop_ScreenState extends State<Shop_Screen> {
  Product_Provider? providerF;
  Product_Provider? providerT;
  @override
  Widget build(BuildContext context) {
    int i =ModalRoute.of(context)!.settings.arguments as int;
    providerF=Provider.of<Product_Provider>(context,listen: false);
    providerF=Provider.of<Product_Provider>(context,listen: true);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Shop Screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 350,
              width: 360,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.green,
                            image: DecorationImage(
                              image: AssetImage("${providerF!.productList[i].path}"),fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          providerF!.cartList.add(providerF!.productList[i]);
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(20)),
                          child: Center(child: Text("Add To Cart",style: TextStyle(fontSize: 20))),
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          height: 50,
                          width: 70,
                          decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),
                          child: Center(child: Text("Buy",style: TextStyle(fontSize: 20))),
                        ),
                      ),
                      // ElevatedButton(onPressed: () {
                      //
                      // }, child: Text("Buy",style: TextStyle(fontSize: 20)))
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star_rate_sharp,color: Colors.amber,size: 30),
                        Icon(Icons.star_rate_sharp,color: Colors.amber,size: 30),
                        Icon(Icons.star_rate_sharp,color: Colors.amber,size: 30),
                        Icon(Icons.star_rate_sharp,color: Colors.amber,size: 30),
                        Icon(Icons.star_half,color: Colors.amber,size: 30),
                      ]),
                ],
              ),
            ),
          ),
          Text("${providerF!.productList[i].name}",style: TextStyle(fontSize: 35)),
          SizedBox(height: 5),
          Text("${providerF!.productList[i].price}",style: TextStyle(fontSize: 20)),
          SizedBox(height: 5),
          Text("🔶 ️Partner OfferBuy this product and get upto ₹250 Off",style: TextStyle(fontSize: 15)),
          SizedBox(height: 10),
          Text("🔶 ️Bank Offer5% Cashback on Flipkart Axis Bank Card",style: TextStyle(fontSize: 15)),
          SizedBox(height: 10),
          Text(" ₹ Cash on Delivery available",style: TextStyle(fontSize: 15)),
        ],
      ),
    ));
  }
}
