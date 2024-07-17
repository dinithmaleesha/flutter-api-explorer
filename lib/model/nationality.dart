class Nationality {
  final List<Country> country;

  Nationality({required this.country});

  factory Nationality.fromJson(Map<String, dynamic> json) {
    var countryList = json['country'] as List;
    List<Country> countryObjects = countryList.map((c) => Country.fromJson(c)).toList();

    return Nationality(
      country: countryObjects,
    );
  }
}

class Country {
  final String countryId;
  final double probability;

  Country({required this.countryId, required this.probability});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryId: json['country_id'] ?? '',
      probability: (json['probability'] as num?)?.toDouble() ?? 0.0,
    );
  }
}