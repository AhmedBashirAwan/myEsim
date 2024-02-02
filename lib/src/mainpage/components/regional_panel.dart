import 'package:esim/src/regional_details.dart';
import 'package:flutter/material.dart';

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
      itemCount: 10,
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
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Region"
                        // planTypes[index]
                        //   .name
                        //   .toString()
                        ), // Adjust the region name based on the index
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
