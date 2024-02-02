import 'package:esim/src/mainpage/components/regional_panel.dart';
import 'package:esim/components/MarqueeWidget.dart';
import 'package:esim/components/drawer.dart';
import 'package:esim/src/mainpage/components/global_panel.dart';
import 'package:esim/helpers.dart';
import 'package:esim/src/mainpage/components/local_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocalSims extends StatefulWidget {
  const LocalSims({super.key});
  @override
  LocalSimsState createState() => LocalSimsState();
}

class LocalSimsState extends State<LocalSims>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool global = false;
  @override
  void initState() {
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
      backgroundColor:
          const Color.fromRGBO(240, 245, 245, 1), //Color('#f5f5f5'),
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
                          const Text('Hello, User',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
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
              children: const [LocalPanel(), RegionalPanel(), GlobalPanel()],
            ),
          ),
        ],
      ),
    ));
  }
}
