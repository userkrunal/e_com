import 'package:e_com/model/product_model.dart';
import 'package:e_com/model/shopmodel.dart';
import 'package:flutter/cupertino.dart';

class Product_Provider extends ChangeNotifier
{
  List productList=[
    ProductModel(path: "assets/images/img.png",name: "Water Bottle",price:499 ,qa:1),
    ProductModel(path: "assets/images/img_1.png",name: "Digital Watch",price:750 ,qa:1),
    ProductModel(path: "assets/images/img_2.png",name: "Clocks",price:499 ,qa:1),
    ProductModel(path: "assets/images/img_3.png",name: "Artificial Jewellery",price:299 ,qa:1),
    ProductModel(path: "assets/images/img_4.png",name: "Mobile",price: 134999,qa:1),
    ProductModel(path: "assets/images/img_5.png",name: "Airpodes Pro",price:19999 ,qa:1),
    ProductModel(path: "assets/images/img_6.png",name: "Sleeping Pillow ",price:499 ,qa:1),
  ];
  List cartList=[];
  List shopList=[
    ShopModel(name: "Grocery",of: "30% off",image: "assets/img/img.png"),
    ShopModel(name: "Mobile",of: "10% off",image: "assets/img/img_1.png"),
    ShopModel(name: "Fashion",of: "40% off",image: "assets/img/img_2.png"),
    ShopModel(name: "Electronics",of: "30% off",image: "assets/img/img_3.png"),
    ShopModel(name: "Hom",of: "30% off",image: "assets/img/img_4.png"),
  ];
  void increment(int index)
  {
    ProductModel p1=cartList[index];
    ProductModel update= ProductModel(path: p1.path,qa: p1.qa!+1,price: p1.price,name: p1.name);
    cartList[index]=update;
    notifyListeners();
  }
  void decrement(int index)
  {
    ProductModel p1=cartList[index];
    if(p1.qa==1)
      {
        delete(index);
      }
    else{
      ProductModel update=ProductModel(name: p1.name,price: p1.price,qa:p1.qa!-1,path: p1.path );
      cartList[index]=update;
    }
    notifyListeners();
  }
  void delete(int index)
  {
    cartList.removeAt(index);
    notifyListeners();
  }
}
