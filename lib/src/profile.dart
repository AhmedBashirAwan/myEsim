import 'package:esim/components/drawer.dart';
import 'package:esim/src/helpers.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drrawer(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                            child: Icon(
                          Icons.dashboard_outlined,
                          size: 30,
                        ))),
                  ),
                  const Text(
                    "MyEsim",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                          child: Icon(
                        Icons.star_border_outlined,
                        size: 30,
                      ))),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Status",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
              const Text(
                "  Connecting..",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.red),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(16)),
                  child: const Center()),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Netherlands",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const Text(
                "Amsterdam",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black38,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Material(
                elevation: 5,
                child: SizedBox(
                  height: getHeight(context) * 0.35,
                  width: getWidth(context),
                  child: const Center(
                    child: Text('QR will be here'),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: getHeight(context) * 0.06,
                width: getWidth(context),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, // Background color
                      backgroundColor: Colors.red.shade300, // Text color
                      elevation: 5, // Elevation (shadow)
                      padding: const EdgeInsets.all(
                          10), // Padding around the button content
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Rounded corners
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Cancel Connection')),
              )
            ],
          ),
        ),
      )),
    );
  }
}
