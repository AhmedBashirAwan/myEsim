import 'package:esim/helpers.dart';
import 'package:flutter/material.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // Changed length to 2
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Money',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'US \$149',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Row(
                    children: [
                      Text(
                        'My eSIMs',
                        style: TextStyle(
                          fontSize: 20,
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
                    color: Colors.white,
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
                    children: const [
                      Center(child: Text('Current')),
                      Center(child: Text('Archive')),
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
