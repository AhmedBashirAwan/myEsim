import 'package:esim/src/auth/controller/authcontroller.dart';
import 'package:esim/src/mainpage/components/regional_panel.dart';
import 'package:esim/components/MarqueeWidget.dart';
import 'package:esim/components/drawer.dart';
import 'package:esim/src/mainpage/components/global_panel.dart';
import 'package:esim/globals.dart';
import 'package:esim/src/mainpage/components/local_panel.dart';
import 'package:esim/src/mainpage/controller/main_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchingController = TextEditingController();
  late TabController _tabController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool global = false;
  @override
  void initState() {
    // MainController().fetchingAllFlags();
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const Drrawer(),
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(240, 245, 245, 1),
      body: Column(
        children: [
          Container(
            height: 220,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(24, 91, 255, 0.5),
            ),
            child: Column(children: [
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(24, 91, 255, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(24, 91, 255, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(12)),
                                child: SizedBox(
                                  height: 30,
                                  width: 40,
                                  child: SvgPicture.asset('images/category.svg',
                                      semanticsLabel: 'Acme Logo'),
                                )),
                          ),
                          FutureBuilder(
                            future: AuthController().getCurrentUser(),
                            builder: (context, snapshot) {
                              final userName = snapshot.data?['name'] ?? "User";
                              return Text(
                                'Hello, ${userName}',
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              );
                            },
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(12)),
                                child: SizedBox(
                                  height: 30,
                                  width: 40,
                                  child: SvgPicture.asset(
                                      'images/crown-icon.svg',
                                      semanticsLabel: 'Acme Logo'),
                                )),
                          )
                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: TextField(
                      controller: _searchingController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      onSubmitted: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.black26),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        labelText: 'search for country or city',
                      ),
                    ),
                  )
                ]),
              ),
              Expanded(
                child: TabBar(
                  indicator: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: Colors.white,
                  ),
                  controller: _tabController,
                  tabs: [
                    Center(
                      child: Tab(
                        child: SizedBox(
                          width: getWidth(context) * 0.23,
                          child: const TextMarqueeWidget(
                            child: Text(
                              'Local ESIMs',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Tab(
                        // text: "Regional ESIMs",
                        child: SizedBox(
                          width: getWidth(context) * 0.23,
                          child: const TextMarqueeWidget(
                            child: Text(
                              'Regional ESIMs',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Tab(
                        child: SizedBox(
                          width: getWidth(context) * 0.23,
                          child: const TextMarqueeWidget(
                            child: Text(
                              'Global ESIMs',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                LocalPanel(
                  searchQuery: _searchingController.text,
                ),
                const RegionalPanel(),
                const GlobalPanel()
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
