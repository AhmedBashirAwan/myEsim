import 'package:esim/src/auth/views/sign_in.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:
          const Color.fromRGBO(240, 245, 245, 1), //Color('#f5f5f5'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              width: 130,
              child: Image.asset('images/myesim-blue-square.png'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              alignment: Alignment.center,
              width: 200,
              child: const Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 280,
              height: 65,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.black26),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  labelText: 'Username',
                ),
                // validator: (value) {},
              ),
            ),
            SizedBox(
              width: 280,
              height: 65,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.black26),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  labelText: 'Password',
                ),
                // validator: (value) {},
              ),
            ),
            SizedBox(
              width: 280,
              height: 65,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.black26),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  labelText: 'Phone Number',
                ),
                // validator: (value) {},
              ),
            ),
            Container(
              width: 280,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(24, 91, 255, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                  style: const ButtonStyle(),
                  child: const Text('Create An Account',
                      style: TextStyle(color: Colors.white))),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 280,
              height: 20,
              child: Row(
                children: [
                  const Text('Already have any account ?'),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    },
                    child: const Text('Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color:  Color.fromRGBO(24, 91, 255, 1),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    
  }
}
