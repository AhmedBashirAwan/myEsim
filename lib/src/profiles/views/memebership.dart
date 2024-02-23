import 'package:esim/globals.dart';
import 'package:flutter/material.dart';

class Memebership extends StatelessWidget {
  const Memebership({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text('Memebership'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Material(
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
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Traveler",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        ),
                        Text(
                          "5% Cashback",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                        Text(
                          "AIRMONEY BALANCE",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                        Text(
                          "US\$ 0.00",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: getWidth(context) * 0.9,
                    child: const Text(
                      'Do you have an Airmoney or eSIM voucher code?',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: getWidth(context) * 0.9,
                    child: const Text(
                      'You can redeem your voucher code to add Airmoney or an eSIM to your account.',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: getHeight(context) * 0.06,
                    width: getHeight(context) * 0.45,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text(
                        'REDEEM VOUCHER',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Material(
                borderRadius: BorderRadius.circular(8),
                elevation: 8,
                child: Container(
                  // height: getHeight(context) * 0.3,
                  width: getWidth(context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black54),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 12, right: 12, top: 12),
                        child: Row(
                          children: [
                            Text(
                              "MEMBERSHIP STATUS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                            Spacer(),
                            Icon(
                              Icons.wallet_membership_rounded,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: Row(
                          children: [
                            Text(
                              "Next level",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                            Spacer(),
                            Text(
                              "Silver Traveler",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Divider(
                          height: 20,
                          thickness: 10,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "US \$20.00",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "REMAIN PURCHASE",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            size: 20,
                            Icons.info_outline,
                            color: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: getWidth(context) * 0.9,
                    child: const Text(
                      'Airmoney Transaction History',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: getWidth(context) * 0.9,
                    child: const Text(
                      'You don\'t have any Airmoney transactions yet.',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
