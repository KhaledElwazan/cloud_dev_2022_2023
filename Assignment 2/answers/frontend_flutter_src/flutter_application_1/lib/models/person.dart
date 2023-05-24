import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  String id;
  String name;
  int age;
  String email;
  Gender gender;

  Person(
      {required this.id,
      required this.name,
      required this.age,
      required this.email,
      required this.gender});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);

  @override
  @override
  String toString() =>
      'Person{name: $name}, age:$age, email:$email, gender:${gender.name}';
}

enum Gender { Male, Female }
