import 'package:esim/src/auth/views/registeration.dart';
import 'package:esim/src/mainpage/controller/main_controllers.dart';
import 'package:esim/src/mainpage/models/esim_model.dart';
import 'package:esim/src/mainpage/models/plans_model.dart';
import 'package:esim/src/qrscreens/views/qr_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LocalDetails extends StatefulWidget {
  final String? countryCode;
  final String countryName;
  final String iso2;
  const LocalDetails({
    Key? key,
    required this.countryCode,
    required this.countryName,
    required this.iso2,
  }) : super(key: key);

  @override
  State<LocalDetails> createState() => _LocalDetailsState();
}

class _LocalDetailsState extends State<LocalDetails> {
  bool adminUser = false;

  TextEditingController rate = TextEditingController();

  Future<void> checkingForAdmin() async {
    if (FirebaseAuth.instance.currentUser != null &&
        FirebaseAuth.instance.currentUser!.email ==
            'artan.blakqori@gmail.com') {
      setState(() {
        adminUser = true;
        print('Admin access given');
      });
    } else {
      setState(() {
        adminUser = false;
      });
    }
  }

  @override
  void initState() {
    checkingForAdmin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 245, 245, 1),
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(widget.countryName),
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
          allPlans;
          List<PlanType> countryPlan = [];
          for (var element in allPlans) {
            if (element.countriesEnabled.contains(widget.countryCode)) {
              if (!countryPlan.contains(element)) {
                if (element.name
                    .toLowerCase()
                    .contains(widget.countryName.toLowerCase())) {
                  countryPlan.add(element);
                }
              }
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
                      width: MediaQuery.of(context).size.width,
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
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
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
                                        color: Colors.lightGreen,
                                      ),
                                    ),
                                  ),
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
                                          fontWeight: FontWeight.w800,
                                        ),
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
                                        color: Colors.lightGreen,
                                      ),
                                    ),
                                  ),
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
                                        '${plan.dataQuotaMb / 1000} GBs',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 20),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.lightGreen,
                                  ),
                                ),
                              ),
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
                                      fontWeight: FontWeight.w800,
                                    ),
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
                                    color: Colors.lightGreen,
                                  ),
                                ),
                              ),
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(Icons.date_range,
                                          color: Colors.white),
                                      SizedBox(width: 40),
                                      Text(
                                        'Price',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Visibility(
                                      visible: adminUser,
                                      child: InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Enter new rates'),
                                                  content: TextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: rate,
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        MainController()
                                                            .updatingPrice(
                                                                plan.dataQuotaMb
                                                                    .toString(),
                                                                plan.validityDays
                                                                    .toString(),
                                                                rate.text
                                                                    .trim());
                                                        setState(() {});
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child:
                                                          const Text('Update'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                            size: 20,
                                          ))),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  FutureBuilder(
                                    future: MainController().fetchingPrices(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Text(
                                          'Loading...',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text(
                                          'Error: ${snapshot.error}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        );
                                      } else {
                                        var prices = snapshot.data
                                            as List<Map<String, dynamic>>;
                                        var price = prices.firstWhere(
                                          (element) =>
                                              int.parse(element['data']) ==
                                              plan.dataQuotaMb,
                                          orElse: () => plan.dataQuotaMb == 1024
                                              ? {'price': '5'}
                                              : {'price': 'N/A'},
                                        )['price'];
                                        return Text(
                                          '\$${price.toString()}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: InkWell(
                                onTap: () {
                                  if (FirebaseAuth.instance.currentUser !=
                                          null &&
                                      FirebaseAuth.instance.currentUser!.uid
                                          .isNotEmpty) {
                                    Future<EsimResponse> esimResponse =
                                        MainController()
                                            .creatingEsim(widget.iso2);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            QrScreen(esim: esimResponse),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Registeration(),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Buy Now',
                                      style: TextStyle(color: Colors.white),
                                    ),
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
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.34,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(16),
                        ),
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
