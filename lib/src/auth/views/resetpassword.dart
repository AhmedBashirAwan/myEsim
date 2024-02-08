import 'package:esim/globals.dart';
import 'package:esim/src/auth/views/sign_in.dart';
import 'package:flutter/material.dart';

class ResetPass extends StatelessWidget {
  const ResetPass({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                width: 200,
                child: const Text(
                  'Reset Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: getHeight(context) * 0.051),
              SizedBox(
                width: 280,
                height: 65,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black26),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => LocalSims()),
                      // );
                    },
                    style: const ButtonStyle(),
                    child: const Text('Send Reset Link',
                        style: TextStyle(color: Colors.white))),
              ),
              SizedBox(height: getHeight(context) * 0.3),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 280,
                height: 20,
                child: Row(
                  children: [
                    const Text("Already Have An Account ?",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignIn()),
                        );
                      },
                      child: const Text('Sign In',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(24, 91, 255, 1),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: getHeight(context) * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
