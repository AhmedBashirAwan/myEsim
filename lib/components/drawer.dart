import 'package:esim/globals.dart';
import 'package:esim/src/auth/controller/authcontroller.dart';
import 'package:esim/src/profiles/views/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Drrawer extends StatefulWidget {
  const Drrawer({super.key});

  @override
  State<Drrawer> createState() => _DrrawerState();
}

class _DrrawerState extends State<Drrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: InkWell(
              onTap: () {
                
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(24, 91, 255, 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: getWidth(context) * 0.3,
                            child: Text(
                              textAlign: TextAlign.center,
                              FirebaseAuth.instance.currentUser != null
                                  ? FirebaseAuth.instance.currentUser!.email ??
                                      'Username'
                                  : 'Username',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          // const Text(
                          //   "Disconnected",
                          //   style: TextStyle(color: Colors.white, fontSize: 14),
                          // ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
          const Padding(
            padding: EdgeInsets.all(18),
            child: Text("Main Menu",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.person_3_outlined),
                SizedBox(
                  width: 10,
                ),
                Text('Account',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ],
            ),
            onTap: () {
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.remove_red_eye_outlined),
                SizedBox(
                  width: 10,
                ),
                Text('Packages',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ],
            ),
            onTap: () {
              // Handle item tap
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.settings),
                SizedBox(
                  width: 10,
                ),
                Text('Setting',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings()),
              );
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.logout_sharp),
                SizedBox(
                  width: 10,
                ),
                Text('Sign Out',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
            onTap: () {
              AuthController().logout();
            },
          ),
        ],
      ),
    );
  }
}
