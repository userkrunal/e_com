import 'package:e_com/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Product_Provider? providerF;
  Product_Provider? providerT;
  @override
  Widget build(BuildContext context) {
    providerF=Provider.of<Product_Provider>(context,listen: false);
    providerT=Provider.of<Product_Provider>(context,listen: true);
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Cart Screen"),centerTitle: true),
      body: ListView.builder(itemBuilder: (context, index) => ListTile(
        title: Text("${providerT!.cartList[index].name}"),
        subtitle: Text("${providerT!.cartList[index].price!*providerT!.cartList[index].qa!}"),
        leading: Container(height: 50,width: 50,decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage("${providerT!.cartList[index].path}")
          )
        ),),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: () {
                  providerT!.increment(index);
            }, icon: Icon(Icons.add_circle_outline)),
            Text("${providerT!.cartList[index].qa}"),
            IconButton(onPressed: () {
                  providerT!.decrement(index);
            }, icon: Icon(Icons.remove_circle_outline)),
            IconButton(onPressed: () {
              providerT!.delete(index);
            }, icon: Icon(Icons.delete)),
          ],
        ),
      ),itemCount: providerF!.cartList.length),
    ));
  }
}
