import 'package:esim/firebase_options.dart';
import 'package:esim/src/auth/views/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51OI9BxLyPH6stzr3ZHuFbgJgJKo5KYTvycqNYs5XlvJw2aJuZGFR3j4aBDfaX8tKGmR7XXAp460plfVJ5bpnaz3B00hMNb15bX';
  // Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  // await Stripe.instance.applySettings();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My eSIM',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Ttitle());
  }
}
