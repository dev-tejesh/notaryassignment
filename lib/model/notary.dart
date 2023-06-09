class Company {
  final int id;
  final String name;

  Company({
    required this.id,
    required this.name,
  });
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'] ?? 0,
      name: json['name'] ,
    );
  }
}
