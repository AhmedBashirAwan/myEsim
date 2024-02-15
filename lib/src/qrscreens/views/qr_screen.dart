import 'package:esim/globals.dart';
import 'package:esim/src/qrscreens/controllers/stripe_controllers.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:esim/src/mainpage/models/esim_model.dart'; // Import EsimResponse

class QrScreen extends StatefulWidget {
  final Future<EsimResponse>? esim; // Declare esim as a Future
  const QrScreen({Key? key, this.esim}) : super(key: key);

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen>
    with SingleTickerProviderStateMixin {
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
                        child: const Text(
                          'Current ESIMs',
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        width: getWidth(context) * 0.23,
                        child: const Text(
                          'Archived ESIMs',
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      FutureBuilder<EsimResponse>(
                        future:
                            widget.esim, // Use widget.esim to access the future
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            // Once the future completes, you can access the data
                            final esimResponse = snapshot.data!;
                            return Material(
                              elevation: 20,
                              borderRadius: BorderRadius.circular(12),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SizedBox(
                                    height: getHeight(context) * 0.3,
                                    child: PrettyQrView.data(
                                      data: esimResponse.esim
                                          .activationCode, // Use activationCode here
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const Center(child: Text('No data available'));
                          }
                        },
                      ),
                      FutureBuilder<EsimResponse>(
                        future:
                            widget.esim, // Use widget.esim to access the future
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            final esimResponse = snapshot.data!;
                            print(esimResponse.esim.activationCode);
                            return Material(
                              elevation: 20,
                              borderRadius: BorderRadius.circular(12),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SizedBox(
                                    height: getHeight(context) * 0.3,
                                    child: PrettyQrView.data(
                                      data: esimResponse.esim
                                          .activationCode, // Use activationCode here
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const Center(child: Text('No data available'));
                          }
                        },
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    StripePaymentHandle().payment();
                  },
                  child: const Text('Payment'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
