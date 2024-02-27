import 'dart:convert';
import 'package:esim/src/mainpage/controller/main_controllers.dart';
import 'package:esim/src/mainpage/models/esim_model.dart';
import 'package:esim/src/qrscreens/controllers/activation_controller.dart';
import 'package:esim/src/qrscreens/views/qr_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripePaymentHandle {
  Future<void> payment({
    required BuildContext context,
    required String amount,
    required String regionName,
    required String planUid,
    // required Future<EsimResponse> esim
  }) async {
    // var cardDetails = {
    //   'card[number]': '4242424242424242',
    //   'card[exp_month]': '12',
    //   'card[exp_year]': '24',
    //   'card[cvc]': '123',
    // };
    try {
      Map<String, String> body = {
        'amount': amount,
        'currency': 'usd',
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51OI9BxLyPH6stzr3IkCbuk1Ieu7SyAFvLf1txJCin2WqvYg9onMLTwX9zmoSt2lQDleActH94BlZe6qu4mLr7zGJ00AXcWPto7',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic>? paymentIntentData = json.decode(response.body);
        String? clientSecret = paymentIntentData!['client_secret'];
        if (clientSecret != null) {
          await initializePaymentSheet(
              context, clientSecret, regionName, planUid);
        } else {
          throw Exception('One or more required properties are null');
        }
      } else {
        throw Exception('Failed to create payment intent');
      }
    } catch (e) {
      print('Error creating payment intent: $e');
    }
  }

  Future<void> initializePaymentSheet(
    BuildContext context,
    String clientSecret,
    String regionName,
    String planUid,
  ) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          style: ThemeMode.system,
          merchantDisplayName: 'name',
          allowsDelayedPaymentMethods: true,
          customFlow: true,

          // merchantIdentifier:'',
          // customerId: customer,
          // customerEphemeralKeySecret: ephemeralKey,
          // confirmPayment: false,
        ),
      );
      presentPaymentSheet(context, regionName, planUid);
    } catch (e) {
      print('Error initializing payment sheet: $e');
    }
  }

  Future<void> presentPaymentSheet(
    BuildContext context,
    String regionName,
    String planUid,
  ) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async{
        EsimResponse esimResponse =
          await MainController().creatingEsim(regionName, planUid);
      ActivationController().userEsim(
        plan_ID: planUid,
        iCCID: esimResponse.esim.iccid,
      );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QrScreen(esim: esimResponse),
          ),
        );
        print('Payment successfully completed');
      });
    } catch (e) {
      print('Error presenting payment sheet: $e');
    }
  }
}
