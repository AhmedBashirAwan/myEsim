import 'package:esim/src/auth/views/sign_in.dart';
import 'package:esim/src/auth/views/sign_up.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromRGBO(255, 255, 255, 1), //Color('#f5f5f5'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(24, 91, 255, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              width: 280,
              child: Image.asset('images/myesim-logo.png'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              alignment: Alignment.center,
              width: 200,
              child: const Text(
                'Unlock the World with myeSIM',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              width: 280,
              child: const Text(
                "At myeSIM, we're redefining the way you stay connected while traveling abroad.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            Container(
              width: 280,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromRGBO(40, 91, 255, 1)),
                color: const Color.fromRGBO(24, 91, 255, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  style: const ButtonStyle(),
                  child: const Text('Create An Account',
                      style: TextStyle(color: Colors.white))),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 280,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                color: const Color.fromRGBO(244, 244, 244, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    );
                  },
                  style: const ButtonStyle(),
                  child: const Text('Sign In',
                      style: TextStyle(color: Colors.black45))),
            ),
          ],
        ),
      ),
    );
  }
}
