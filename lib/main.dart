import 'package:e_com/provider/product_provider.dart';
import 'package:e_com/view/cart_screen.dart';
import 'package:e_com/view/product_screen.dart';
import 'package:e_com/view/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Product_Provider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) =>ProductScreen(),
          'shop':(context) => Shop_Screen(),
          'cart':(context) => CartScreen(),
        },
      ),
    ),
  );
}