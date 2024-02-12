import 'dart:convert';

import 'package:esim/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:http/http.dart' as http;

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Map<String, dynamic>? paymentIntent;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Money',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'US \$149',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'My eSIMs',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                TabBar(
                  indicator: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: getWidth(context) * 0.23,
                        child: const Text(
                          'Current ESIMs',
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        width: getWidth(context) * 0.23,
                        child: const Text(
                          'Archived ESIMs',
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Material(
                        elevation: 20,
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: SizedBox(
                              height: getHeight(context) * 0.3,
                              child: PrettyQrView.data(
                                data: 'lorem ipsum amet dolor sit',
                                // decoration: const PrettyQrDecoration(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: SizedBox(
                            height: getHeight(context) * 0.3,
                            child: PrettyQrView.data(
                              data: 'amet dolor ipsum sit lorem',
                              decoration: const PrettyQrDecoration(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    payment();
                  },
                  child: const Text('Payment'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> payment() async {
    try {
      Map<String, dynamic> body = {'amount': 10000, 'currency': 'INR'};
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51OiEIjKJXVCbENfEHwbzkGokrLWYdRYlh3N3kFAFVoE4LoJJW4kFJyh3jKZ8Cs2OCxxW4d4iPxFEzMEhwSgGGIlt00xHt6emi8',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        // body: body,
      );
      paymentIntent = json.decode(response.body);
    } catch (e) {
      print(e);
    }
    await Stripe.instance
        .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
                paymentIntentClientSecret: paymentIntent!['client_secret'],
                style: ThemeMode.light,
                merchantDisplayName: 'Ahmed'))
        .then((value) => {});

    try {
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet().then((value) =>
          {Fluttertoast.showToast(msg: 'Payment succesfully completed')});
    } on Exception catch (e) {
      if (e is StripeException) {
        Fluttertoast.showToast(
            msg: 'Error from Stripe: ${e.error.localizedMessage}');
      } else {
        Fluttertoast.showToast(msg: 'Unforeseen error: ${e}');
      }
    }
  }
}
