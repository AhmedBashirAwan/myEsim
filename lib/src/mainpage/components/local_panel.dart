import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:esim/components/MarqueeWidget.dart';
import 'package:esim/src/mainpage/views/local_details.dart';

import '../controller/lists_controller.dart';

class LocalPanel extends StatefulWidget {
  final String searchQuery;
  const LocalPanel({super.key, required this.searchQuery});

  @override
  State<LocalPanel> createState() => _LocalPanelState();
}

class _LocalPanelState extends State<LocalPanel> {
  @override
  void initState() {
    eachCountries;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> searchedCountries = [];
    if (widget.searchQuery.isNotEmpty) {
      for (var element in eachCountries) {
        if (element['region_name']
            .toLowerCase()
            .contains(widget.searchQuery.toLowerCase())) {
          searchedCountries.add(element);
        }
      }
    } else {
      searchedCountries.addAll(eachCountries);
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
                  'https://flagcdn.com/${searchedCountries[index]['region_iso2']}.svg',
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
                        child: Text(
                            searchedCountries[index]['region_name'].toString()),
                      ),
                      Text(
                        searchedCountries[index]['region_iso3'].toString(),
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
                        iso2:
                            searchedCountries[index]['region_iso2'].toString(),
                        countryName:
                            searchedCountries[index]['region_name'].toString(),
                        countryCode:
                            searchedCountries[index]['region_iso3'].toString(),
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
