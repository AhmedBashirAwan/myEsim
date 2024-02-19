// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// class StripePaymentHandle {
//   Map<String, dynamic>? paymentIntent;

//   Future<void> payment(String amount) async {
//     try {
//       Map<String, dynamic> body = {'amount': amount, 'currency': 'USD'};
//       var response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         headers: {
//           'Authorization':
//               'Bearer sk_test_51OiEIjKJXVCbENfEHwbzkGokrLWYdRYlh3N3kFAFVoE4LoJJW4kFJyh3jKZ8Cs2OCxxW4d4iPxFEzMEhwSgGGIlt00xHt6emi8',
//           'Content-Type': 'application/x-www-form-urlencoded'
//         },
//         body: body,
//       );
//       paymentIntent = json.decode(response.body);
//     } catch (e) {
//       print(e);
//     }

//     try {
//       // Initialize the payment sheet.
//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           style: ThemeMode.light,
//           merchantDisplayName: 'Ahmed',
//         ),
//       );

//       // Present the payment sheet.
//       await Stripe.instance.presentPaymentSheet().then((value) {
//         print('Payment successfully completed');
//       });
//     } on StripeException catch (e) {
//       if (e.error.code == FailureCode.Canceled) {
//         print('Payment canceled');
//       } else {
//         print(
//              'Error from Stripe: ${e.error.localizedMessage}');
//       }
//     } catch (e) {
//       print( 'Unforeseen error: $e');
//     }
//   }
// }
