import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  static const String routName = '/OrdersScreen';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10.0),
        child: const Text('Orders',
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}
