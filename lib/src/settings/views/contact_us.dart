import 'package:esim/globals.dart';
import 'package:flutter/material.dart';

class Contactus extends StatelessWidget {
  const Contactus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: getWidth(context) * 0.9,
                child: const Text(
                  textAlign: TextAlign.justify,
                  'We\'re here for you, and our team would be happy to help with any questions or issues you might have.',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: getWidth(context),
                child: TextFormField(
                  // controller: _loginPass,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black26),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      hintText: 'Ahmed'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: getWidth(context),
                child: TextFormField(
                  // controller: _loginPass,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black26),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      hintText: 'Bashir'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: getWidth(context),
                child: TextFormField(
                  // controller: _loginPass,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black26),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      hintText: 'ahmedbashirawan@gmail.com'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: getWidth(context),
                child: TextFormField(
                  // controller: _loginPass,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black26),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      hintText: 'Phone Number'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: getWidth(context),
                child: TextFormField(
                  // controller: _loginPass,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black26),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      hintText: 'eSIM ICCID (optional)'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: getWidth(context),
                child: TextFormField(
                  // controller: _loginPass,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black26),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      hintText: 'Subject'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: getWidth(context),
                child: TextFormField(
                  // controller: _loginPass,
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black26),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      hintText: 'Message'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: getHeight(context) * 0.06,
                    width: getHeight(context) * 0.12,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text(
                        'SEND',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
