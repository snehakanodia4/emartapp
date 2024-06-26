import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/dummy_data.dart';
import '../models/cart.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedProduct =
        dummyProducts.firstWhere((prod) => prod.id == productId);
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedProduct.name),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedProduct.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Rs ${selectedProduct.price}',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              selectedProduct.description,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              cart.addItem(
                selectedProduct.id,
                selectedProduct.price,
                selectedProduct.name,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added to cart!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
