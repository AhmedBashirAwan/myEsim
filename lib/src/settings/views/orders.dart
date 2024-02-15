import 'package:esim/globals.dart';
import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: const Text('Orders'),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(),
          SizedBox(
            height: getHeight(context) * 0.4,
          ),
          SizedBox(
            width: getWidth(context) * 0.9,
            child: const Text(
              textAlign: TextAlign.center,
              'You don\'t have any orders yet.',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: getWidth(context) * 0.9,
            child: const Text(
              textAlign: TextAlign.center,
              'When you purchase an eSIM or top-up package, you\'ll see your order details here.',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      )),
    );
  }
}
