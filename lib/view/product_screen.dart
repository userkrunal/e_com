import 'package:e_com/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product_Provider? providerF;
  Product_Provider? providerT;
  @override
  Widget build(BuildContext context) {
    providerF =Provider.of<Product_Provider>(context,listen: false);
    providerT =Provider.of<Product_Provider>(context,listen: true);
    return SafeArea(child: Scaffold(
    backgroundColor: Colors.grey.shade200,
      appBar: AppBar(title: Text("Explore Plus ➕"),centerTitle: true,
        leading: Center(child: Text("Login",style: TextStyle(fontSize: 15))),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'cart');
          }, icon: Icon(Icons.add_shopping_cart))
        ],
      ),
      body: Column(
        children: [
          Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 135,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30)
          ),
          child: ListView.builder(itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.grey.shade300),
              child: Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("${providerF!.shopList[index].image}"),fit: BoxFit.fill
                      )
                    ),
                  ),
                  SizedBox(height: 5),
                  Text("${providerF!.shopList[index].name}",style: TextStyle(fontSize: 15)),
                  SizedBox(height: 5),
                  Text("${providerF!.shopList[index].of}",style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
          ),itemCount: providerF!.shopList.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder:(context, index) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'shop',arguments: index);
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("${providerF!.productList[index].path}"),fit: BoxFit.fill
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          SizedBox(height: 10),
                          Text("${providerF!.productList[index].name}",style: TextStyle(color: Colors.deepPurple,fontSize: 20)),
                          SizedBox(height: 5),
                          Text("${providerF!.productList[index].price}",style: TextStyle(color: Colors.black),),
                        ],
                      ),
                    ),
                  ),
                ),itemCount: providerF!.productList.length,
            ),
          ),
        ],
      ),
    ));
  }
}
