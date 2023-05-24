import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/models/person.dart';
import 'package:flutter_application_1/services/persons_api_service/api_service.dart';
import 'package:uuid/uuid.dart';

class AddPerson extends StatelessWidget {
  AddPerson({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Person person;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          person = Person(
              id: const Uuid().v4(),
              name: _nameController.text,
              age: int.parse(_ageController.text),
              email: _emailController.text,
              gender: Gender.Female);

          APIService()
              .createPerson(person)
              .then((value) => Navigator.pop(context));
        },
        child: const Icon(Icons.check),
      ),
      appBar: AppBar(
        title: const Text('Add Person'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                hintText: 'Age',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
