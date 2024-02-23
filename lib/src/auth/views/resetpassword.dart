import 'package:esim/globals.dart';
import 'package:esim/src/auth/controller/authcontroller.dart';
import 'package:esim/src/auth/views/registeration.dart';
import 'package:flutter/material.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: const Text('Reset Password'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  width: getWidth(context),
                  height: 65,
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.black26),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      labelText: 'Email Address',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                      onPressed: () {
                        AuthController().forgetPass(context, email.text.trim());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Registeration()),
                        );
                      },
                      style: const ButtonStyle(),
                      child: const Text('Send Reset Link',
                          style: TextStyle(color: Colors.white))),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
