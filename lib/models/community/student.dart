class Student{
  String? id;
  String username;
  String phoneNumber;
  String password;

  Student({
    required this.username,
    required this.phoneNumber,
    required this.password,
    this.id,
  });
}