// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esim/src/mainpage/models/countries_model.dart';
import 'package:esim/src/mainpage/models/esim_model.dart';
import 'package:esim/src/mainpage/models/plansType_model.dart';
import 'package:http/http.dart' as http;
import '../../../globals.dart';

class MainController {
  Future<PlanTypesResponse?> fetchingAllPlans() async {
    final url =
        Uri.parse('https://api.maya.net/connectivity/v1/account/plan-types');
    try {
      String username = 'dcGO6IuQTnth';
      String password =
          'tkvkZhdug3rjhWAe8lTISTPWZaJV2a6zLxjiiVXlb1y3Ux6BuJtLYYUMvpq0HnqR';
      String credentials = '$username:$password';
      String base64Credentials = base64Encode(utf8.encode(credentials));
      Map<String, String> headers = {
        'Authorization': 'Basic $base64Credentials',
        'Cookie': 'maya=5afe55837c2ea8dfb6039ad8e1890fa2',
        'Content-Type': 'multipart/form-data',
      };
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        PlanTypesResponse planTypesResponse =
            PlanTypesResponse.fromJson(json.decode(response.body));
        return planTypesResponse;
      } else {
        throw Exception(
            'Failed to fetch plan types data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      if (error is HandshakeException) {
      } else {
        throw Exception('Failed to fetch plan types data. Error: $error');
      }
    }
  }

  Future<List<Map<String, dynamic>>> fetchingPrices() async {
    QuerySnapshot<Map<String, dynamic>> prices =
        await FirebaseFirestore.instance.collection('offers_pricings').get();
    List<Map<String, dynamic>> offers = [];
    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in prices.docs) {
      offers.add(doc.data());
    }
    return offers;
  }

  Future<void> updatingPrice(
      String data, String validationDays, String price) async {
    try {
      QuerySnapshot<Map<String, dynamic>> doc = await FirebaseFirestore.instance
          .collection('offers_pricings')
          .where('data', isEqualTo: data)
          .where('validation_dates', isEqualTo: validationDays)
          .get();

      if (doc.docs.isNotEmpty) {
        DocumentSnapshot<Map<String, dynamic>> firstDoc = doc.docs.first;
        await firstDoc.reference.update({'price': price});
      } else {
        await FirebaseFirestore.instance.collection('offers_pricings').add({
          'data': data,
          'validation_dates': validationDays,
          'price': price,
        });
      }
    } catch (e) {
      print('Error updating price: $e');
    }
  }

  Future<EsimResponse> creatingEsim(String region, String planID) async {
    String data =
        '{ "tag": "", "region": "$region" }'; // Convert data to string

    var headers = {
      'Authorization':
          'Basic ZGNHTzZJdVFUbnRoOnRrdmtaaGR1ZzNyamhXQWU4bFRJU1RQV1phSlYyYTZ6THhqaWlWWGxiMXkzVXg2QnVKdExZWVVNdnBxMEhucVI=',
      'Cookie': 'maya=cca9db59f3f4a2f3d7f9f7b2c074d49f'
    };

    var url = 'https://api.maya.net/connectivity/v1/esim';

    try {
      var response =
          await http.post(Uri.parse(url), headers: headers, body: data);
      if (response.statusCode == 201) {
        EsimResponse parseData =
            EsimResponse.fromJson(jsonDecode(response.body));
        postDataPlan(planID, parseData.esim.iccid);
        return parseData;
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<void> fetchEachFlag() async {
    var url = 'https://api.maya.net/connectivity/v1/account/pricing';
    var headers = {
      'Authorization':
          'Basic ZGNHTzZJdVFUbnRoOnRrdmtaaGR1ZzNyamhXQWU4bFRJU1RQV1phSlYyYTZ6THhqaWlWWGxiMXkzVXg2QnVKdExZWVVNdnBxMEhucVI=',
      'Cookie': 'maya=150809cccfe629416777577b4ea76255'
    };

    try {
      var response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var pricing = jsonData['pricing'];
        List<Country> countries =
            pricing.map<Country>((json) => Country.fromJson(json)).toList();
        allCountries.addAll(countries);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void postDataPlan(String planID, String icciD) async {
    var url = 'https://api.maya.net/connectivity/v1/esim/$icciD/plan/$planID';

    var data = jsonEncode({"ICCID": icciD, "Plan_Id": planID});

    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Basic ZGNHTzZJdVFUbnRoOnRrdmtaaGR1ZzNyamhXQWU4bFRJU1RQV1phSlYyYTZ6THhqaWlWWGxiMXkzVXg2QnVKdExZWVVNdnBxMEhucVI=',
      'Cookie': 'maya=1b73ac5f21115b97c4effe29c5916192'
    };

    var response =
        await http.post(Uri.parse(url), headers: headers, body: data);

    if (response.statusCode == 201) {
      print(jsonDecode(response.body));
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
