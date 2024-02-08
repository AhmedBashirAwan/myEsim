import 'dart:convert';
import 'dart:io';
import 'package:esim/src/mainpage/models/countries_model.dart';
import 'package:esim/src/mainpage/models/plans_model.dart';
import 'package:esim/src/mainpage/models/pricingmodel.dart';
import 'package:http/http.dart' as http;

import '../../../globals.dart';

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

      if (response.statusCode == 200) {
        PricingResponse pricingResponse =
            PricingResponse.fromJson(json.decode(response.body));
        return pricingResponse;
      } else {
        throw Exception(
            'Failed to fetch pricing data. Status code: ${response.statusCode}');
      }
    } catch (error) {
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
        // You might want to retry the request or handle it differently
      } else {
        throw Exception('Failed to fetch plan types data. Error: $error');
      }
    }
  }

  Future<void> fetchingAllFlags() async {
    try {
      final response = await http.get(Uri.parse(
          'https://countriesnow.space/api/v0.1/countries/flag/images'));

      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON
        List<dynamic> jsonData = jsonDecode(response.body)['data'];
        // Convert JSON data to list of Country objects
        List<Country> countries =
            jsonData.map((json) => Country.fromJson(json)).toList();
        // Populate the global list with fetched countries
        allCountries.addAll(countries);
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Failed to fetch flags data. Error: $error');
    }
  }
}

List<Map<String, dynamic>> regions = [
  {
    'name': 'Asia',
    'imageUrl':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1LQPmhjirqant2jtNclW0l33_7-rdbUI05g&usqp=CAU',
    'plans': [
      {
        "uid": "DRpvZ2k6ffN3",
        "name": "Asia 1GB - 5 Days",
        "policy_name": "Maximum Data 1GB",
        "data_quota_mb": 1000,
        "validity_days": 5,
      },
      {
        "uid": "CpeP3d6AQ5KH",
        "name": "Asia 3GB - 7 Days",
        "policy_name": "Maximum Data 3GB",
        "data_quota_mb": 3000,
        "validity_days": 7,
      },
      {
        "uid": "XlDeVgOMUoMD",
        "name": "Asia 5GB - 15 Days",
        "policy_name": "Maximum Data 5GB",
        "data_quota_mb": 5000,
        "validity_days": 15,
      },
      {
        "uid": "KQiCXZMM6jR1",
        "name": "Asia 10GB - 30 Days",
        "policy_name": "Maximum Data 10GB",
        "data_quota_mb": 10000,
        "validity_days": 30,
      },
      {
        "uid": "LjS3RDoOl6Vy",
        "name": "Asia 20GB - 30 Days",
        "policy_name": "Maximum Data 20GB",
        "data_quota_mb": 20000,
        "validity_days": 30,
      },
      {
        "uid": "phUoN5ukGcsy",
        "name": "Asia 30GB - 90 Days",
        "policy_name": "Maximum Data 30GB",
        "data_quota_mb": 30000,
        "validity_days": 90,
      },
    ],
    'countries': [
      'Afghanistan',
      'Armenia',
      'Azerbaijan',
      'Bahrain',
      'Bangladesh',
      'Bhutan',
      'Brunei',
      'Cambodia',
      'China',
      'Cyprus',
      'Georgia',
      'India',
      'Indonesia',
      'Iran',
      'Iraq',
      'Israel',
      'Japan',
      'Jordan',
      'Kazakhstan',
      'Kuwait',
      'Kyrgyzstan',
      'Laos',
      'Lebanon',
      'Malaysia',
      'Maldives',
      'Mongolia',
      'Myanmar (Burma)',
      'Nepal',
      'North Korea',
      'Oman',
      'Pakistan',
      'Palestine',
      'Philippines',
      'Qatar',
      'Saudi Arabia',
      'Singapore',
      'South Korea',
      'Sri Lanka',
      'Syria',
      'Taiwan',
      'Tajikistan',
      'Thailand',
      'Timor-Leste (East Timor)',
      'Turkey',
      'Turkmenistan',
      'United Arab Emirates',
      'Uzbekistan',
      'Vietnam',
      'Yemen'
    ]
  },
  {
    'name': 'Europe',
    'imageUrl':
        'https://e7.pngegg.com/pngimages/432/676/png-clipart-europe-map-map-black-white-computer-wallpaper.png',
    'plans': [
      {
        "uid": "oCz8GL00B62D",
        "name": "Europe 1GB - 5 Days",
        "policy_name": "Maximum Data 1GB",
        "data_quota_mb": 1000,
        "validity_days": 5,
      },
      {
        "uid": "4ielxo6KvAfg",
        "name": "Europe 3GB - 7 Days",
        "policy_name": "Maximum Data 3GB",
        "data_quota_mb": 3000,
        "validity_days": 7,
      },
      {
        "uid": "Y0TR4Cz6hkZb",
        "name": "Europe 5GB - 15 Days",
        "policy_name": "Maximum Data 5GB",
        "data_quota_mb": 5000,
        "validity_days": 15,
      },
      {
        "uid": "dMh13YFKmZi4",
        "name": "Europe 10GB - 30 Days",
        "policy_name": "Maximum Data 10GB",
        "data_quota_mb": 10000,
        "validity_days": 30,
      },
      {
        "uid": "vTQwjEqZNIbq",
        "name": "Europe 20GB - 30 Days",
        "policy_name": "Maximum Data 20GB",
        "data_quota_mb": 20000,
        "validity_days": 30,
      },
      {
        "uid": "tANsCqiu8iaJ",
        "name": "Europe 30GB - 90 Days",
        "policy_name": "Maximum Data 30GB",
        "data_quota_mb": 30000,
        "validity_days": 90,
      },
    ],
    'countries': [
      'Albania',
      'Andorra',
      'Armenia',
      'Austria',
      'Azerbaijan',
      'Belarus',
      'Belgium',
      'Bosnia and Herzegovina',
      'Bulgaria',
      'Croatia',
      'Cyprus',
      'Czech Republic',
      'Denmark',
      'Estonia',
      'Finland',
      'France',
      'Georgia',
      'Germany',
      'Greece',
      'Hungary',
      'Iceland',
      'Ireland',
      'Italy',
      'Kazakhstan',
      'Kosovo',
      'Latvia',
      'Liechtenstein',
      'Lithuania',
      'Luxembourg',
      'Malta',
      'Moldova',
      'Monaco',
      'Montenegro',
      'Netherlands',
      'North Macedonia',
      'Norway',
      'Poland',
      'Portugal',
      'Romania',
      'Russia',
      'San Marino',
      'Serbia',
      'Slovakia',
      'Slovenia',
      'Spain',
      'Sweden',
      'Switzerland',
      'Turkey',
      'Ukraine',
      'United Kingdom',
      'Vatican City'
    ]
  },
  // {
  //   'name': 'Africa',
  //   'imageUrl': 'https://c8.alamy.com/comp/GKPJ01/map-of-africa-GKPJ01.jpg',
  //   'countries': [
  //     'Algeria',
  //     'Angola',
  //     'Benin',
  //     'Botswana',
  //     'Burkina Faso',
  //     'Burundi',
  //     'Cabo Verde',
  //     'Cameroon',
  //     'Central African Republic',
  //     'Chad',
  //     'Comoros',
  //     'Democratic Republic of the Congo',
  //     'Djibouti',
  //     'Egypt',
  //     'Equatorial Guinea',
  //     'Eritrea',
  //     'Eswatini',
  //     'Ethiopia',
  //     'Gabon',
  //     'Gambia',
  //     'Ghana',
  //     'Guinea',
  //     'Guinea-Bissau',
  //     'Ivory Coast',
  //     'Kenya',
  //     'Lesotho',
  //     'Liberia',
  //     'Libya',
  //     'Madagascar',
  //     'Malawi',
  //     'Mali',
  //     'Mauritania',
  //     'Mauritius',
  //     'Morocco',
  //     'Mozambique',
  //     'Namibia',
  //     'Niger',
  //     'Nigeria',
  //     'Rwanda',
  //     'Sao Tome and Principe',
  //     'Senegal',
  //     'Seychelles',
  //     'Sierra Leone',
  //     'Somalia',
  //     'South Africa',
  //     'South Sudan',
  //     'Sudan',
  //     'Tanzania',
  //     'Togo',
  //     'Tunisia',
  //     'Uganda',
  //     'Zambia',
  //     'Zimbabwe'
  //   ]
  // },

  {
    'name': 'South America',
    'imageUrl':
        'https://as2.ftcdn.net/v2/jpg/03/12/53/21/1000_F_312532189_mmh8rkLcanEyC6NpC0GmZzShbl9fp5uS.jpg',
    'plans': [
      {
        "uid": "jh40u4Sv9LiU",
        "name": "South America 1GB - 5 Days",
        "policy_name": "Maximum Data 1GB",
        "data_quota_mb": 1000,
        "validity_days": 5,
      },
      {
        "uid": "z3oKLRucUmin",
        "name": "South America 3GB - 7 Days",
        "policy_name": "Maximum Data 3GB",
        "data_quota_mb": 3000,
        "validity_days": 7,
      },
      {
        "uid": "uKfscy5hPwqC",
        "name": "South America 5GB - 15 Days",
        "policy_name": "Maximum Data 5GB",
        "data_quota_mb": 5000,
        "validity_days": 15,
      },
      {
        "uid": "Hh8j8ckRQagI",
        "name": "South America 10GB - 30 Days",
        "policy_name": "Maximum Data 10GB",
        "data_quota_mb": 10000,
        "validity_days": 30,
      },
      {
        "uid": "panwOvEK1S6f",
        "name": "South America 20GB - 30 Days",
        "policy_name": "Maximum Data 20GB",
        "data_quota_mb": 20000,
        "validity_days": 30,
      },
      {
        "uid": "UFZ6yljoQmXC",
        "name": "South America 30GB - 90 Days",
        "policy_name": "Maximum Data 30GB",
        "data_quota_mb": 30000,
        "validity_days": 90,
      },
    ],
    'countries': [
      'Argentina',
      'Bolivia',
      'Brazil',
      'Chile',
      'Colombia',
      'Ecuador',
      'Guyana',
      'Paraguay',
      'Peru',
      'Suriname',
      'Uruguay',
      'Venezuela'
    ]
  },
  {
    'name': 'USA',
    'imageUrl':
        'https://cdn5.vectorstock.com/i/1000x1000/19/84/black-north-america-map-vector-1601984.jpg',
    'plans': [
      {
        "uid": "10Kz1VUQNqYO",
        "name": "USA 1GB - 5 Days",
        "policy_name": "Maximum Data 1GB",
        "data_quota_mb": 1000,
        "validity_days": 5,
      },
      {
        "uid": "4vbJnLz4sWSM",
        "name": "USA 3GB - 7 Days",
        "policy_name": "Maximum Data 3GB",
        "data_quota_mb": 3000,
        "validity_days": 7,
      },
      {
        "uid": "KYoaJvFL7o3n",
        "name": "USA 5GB - 15 Days",
        "policy_name": "Maximum Data 5GB",
        "data_quota_mb": 5000,
        "validity_days": 15,
      },
      {
        "uid": "F7uOuD3cDxMK",
        "name": "USA 10GB - 30 Days",
        "policy_name": "Maximum Data 10GB",
        "data_quota_mb": 10000,
        "validity_days": 30,
      },
      {
        "uid": "5xm5i4QyKIub",
        "name": "USA 20GB - 30 Days",
        "policy_name": "Maximum Data 20GB",
        "data_quota_mb": 20000,
        "validity_days": 30,
      },
      {
        "uid": "Tmjz0E2xn5E9",
        "name": "USA 30GB - 90 Days",
        "policy_name": "Maximum Data 30GB",
        "data_quota_mb": 30000,
        "validity_days": 90,
      },
    ],
    'countries': [
      'Antigua and Barbuda',
      'Bahamas',
      'Barbados',
      'Belize',
      'Canada',
      'Costa Rica',
      'Cuba',
      'Dominica',
      'Dominican Republic',
      'El Salvador',
      'Grenada',
      'Guatemala',
      'Haiti',
      'Honduras',
      'Jamaica',
      'Mexico',
      'Nicaragua',
      'Panama',
      'Saint Kitts and Nevis',
      'Saint Lucia',
      'Saint Vincent and the Grenadines',
      'Trinidad and Tobago',
      'United States'
    ]
  },
  // {
  //   'name': 'Oceania',
  //   'imageUrl':
  //       'https://img.freepik.com/premium-vector/australia-oceania-map-monochrome-australia-icon-vector_189959-318.jpg',
  //   'countries': [
  //     'Australia',
  //     'Fiji',
  //     'Kiribati',
  //     'Marshall Islands',
  //     'Micronesia',
  //     'Nauru',
  //     'New Zealand',
  //     'Palau',
  //     'Papua New Guinea',
  //     'Samoa',
  //     'Solomon Islands',
  //     'Tonga',
  //     'Tuvalu',
  //     'Vanuatu'
  //   ]
  // },
];
