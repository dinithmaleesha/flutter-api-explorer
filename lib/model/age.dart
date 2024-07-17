class Age {
  final int? age;

  Age({this.age});

  factory Age.fromJson(Map<String, dynamic> json) {
    return Age(
      age: json['age'] as int?,
    );
  }
}