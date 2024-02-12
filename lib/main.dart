import 'package:esim/firebase_options.dart';
import 'package:esim/src/auth/views/title.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  Stripe.publishableKey =
      'pk_test_51OiEIjKJXVCbENfEwdrmAmXC69UhgmZZEYkvzeavyz1hWkK1CPAcKQeab7q42KRmBD4Xn0s6qxCWhgyADWEWnTed00xJIMxUGr';
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
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
