import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esim/src/profiles/models/simplans_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class ProfileControllers {
  Future<void> editInfo(String userName) async {
    try {
      // Get the current user's ID
      String userId = FirebaseAuth.instance.currentUser!.uid;

      // Update the user's name in the Firestore database
      await FirebaseFirestore.instance
          .collection('User_Credentials')
          .where('user_ID', isEqualTo: userId)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) async {
          await FirebaseFirestore.instance
              .collection('User_Credentials')
              .doc(doc.id)
              .update({'name': userName});
        });
      });
    } catch (error) {
      // print("Error editing user info: $error");
      // Handle the error, e.g., show an error message to the user
    }
  }

  Future<List<SimPlans>> fetchData() async {
    List<SimPlans> allThePlans = [];

    List<String> allSims = [];
    QuerySnapshot<Map<String, dynamic>> docis = await FirebaseFirestore.instance
        .collection('user_eSIMs')
        .where('user_ID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    for (var element in docis.docs) {
      allSims.add(element['ICCID']);
    }
    print(allSims);
    for (var element in allSims) {
      var url = 'https://api.maya.net/connectivity/v1/esim/$element/plans';
      var headers = {
        'Authorization':
            'Basic ZGNHTzZJdVFUbnRoOnRrdmtaaGR1ZzNyamhXQWU4bFRJU1RQV1phSlYyYTZ6THhqaWlWWGxiMXkzVXg2QnVKdExZWVVNdnBxMEhucVI=',
        'Cookie': 'maya=1b73ac5f21115b97c4effe29c5916192'
      };
      try {
        var response = await http.get(Uri.parse(url), headers: headers);
        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          for (var plan in jsonResponse['plans']) {
            SimPlans simPlans = SimPlans.fromJson(plan);
            allThePlans.add(simPlans);
          }
        } else {
          print('Request failed with status: ${response.statusCode}');
        }
      } catch (error) {
        print('Request failed with error: $error');
      }
    }
    return allThePlans;
  }
}
