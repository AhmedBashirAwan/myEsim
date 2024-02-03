import 'package:esim/src/mainpage/controller/main_controllers.dart';
import 'package:esim/src/mainpage/views/regional_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegionalPanel extends StatefulWidget {
  const RegionalPanel({super.key});

  @override
  State<RegionalPanel> createState() => _RegionalPanelState();
}

class _RegionalPanelState extends State<RegionalPanel> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: regions.length,
      itemBuilder: (context, index) {
        return Container(
          height: 70,
          width: 300,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(
                  regions[index]['imageUrl'],
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(regions[index]['name']),
                  ],
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
                      builder: (context) => RegionalDetails(),
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
