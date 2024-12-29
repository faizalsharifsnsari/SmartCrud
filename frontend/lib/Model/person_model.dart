class Person {
  final String? id;
  final String? name;
  final String? phone;
  final String? age;
  final String? email;

  Person({
    required this.name,
    required this.phone,
    required this.age,
    required this.email, 
    required this.id // Ensure this matches the field in the JSON
  });
}
