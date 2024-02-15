import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StripePaymentHandle {
  Map<String, dynamic>? paymentIntent;

  Future<void> payment() async {
    try {
      Map<String, dynamic> body = {'amount': '10000', 'currency': 'INR'};
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51OiEIjKJXVCbENfEHwbzkGokrLWYdRYlh3N3kFAFVoE4LoJJW4kFJyh3jKZ8Cs2OCxxW4d4iPxFEzMEhwSgGGIlt00xHt6emi8',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      paymentIntent = json.decode(response.body);
    } catch (e) {
      print(e);
    }

    try {
      // Initialize the payment sheet.
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          style: ThemeMode.light,
          merchantDisplayName: 'Ahmed',
        ),
      );

      // Present the payment sheet.
      await Stripe.instance.presentPaymentSheet().then((value) {
        Fluttertoast.showToast(msg: 'Payment successfully completed');
      });
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        Fluttertoast.showToast(msg: 'Payment canceled');
      } else {
        Fluttertoast.showToast(
            msg: 'Error from Stripe: ${e.error.localizedMessage}');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Unforeseen error: ${e}');
    }
  }
}