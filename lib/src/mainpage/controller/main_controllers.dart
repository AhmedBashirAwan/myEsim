import 'dart:convert';
import 'dart:io';
import 'package:esim/src/mainpage/models/countries_model.dart';
import 'package:esim/src/mainpage/models/plans_model.dart';
import 'package:esim/src/mainpage/models/pricingmodel.dart';
import 'package:http/http.dart' as http;

class MainController {
  Future<PricingResponse> fetchingPricing() async {
    final url =
        Uri.parse('https://api.maya.net/connectivity/v1/account/pricing');

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

      print('Response: ${response.statusCode} - ${response.body}');
      if (response.statusCode == 200) {
        print('Data fetched successfully: ${response.body}');

        PricingResponse pricingResponse =
            PricingResponse.fromJson(json.decode(response.body));
        return pricingResponse;
      } else {
        print('Unexpected status code: ${response.statusCode}');
        throw Exception(
            'Failed to fetch pricing data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching pricing data: $error');
      throw Exception('Failed to fetch pricing data. Error: $error');
    }
  }

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

      // print('Response: ${response.statusCode} - ${response.body}');
      if (response.statusCode == 200) {
        // Check if response data is not null before parsing

        PlanTypesResponse planTypesResponse =
            PlanTypesResponse.fromJson(json.decode(response.body));
        return planTypesResponse;
      } else {
        // print('Unexpected status code: ${response.statusCode}');
        throw Exception(
            'Failed to fetch plan types data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      if (error is HandshakeException) {
        // Handle HandshakeException
        print('HandshakeException: $error');
        // You might want to retry the request or handle it differently
      } else {
        // Handle other exceptions
        print('Error fetching plan types data: $error');
        throw Exception('Failed to fetch plan types data. Error: $error');
      }
    }
  }

  Future<List<Country>> fetchingAllFlags() async {
    final response = await http.get(
        Uri.parse('https://countriesnow.space/api/v0.1/countries/flag/images'));

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      List<dynamic> jsonData = jsonDecode(response.body)['data'];
      List<Country> countries =
          jsonData.map((json) => Country.fromJson(json)).toList();

      return countries;
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
