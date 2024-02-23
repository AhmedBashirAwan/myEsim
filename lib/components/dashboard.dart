import 'package:esim/src/plans/views/plans.dart';
import 'package:esim/src/profiles/views/profile.dart';
import 'package:flutter/material.dart';
import '../src/mainpage/views/main_sccreen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedTab = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const MainScreen(),
      const Plans(),
      // FirebaseAuth.instance.currentUs/urrentUser!.uid.isNotEmpty
      // ?
      const ProfileView()
      // : const AccountDetails()
    ];
  }

  void _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: Colors.white),
        child: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: _changeTab,
          selectedItemColor: Colors.blue.shade800,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: "Store",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sim_card_outlined),
              label: "ESIMs",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_3_outlined),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
