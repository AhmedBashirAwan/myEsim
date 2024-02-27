import 'package:esim/src/plans/controller/plans_controller.dart';
import 'package:flutter/material.dart';
import '../../../globals.dart';

class Plans extends StatefulWidget {
  const Plans({Key? key}) : super(key: key);

  @override
  State<Plans> createState() => _PlansState();
}

class _PlansState extends State<Plans> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'My eSIMs',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
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
                        child: const Text('Current ESIMs'),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        width: getWidth(context) * 0.23,
                        child: const Text('Archived ESIMs'),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      FutureBuilder<List<String>>(
                        future: PlanControllers().userEsims(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            List<String>? currentSims = snapshot.data;
                            return ListView.builder(
                              itemCount: currentSims!.length,
                              itemBuilder: (context, index) {
                                return FutureBuilder(
                                  future: PlanControllers()
                                      .getEachSim(currentSims[index]),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center();
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else if (snapshot.hasData) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10, right: 5, left: 5),
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          elevation: 8,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Container(
                                              height: getHeight(context) * 0.25,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      "Activation Code = ${snapshot.data!.activationCode.toString()}"),
                                                  Text(
                                                      "Date Assigned = ${snapshot.data!.dateAssigned.toString()}"),
                                                  Text(
                                                      "ICCID = ${snapshot.data!.iccid.toString()}"),
                                                  Text(
                                                      "Current Status = ${snapshot.data!.serviceStatus.toString()}"),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const Text('No data available');
                                    }
                                  },
                                );
                              },
                            );
                          } else {
                            return const Center(
                                child: Text('No data available'));
                          }
                        },
                      ),
                      Container(), // Placeholder for Archived ESIMs
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
