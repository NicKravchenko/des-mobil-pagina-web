import 'package:flutter/material.dart';

class WithdrawalScreen extends StatelessWidget {
  const WithdrawalScreen({super.key});

  static const String routName = '/WithdrawalScreen';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10.0),
        child: const Text('Withdrawal',
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}
