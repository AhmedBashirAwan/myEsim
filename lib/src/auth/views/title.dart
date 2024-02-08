import 'package:esim/components/dashboard.dart';
import 'package:esim/src/mainpage/controller/main_controllers.dart';
import 'package:flutter/material.dart';

class Ttitle extends StatefulWidget {
  const Ttitle({super.key});

  @override
  State<Ttitle> createState() => _TtitleState();
}

class _TtitleState extends State<Ttitle> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _populateCountriesAndNavigate();
    });
  }

  void _populateCountriesAndNavigate() {
    try {
      MainController().fetchingAllFlags();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Dashboard()),
      );
    } catch (error) {
      // You might want to display an error message or retry logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 91, 255, 1),
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
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
