import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String name;
  final int age;
  final String phone;

  const UserModel({
    this.id,
    required this.name,
    required this.age,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      age: map['age'],
      phone: map['phone'],
    );
  }

  @override
  List<Object?> get props => [id, name, age, phone];
}
