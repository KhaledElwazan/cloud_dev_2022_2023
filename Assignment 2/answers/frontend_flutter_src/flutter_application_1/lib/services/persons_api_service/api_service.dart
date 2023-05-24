import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/person.dart';
import 'package:flutter_application_1/services/persons_api_service/api_constants.dart';

class APIService {
  static final _dio = Dio();

  Future<List<Person>> getPersons() async {
    final persons =
        await _dio.get(APIConstants.BASE_URL + APIConstants.PERSONS_ENDPOINT);

    List<Person> personsList = [];

    for (var person in persons.data) {
      // print(person);
      personsList.add(Person.fromJson(person));
    }

    return personsList;
  }

  Future<Person> getPerson(String id) async {
    final person = await _dio
        .get("${APIConstants.BASE_URL}${APIConstants.PERSONS_ENDPOINT}/$id");

    return Person.fromJson(person.data);
  }

  Future<Person> createPerson(Person person) async {
    final personCreated = await _dio.post(
        APIConstants.BASE_URL + APIConstants.PERSONS_ENDPOINT,
        queryParameters: person.toJson());

    return Person.fromJson(personCreated.data);
  }

  Future<Person> updatePerson(Person person) async {
    final personUpdated = await _dio.put(
        "${APIConstants.BASE_URL}${APIConstants.PERSONS_ENDPOINT}/${person.id}",
        queryParameters: person.toJson());

    return Person.fromJson(personUpdated.data);
  }

  Future<void> deletePerson(String id) async {
    await _dio.delete(
      "${APIConstants.BASE_URL}${APIConstants.PERSONS_ENDPOINT}/$id",
    );
  }
}
