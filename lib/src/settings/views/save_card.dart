import 'package:esim/globals.dart';
import 'package:flutter/material.dart';

class Savecards extends StatelessWidget {
  const Savecards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text('Save Cards'),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: getHeight(context) * 0.4,
          ),
          SizedBox(
            width: getWidth(context) * 0.9,
            child: const Text(
              textAlign: TextAlign.center,
              'You don\'t have any saved cards yet.',
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
              'When you add a new card, you\'ll see your saved card details here.',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: getHeight(context) * 0.06,
                width: getHeight(context) * 0.5,
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                  child: Text(
                    'ADD NEW CARD',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
