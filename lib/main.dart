import 'package:flutter/material.dart';
import './screens/orders_screen.dart';
import './screens/cart_screen.dart';
import './screens/products_overview_screen.dart';
import "./screens/product_detail_screen.dart";
import "./providers/products.dart";
import "package:provider/provider.dart";
import './providers/cart.dart';
import './providers/orders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
        ChangeNotifierProvider(
        create:(context) => Products(),
         ),
          ChangeNotifierProvider(
        create:(context) => Cart(),
         ),
         ChangeNotifierProvider(
           create:(context)=>Orders())
    ],
 child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: "Lato"
        ),
        home: ProductsOverviewScreen(),
        routes: {
        ProductDetailScreen.routeName:(context) => ProductDetailScreen(),
        CartScreen.routeName:(context) => CartScreen(),
        OrderScreen.routeName:(context) => OrderScreen()
        
        },
      ), 
    );
    
    
   
  }
}

 