
import 'package:esim/src/mainpage/models/countries_model.dart';
import 'package:flutter/material.dart';

getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

List<Country> allCountries = [];
