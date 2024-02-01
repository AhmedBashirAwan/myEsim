import 'package:esim/src/helpers.dart';
import 'package:flutter/material.dart';

class GlobalPanel extends StatefulWidget {
  const GlobalPanel({super.key});

  @override
  State<GlobalPanel> createState() => _GlobalPanelState();
}

class _GlobalPanelState extends State<GlobalPanel> {
  bool global = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: getHeight(context) * 0.05,
                    width: getWidth(context) * 0.8,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (global == true) {
                                  global = false;
                                } else {
                                  global = true;
                                }
                              });
                            },
                            child: Container(
                              color: global == false
                                  ? Colors.black12
                                  : Colors.white,
                              child: const Center(child: Text('Data')),
                            ),
                          ),
                        ),
                        const VerticalDivider(),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (global == true) {
                                  global = false;
                                } else {
                                  global = true;
                                }
                              });
                            },
                            child: Container(
                              color: global == true
                                  ? Colors.black12
                                  : Colors.white,
                              child: const Center(
                                child: Text(
                                  'Data/Calls/Text',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                child: const Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Package Details',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
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
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
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
                                          '126 Countries',
                                          style: TextStyle(
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
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
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
                                          '20 GB',
                                          style: TextStyle(
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
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
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
                                      '15 Days',
                                      style: TextStyle(
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
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: getHeight(context) * 0.05,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: const Center(
                                          child: Text(
                                            'Buy Now',
                                            style:
                                                TextStyle(color: Colors.white),
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
                  const SizedBox(height: 20),
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
                                child: const Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Package Details',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
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
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
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
                                          '126 Countries',
                                          style: TextStyle(
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
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
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
                                          '20 GB',
                                          style: TextStyle(
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
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
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
                                      '15 Days',
                                      style: TextStyle(
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
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: getHeight(context) * 0.05,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: const Center(
                                          child: Text(
                                            'Buy Now',
                                            style:
                                                TextStyle(color: Colors.white),
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
            )
          ],
        ),
      ),
    );
  }
}
