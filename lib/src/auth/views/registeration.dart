import 'package:esim/components/dashboard.dart';
import 'package:esim/globals.dart';
import 'package:esim/src/auth/controller/authcontroller.dart';
import 'package:flutter/material.dart';

class Registeration extends StatefulWidget {
  const Registeration({super.key});

  @override
  State<Registeration> createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _loginEmail = TextEditingController();
  final TextEditingController _loginPass = TextEditingController();
  bool loginObsecure = true;
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _signEmail = TextEditingController();
  final TextEditingController _signPass = TextEditingController();
  final TextEditingController _cSignPass = TextEditingController();
  bool signPassObs = true;
  bool confirmPassObsecure = true;
  bool check = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black45,
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          TabBar(
            indicator: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            controller: _tabController,
            tabs: [
              Tab(
                child: SizedBox(
                  width: getWidth(context) * 0.23,
                  child: const Text(
                    'Log in',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Tab(
                child: SizedBox(
                  width: getWidth(context) * 0.23,
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        width: getHeight(context),
                        child: TextFormField(
                          controller: _loginEmail,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black26),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: getHeight(context),
                        child: TextFormField(
                          obscureText: loginObsecure,
                          controller: _loginPass,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (loginObsecure == true) {
                                      loginObsecure = false;
                                    } else {
                                      loginObsecure = true;
                                    }
                                  });
                                },
                                child: const Icon(
                                    Icons.remove_red_eye_outlined)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black26),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'Forget Password?',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: getHeight(context) * 0.06,
                            width: getWidth(context) * 0.5,
                            child: ElevatedButton(
                                onPressed: () {
                                  AuthController().loginInTheFirebase(
                                      _loginEmail.text.trim(),
                                      _loginPass.text.trim());
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Dashboard()),
                                  );
                                },
                                child: const Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        width: getHeight(context),
                        child: TextFormField(
                          controller: _firstName,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black26),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            labelText: 'First Name',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getHeight(context),
                        child: TextFormField(
                          controller: _lastName,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black26),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            labelText: 'Last Name',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getHeight(context),
                        child: TextFormField(
                          controller: _signEmail,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black26),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getHeight(context),
                        child: TextFormField(
                          obscureText: confirmPassObsecure,
                          controller: _signPass,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (confirmPassObsecure == true) {
                                      confirmPassObsecure = false;
                                    } else {
                                      confirmPassObsecure = true;
                                    }
                                  });
                                },
                                child: const Icon(
                                    Icons.remove_red_eye_outlined)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black26),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getHeight(context),
                        child: TextFormField(
                          obscureText: signPassObs,
                          controller: _cSignPass,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (signPassObs == true) {
                                      signPassObs = false;
                                    } else {
                                      signPassObs = true;
                                    }
                                  });
                                },
                                child: const Icon(
                                    Icons.remove_red_eye_outlined)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black26),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            labelText: 'Confirm Password',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Do you have a referral or voucher code?',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: check,
                              onChanged: (value) {
                                setState(() {
                                  if (check == false) {
                                    check = true;
                                  } else {
                                    check = false;
                                  }
                                });
                              }),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'I\'d like to receive promotional emails.',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: getHeight(context) * 0.06,
                            width: getWidth(context) * 0.5,
                            child: ElevatedButton(
                                onPressed: () {
                                  AuthController().creatingUser(
                                      email: _signEmail.text.trim(),
                                      pass: _signPass.text.trim(),
                                      name: _firstName.text + _lastName.text);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Dashboard()),
                                  );
                                },
                                child: const Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
