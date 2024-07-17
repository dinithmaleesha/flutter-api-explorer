import 'dart:convert';

import 'package:api_explorer/model/age.dart';
import 'package:api_explorer/model/gender.dart';
import 'package:api_explorer/model/nationality.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseNationalityUrl = 'https://api.nationalize.io/?name=';
  final String baseGenderUrl = 'https://api.genderize.io?name=';
  final String baseAgeUrl = 'https://api.agify.io?name=';
  final String baseCountryDetailsUrl = 'https://restcountries.com/v3.1/alpha/';

  // Fetch Nationality
  Future<Nationality> getNationality(String name) async {
    print('Fetching Nationality...');
    String nationalityUrl = baseNationalityUrl + name;

    final nationalityResponse = await http.get(Uri.parse(nationalityUrl));

    if (nationalityResponse.statusCode == 200) {
      print('Fetching Nationality - Done');
      return Nationality.fromJson(jsonDecode(nationalityResponse.body));
    } else {
      throw Exception('Failed to load nationality');
    }
  }

  // Fetch Gender
  Future<Gender> getGender(String name) async {
    print('Fetching Gender...');
    String genderUrl = baseGenderUrl + name;

    final genderResponse = await http.get(Uri.parse(genderUrl));

    if (genderResponse.statusCode == 200) {
      print('Fetching Gender - Done');
      return Gender.fromJson(jsonDecode(genderResponse.body));
    } else {
      throw Exception('Failed to load gender');
    }
  }

  // Fetch Age
  Future<Age> getAge(String name) async {
    print('Fetching Age...');
    String ageUrl = baseAgeUrl + name;

    final ageResponse = await http.get(Uri.parse(ageUrl));

    if (ageResponse.statusCode == 200) {
      print('Fetching Age - Done');
      return Age.fromJson(jsonDecode(ageResponse.body));
    } else {
      throw Exception('Failed to load age');
    }
  }

  // Fetch Country details
  // Future<CountryDetails> getCountry(String name) async {
  //   print('Fetching CountryDetails...');
  //   String countryDetailsUrl = baseCountryDetailsUrl + name;
  //
  //   final countryDetailsResponse = await http.get(Uri.parse(countryDetailsUrl));
  //
  //   if (countryDetailsResponse.statusCode == 200) {
  //     print('Fetching CountryDetails - Done');
  //     return CountryDetails.fromJson(jsonDecode(countryDetailsResponse.body));
  //   } else {
  //     throw Exception('Failed to load CountryDetails');
  //   }
  // }
}