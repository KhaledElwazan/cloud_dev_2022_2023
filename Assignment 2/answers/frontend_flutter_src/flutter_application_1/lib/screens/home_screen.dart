import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/person.dart';
import 'package:flutter_application_1/screens/add_person.dart';
import 'package:flutter_application_1/services/persons_api_service/api_service.dart';

import 'edit_person.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Person> persons = [];

  @override
  Widget build(BuildContext context) {
    APIService().getPersons().then((value) => setState(
          () {
            persons = value;
          },
        ));

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddPerson()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: ListView(
        children: persons.map((person) {
          return Card(
            child: ListTile(
              title: Text(person.name),
              subtitle: Text(person.email),
              leading: Text(person.gender.name[0]),
              trailing: SizedBox(
                width: 80,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditPerson(person: person)));
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        APIService().deletePerson(person.id).then(
                              (value) => setState(
                                () {
                                  persons.remove(person);
                                },
                              ),
                            );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
