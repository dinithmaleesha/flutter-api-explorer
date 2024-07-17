class Gender {
  final String name;
  final String gender;
  final double probability;

  Gender({required this.name, required this.gender, required this.probability});

  factory Gender.fromJson(Map<String, dynamic> json) {
    return Gender(
      name: json['name'] ?? '',
      gender: json['gender'] ?? '',
      probability: (json['probability'] as num?)?.toDouble() ?? 0.0,
    );
  }
}