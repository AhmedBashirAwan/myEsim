import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esim/src/plans/models/eachplan_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class PlanControllers {
  Future<List<String>> userEsims() async {
    List<String> allSims = [];
    QuerySnapshot<Map<String, dynamic>> docis = await FirebaseFirestore.instance
        .collection('user_eSIMs')
        .where('user_ID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    for (var element in docis.docs) {
      allSims.add(element['ICCID']);
    }
    return allSims;
  }

  Future<EachSimResponse?> getEachSim(String iccid) async {
    var url = 'https://api.maya.net/connectivity/v1/esim/$iccid';

    var headers = {
      'Authorization':
          'Basic ZGNHTzZJdVFUbnRoOnRrdmtaaGR1ZzNyamhXQWU4bFRJU1RQV1phSlYyYTZ6THhqaWlWWGxiMXkzVXg2QnVKdExZWVVNdnBxMEhucVI=',
      'Cookie': 'maya=1b73ac5f21115b97c4effe29c5916192'
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      // Parse the response body as JSON
      var jsonResponse = jsonDecode(response.body);
      // Extract the "esim" portion from the JSON response
      var esimJson = jsonResponse['esim'];
      // Parse the "esim" portion using EachSimResponse.fromJson constructor
      return EachSimResponse.fromJson(esimJson);
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }
}
