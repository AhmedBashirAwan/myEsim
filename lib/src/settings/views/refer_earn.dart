import 'package:esim/globals.dart';
import 'package:flutter/material.dart';

class ReferandEarn extends StatelessWidget {
  const ReferandEarn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: const Text('Refer and Earn'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Material(
              borderRadius: BorderRadius.circular(8),
              elevation: 8,
              child: Container(
                height: getHeight(context) * 0.3,
                width: getWidth(context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange.shade900,
                        Colors.orange.shade700,
                        Colors.orange.shade600,
                        Colors.orange.shade200,
                      ],
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: getWidth(context) * 0.8,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Share Amazing eSIM Techonology with Friends",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        ),
                      ),
                      Text(
                        "Give US\$3, Get US\$3",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: getHeight(context) * 0.05,
                            width: getHeight(context) * 0.2,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                // color: Colors.black87,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text(
                                'LEARN MORE',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
