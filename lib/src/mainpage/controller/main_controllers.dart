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

List<Map<String, dynamic>> regions = [
  {
    'name': 'Asia',
    'imageUrl':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1LQPmhjirqant2jtNclW0l33_7-rdbUI05g&usqp=CAU'
  },
  {
    'name': 'Europe',
    'imageUrl':
        'https://e7.pngegg.com/pngimages/432/676/png-clipart-europe-map-map-black-white-computer-wallpaper.png'
  },
  {
    'name': 'Africa',
    'imageUrl': 'https://c8.alamy.com/comp/GKPJ01/map-of-africa-GKPJ01.jpg'
  },
  {
    'name': 'South America',
    'imageUrl':
        'https://as2.ftcdn.net/v2/jpg/03/12/53/21/1000_F_312532189_mmh8rkLcanEyC6NpC0GmZzShbl9fp5uS.jpg'
  },
  {
    'name': 'North America',
    'imageUrl':
        'https://cdn5.vectorstock.com/i/1000x1000/19/84/black-north-america-map-vector-1601984.jpg'
  },
  {
    'name': 'Oceania',
    'imageUrl':
        'https://img.freepik.com/premium-vector/australia-oceania-map-monochrome-australia-icon-vector_189959-318.jpg'
  },
  {
    'name': 'Antarctica',
    'imageUrl':
        'https://www.shutterstock.com/image-vector/map-antarctic-silhouette-260nw-577881580.jpg'
  },
];
