import 'package:esim/src/mainpage/controller/main_controllers.dart';
import 'package:esim/components/MarqueeWidget.dart';
import 'package:esim/src/mainpage/models/countries_model.dart';
import 'package:esim/src/mainpage/views/local_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocalPanel extends StatefulWidget {
  const LocalPanel({super.key});

  @override
  State<LocalPanel> createState() => _LocalPanelState();
}

class _LocalPanelState extends State<LocalPanel> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Country>>(
      future: MainController().fetchingAllFlags(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Country> countryPlanning = [];
          snapshot.data!.forEach((element) {
            if (countryPlanning.contains(element) == false) {
              countryPlanning.add(element);
            }
          });
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: countryPlanning.length,
            itemBuilder: (context, index) {
              return Container(
                height: 70,
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SvgPicture.network(
                        countryPlanning[index].flag,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 100,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextMarqueeWidget(
                              child:
                                  Text(countryPlanning[index].name.toString()),
                            ),
                            Text(
                              countryPlanning[index].iso3.toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
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
                            builder: (context) => LocalDetails(
                              countryName:
                                  countryPlanning[index].name.toString(),
                              countryCode:
                                  countryPlanning[index].iso3.toString(),
                            ),
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
    );
  }
}
