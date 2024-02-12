import 'package:esim/src/mainpage/controller/main_controllers.dart';
import 'package:esim/src/mainpage/models/countries_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:esim/components/MarqueeWidget.dart';
import 'package:esim/src/mainpage/views/local_details.dart';

import '../../../globals.dart';

class LocalPanel extends StatefulWidget {
  final String searchQuery;
  const LocalPanel({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<LocalPanel> createState() => _LocalPanelState();
}

class _LocalPanelState extends State<LocalPanel> {
  @override
  void initState() {
    // MainController().fetchingAllFlags();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Country?> searchedCountries = [];
    if (widget.searchQuery.isNotEmpty) {
      for (var element in allCountries) {
        if (element.name
            .toLowerCase()
            .contains(widget.searchQuery.toLowerCase().toString())) {
          searchedCountries.add(element);
        }
      }
      Map<String, dynamic> clientCountry = {
        'name': 'Kosovo',
        'flag': 'https://www.svgrepo.com/show/405524/flag-for-flag-kosovo.svg',
        'iso2': 'XK',
        'iso3': 'XXK',
      };
      Country country = Country.fromJson(clientCountry);
      searchedCountries.add(country);
    } else {
      for (var element in allCountries) {
        searchedCountries.add(element);
      }
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: searchedCountries.length,
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
                  searchedCountries[index]!.flag,
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
                        child: Text(searchedCountries[index]!.name.toString()),
                      ),
                      Text(
                        allCountries[index].iso3.toString(),
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
                        countryName: searchedCountries[index]!.name.toString(),
                        countryCode: searchedCountries[index]!.iso3.toString(),
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
}
