import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/dummy_data.dart';
import 'product_detail_screen.dart';
import '../models/cart.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: dummyProducts.length,
        itemBuilder: (ctx, i) => ProductItem(
          dummyProducts[i].id,
          dummyProducts[i].name,
          dummyProducts[i].imageUrl,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;

  ProductItem(this.id, this.name, this.imageUrl);

  void selectProduct(BuildContext context) {
    Navigator.of(context).pushNamed(
      ProductDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectProduct(context),
      child: GridTile(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: const Color.fromARGB(221, 234, 168, 168),
          title: Text(
            name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
