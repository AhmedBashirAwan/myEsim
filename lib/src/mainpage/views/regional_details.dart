import 'package:esim/globals.dart';
import 'package:esim/src/auth/views/registeration.dart';
import 'package:esim/src/mainpage/controller/lists_controller.dart';
import 'package:esim/src/mainpage/controller/main_controllers.dart';
import 'package:esim/src/mainpage/models/esim_model.dart';
import 'package:esim/src/qrscreens/controllers/stripe_controllers.dart';
import 'package:esim/src/qrscreens/views/qr_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegionalDetails extends StatefulWidget {
  final String regionName;

  const RegionalDetails({super.key, required this.regionName});

  @override
  State<RegionalDetails> createState() => _RegionalDetailsState();
}

class _RegionalDetailsState extends State<RegionalDetails> {
  bool adminUser = false;
  TextEditingController rate = TextEditingController();

  Future<void> checkingForAdmin() async {
    if (FirebaseAuth.instance.currentUser != null &&
            FirebaseAuth.instance.currentUser!.email ==
                'artan.blakqori@gmail.com'
        // 'ahmedbashirawan@gmail.com'
        ) {
      setState(() {
        adminUser = true;
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
        title: Text(widget.regionName),
      ),
      body: FutureBuilder(
        future: MainController().fetchingPrices(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          var prices = snapshot.data as List<Map<String, dynamic>>;
          return Container(
            alignment: Alignment.center,
            child: ListView.builder(
              itemCount: regions
                  .firstWhere(
                      (region) => region['name'] == widget.regionName)['plans']
                  .length,
              itemBuilder: (context, index) {
                var plans = regions.firstWhere(
                    (region) => region['name'] == widget.regionName)['plans'];
                int coverage = regions
                    .firstWhere((region) =>
                        region['name'] == widget.regionName)['countries']
                    .length;

                String price = prices.firstWhere((element) {
                  return int.parse(element['data']) ==
                      plans[index]['data_quota_mb'];
                }, orElse: () {
                  return {'price': 'N/A'};
                })['price'];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: getWidth(context),
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          plans[index]['name'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 20, 10),
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
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '${coverage.toString()} countries',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 20, 20),
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
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '${plans[index]['data_quota_mb'] / 1000}GB',
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
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 20),
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
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "${plans[index]['validity_days'].toString()} days",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 20),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.lightGreen))),
                                    child: Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Row(
                                          children: [
                                            Icon(Icons.price_check,
                                                color: Colors.white),
                                            SizedBox(width: 40),
                                            Text(
                                              'Price',
                                              style: TextStyle(
                                                  color: Colors.white),
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
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Enter new rates'),
                                                        content: TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          controller: rate,
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () {
                                                              MainController().updatingPrice(
                                                                  plans[index][
                                                                          'data_quota_mb']
                                                                      .toString(),
                                                                  plans[index][
                                                                          'validity_days']
                                                                      .toString(),
                                                                  rate.text
                                                                      .trim());

                                                              setState(() {});
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: const Text(
                                                                'Update'),
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
                                        Text(
                                          '\$$price',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () async {
                                              if (FirebaseAuth.instance
                                                          .currentUser !=
                                                      null &&
                                                  FirebaseAuth
                                                      .instance
                                                      .currentUser!
                                                      .uid
                                                      .isNotEmpty) {
                                                await StripePaymentHandle()
                                                    .payment(
                                                  context: context,
                                                  amount: '${price}00',
                                                  planUid: plans[index]['uid'],
                                                  regionName: widget.regionName,
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
                                              height: getHeight(context) * 0.05,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                              child: const Center(
                                                child: Text(
                                                  'Buy Now',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
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
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
