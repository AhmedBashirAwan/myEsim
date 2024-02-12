import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StripePaymentHandle {
  Map<String, dynamic>? paymentIntent;

Future<void> stripeMakePayment() async {
  try {
    paymentIntent = await createPaymentIntent('100', 'INR');
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        billingDetails: BillingDetails(
          name: 'Ahmed Bashir',
          email: 'ahmedbashirawan@gmail.com',
          phone: '03335546240',
          address: Address(
            city: 'Rawalpindi',
            country: 'Pakistan',
            line1: 'Shahkhalid Colony',
            line2: 'Chaklala',
            postalCode: '46000',
            state: '46000',
          ),
        ),
        paymentIntentClientSecret: paymentIntent!['client_secret'],
        style: ThemeMode.dark,
        merchantDisplayName: 'Ikay',
      ),
    );

    await displayPaymentSheet(); // Await here to ensure completion
  } catch (e) {
    print(e.toString());
    throw Exception('Failed to make payment: $e');
  }
}

  displayPaymentSheet() async {
    try {
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();

      Fluttertoast.showToast(msg: 'Payment succesfully completed');
    } on Exception catch (e) {
      if (e is StripeException) {
        Fluttertoast.showToast(
            msg: 'Error from Stripe: ${e.error.localizedMessage}');
      } else {
        Fluttertoast.showToast(msg: 'Unforeseen error: ${e}');
      }
    }
  }

  //create Payment
  //create Payment
  Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(
            'Failed to create payment intent: ${response.statusCode}');
      }
    } catch (err) {
      throw Exception('Failed to create payment intent: $err');
    }
  }

  //calculate Amount
  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount)) * 100;
    return calculatedAmount.toString();
  }
}
