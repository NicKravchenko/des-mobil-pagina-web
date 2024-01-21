import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  static const String routName = '/ProductsScreen';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10.0),
        child: const Text('Products',
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}
