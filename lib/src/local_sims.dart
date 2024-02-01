import 'dart:io';

import 'package:esim/apiservices/api_services.dart';
import 'package:esim/components/MarqueeWidget.dart';
import 'package:esim/components/drawer.dart';
import 'package:esim/components/global_panel.dart';
import 'package:esim/models/countries_model.dart';
import 'package:esim/models/plans_model.dart';
import 'package:esim/src/helpers.dart';
import 'package:esim/src/local_details.dart';
import 'package:esim/src/regional_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocalSims extends StatefulWidget {
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

  Future<String?> getIpAddress() async {
    try {
      // Get a list of the network interfaces
      List<NetworkInterface> interfaces = await NetworkInterface.list();

      // Iterate through the interfaces and find the one with non-loopback address
      for (var interface in interfaces) {
        for (var addr in interface.addresses) {
          if (!addr.isLoopback) {
            return addr.address; // Return the non-loopback IP address
          }
        }
      }
    } catch (e) {
      print("Error getting IP address: $e");
    }

    return null; // Return null if IP address couldn't be determined
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
      body: FutureBuilder<PlanTypesResponse?>(
          future: ApiServices().fetchingAllPlans(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While data is still being fetched, show a loading indicator.
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // If there's an error in fetching data, display an error message.
              return Text("Error: ${snapshot.error}");
            } else if (!snapshot.hasData || snapshot.data == null) {
              // If there's no data or data is null, handle it appropriately.
              return const Text("No data available");
            }
            PlanTypesResponse planTypesResponse = snapshot.data!;
            List<PlanType> planTypes = planTypesResponse.planTypes;

            return Column(
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
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: SizedBox(
                                        height: 30,
                                        width: 40,
                                        child: SvgPicture.asset(
                                            'images/category.svg',
                                            semanticsLabel: 'Acme Logo'),
                                      )),
                                ),
                                const Text('Hello, User',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                                InkWell(
                                  onTap: () {
                                    getIpAddress();
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(12)),
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
                                borderSide:
                                    const BorderSide(color: Colors.black26),
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
                                child: TextMarqueeWidget(
                                  child: const Text(
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
                                child: TextMarqueeWidget(
                                  child: const Text(
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
                                child: TextMarqueeWidget(
                                  child: const Text(
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
                      Container(
                        constraints: const BoxConstraints(maxHeight: 290),
                        child: FutureBuilder<List<Country>>(
                          future: ApiServices().fetchingAllFlags(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              List<Country> countryPlanning =
                                  snapshot.data ?? [];
                              return ListView.builder(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                itemCount: countryPlanning.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 70,
                                    width: 300,
                                    margin: const EdgeInsets.only(top: 10),
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 20, 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: SvgPicture.network(
                                            countryPlanning[index].flag,
                                          ),
                                          // child: Image.network(
                                          //   countryPlanning[index].flag,
                                          //   fit: BoxFit.cover,
                                          // ),
                                        ),
                                        const SizedBox(width: 10),
                                        SizedBox(
                                          width: 150,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(countryPlanning[index]
                                                  .name
                                                  .toString()),
                                              Text(
                                                countryPlanning[index]
                                                    .iso3
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            fixedSize: const Size(10, 20),
                                            padding: const EdgeInsets.all(0),
                                            backgroundColor:
                                                Colors.grey.shade200,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LocalDetails(),
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.chevron_right,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                      Container(
                        constraints: const BoxConstraints(maxHeight: 290),
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemCount: planTypes.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 70,
                              width: 300,
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade300,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(planTypes[index]
                                            .name
                                            .toString()), // Adjust the region name based on the index
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      fixedSize: const Size(10, 20),
                                      padding: const EdgeInsets.all(0),
                                      backgroundColor: Colors.grey.shade200,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RegionalDetails(),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(child: GlobalPanel())
                    ],
                  ),
                ),
              ],
            );
          }),
    ));
  }
}
