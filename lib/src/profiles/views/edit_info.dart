import 'package:esim/globals.dart';
import 'package:esim/src/auth/controller/authcontroller.dart';
import 'package:esim/src/profiles/controllers/profile_controller.dart';
import 'package:flutter/material.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({super.key});

  @override
  State<EditInfo> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  TextEditingController name = TextEditingController();
  TextEditingController secName = TextEditingController();
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
        title: const Text('Account Information'),
      ),
      body: FutureBuilder(
          future: AuthController().getCurrentUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: getHeight(context),
                        child: TextFormField(
                          controller: name,
                          onFieldSubmitted: (value) {
                            ProfileControllers().editInfo(name.text.trim());
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black26),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              hintText: snapshot.data!['name']),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: getHeight(context),
                        child: TextFormField(
                          readOnly: true,
                          // controller: email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black26),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            hintText: snapshot.data!['email'],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              ProfileControllers().editInfo(name.text.trim());
                            },
                            child: Container(
                              height: getHeight(context) * 0.06,
                              width: getHeight(context) * 0.12,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Text(
                                  'Edit',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          if (email.text.isEmpty) {
                            AuthController()
                                .forgetPass(context, snapshot.data!['email']);
                          } else {
                            AuthController()
                                .forgetPass(context, email.text.trim());
                          }
                        },
                        child: const Text(
                          'Forget Password ?',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ));
            }
          }),
    );
  }
}
