import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripePaymentHandle {
  Map<String, dynamic>? paymentIntent;

  Future<void> payment(String amount) async {
    print(amount);
    try {
      // Create the form-urlencoded body
      Map<String, String> body = {
        'amount': amount,
        'currency': 'usd' // 'usd' is the correct currency code
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51OiEIjKJXVCbENfEHwbzkGokrLWYdRYlh3N3kFAFVoE4LoJJW4kFJyh3jKZ8Cs2OCxxW4d4iPxFEzMEhwSgGGIlt00xHt6emi8',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      if (response.statusCode == 200) {
        paymentIntent = json.decode(response.body);
      } else {
        throw Exception('Failed to create payment intent');
      }
    } catch (e) {
      print(e);
    }

    try {
      // Ensure paymentIntent is not null
      if (paymentIntent != null) {
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
          print('Payment successfully completed');
        });
      } else {
        throw Exception('Payment intent is null');
      }
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        print('Payment canceled');
      } else {
        print('Error from Stripe: ${e.error.localizedMessage}');
      }
    } catch (e) {
      print('Unforeseen error: $e');
    }
  }
}
