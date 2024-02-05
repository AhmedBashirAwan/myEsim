import 'package:esim/helpers.dart';
import 'package:esim/src/mainpage/controller/main_controllers.dart';
import 'package:esim/src/mainpage/models/plans_model.dart';
import 'package:flutter/material.dart';

class LocalDetails extends StatefulWidget {
  final String? countryCode;
  final String? countryName;
  const LocalDetails(
      {super.key, required this.countryCode, required this.countryName});

  @override
  State<LocalDetails> createState() => _LocalDetailsState();
}

class _LocalDetailsState extends State<LocalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 245, 245, 1),
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(widget.countryName.toString()),
      ),
      body: FutureBuilder(
        future: MainController().fetchingAllPlans(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.data == null) {
            return const Center(child: Text('No data available'));
          }

          List<PlanType> allPlans = (snapshot.data as dynamic).planTypes;
          List countryPlan = [];
          for (var element in allPlans) {
            if (element.countriesEnabled.contains(widget.countryCode) &&
                countryPlan.contains(element) == false) {
              countryPlan.add(element);
            }
          }
          return ListView.builder(
            itemCount: countryPlan.length,
            itemBuilder: (context, index) {
              PlanType plan = countryPlan[index];

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      width: getWidth(context),
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(24, 91, 255, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    plan.name.toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.lightGreen))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(Icons.signal_wifi_4_bar,
                                              color: Colors.white),
                                          SizedBox(width: 40),
                                          Text(
                                            'Coverage',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        plan.countriesEnabled.length.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 20),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.lightGreen))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(Icons.data_usage,
                                              color: Colors.white),
                                          SizedBox(width: 40),
                                          Text(
                                            'Data',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '${plan.dataQuotaMb / 1000.toInt()} GBs',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 20),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.lightGreen))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(Icons.date_range,
                                          color: Colors.white),
                                      SizedBox(width: 40),
                                      Text(
                                        'Validity',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${plan.validityDays} Days',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 20),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.lightGreen))),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.price_check,
                                          color: Colors.white),
                                      SizedBox(width: 40),
                                      Text(
                                        'Price',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '100',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                height: getHeight(context) * 0.07,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(16)),
                                child: const Center(
                                  child: Text(
                                    'Buy Now',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      child: Container(
                        height: getHeight(context) * 0.1,
                        width: getWidth(context) * 0.34,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
