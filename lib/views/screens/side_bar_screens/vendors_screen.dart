import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});

  static const String routName = '/VendorsScreen';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10.0),
        child: const Text('Vendors',
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}
