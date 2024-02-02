import 'package:esim/src/auth/views/landing.dart';
import 'package:flutter/material.dart';

class Ttitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Landing()),
        );
      },
      child: Scaffold(
        backgroundColor:
            const Color.fromRGBO(24, 91, 255, 1), 
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                child: Image.asset('images/myesim-logo.png'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                alignment: Alignment.center,
                width: 200,
                child: const Text(
                  'Unlock The World with MyeSIM',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
