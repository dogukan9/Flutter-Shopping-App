
import 'package:flutter/material.dart';
import '../providers/products.dart';
import './product_item.dart';
import 'package:provider/provider.dart';
class ProductsGrid extends StatelessWidget {
 
 final bool showFavs;

 ProductsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
   final productsData= Provider.of<Products>(context);
   final products=showFavs ? productsData.favoriteItems: productsData.items;
    return GridView.builder(
      padding:const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (context,index){
        return ChangeNotifierProvider.value(value:products[index],child: 
        ProductItem(
          // products[index].id,
          // products[index].title,
          // products[index].imageUrl
         ),
          );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // aynı rowda kaç tane item olacak
        childAspectRatio: 3/2,
        crossAxisSpacing: 10, // x ekseninde uzaklastır
        mainAxisSpacing: 10 // y ekseninde uzaklastır
        ),
    );
  }
}