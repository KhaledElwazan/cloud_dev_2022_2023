import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/models/person.dart';
import 'package:flutter_application_1/services/persons_api_service/api_service.dart';

class EditPerson extends StatelessWidget {
  static const String routeName = '/editPerson';
  final Person person;

  EditPerson({super.key, required this.person});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = person.name;
    _emailController.text = person.email;
    _ageController.text = person.age.toString();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          person.name = _nameController.text;
          person.email = _emailController.text;
          person.age = int.parse(_ageController.text);
          APIService()
              .updatePerson(person)
              .then((value) => Navigator.pop(context));
        },
        child: const Icon(Icons.check),
      ),
      appBar: AppBar(
        title: const Text('Edit Person'),
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
