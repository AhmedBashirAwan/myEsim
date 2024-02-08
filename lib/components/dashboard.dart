import 'package:esim/src/qrscreens/views/qr_screen.dart';
import 'package:esim/src/settings/views/account_details.dart';
import 'package:esim/src/settings/views/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../src/mainpage/views/main_sccreen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedTab = 0;

  final List _pages = [
    const MainScreen(),
    const QrScreen(),
    FirebaseAuth.instance.currentUser!.uid.isEmpty
        ? const ProfileView()
        : const AccountDetails()
  ];
  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      // body: Container(),
      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: Colors.white),
        child: BottomNavigationBar(
            currentIndex: _selectedTab,
            onTap: (index) => _changeTab(index),
            selectedItemColor: Colors.blue.shade800,
            unselectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined), label: "Store"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sim_card_outlined), label: "ESIMs"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_3_outlined), label: "Profile"),
            ]),
      ),
    );
  }
}
