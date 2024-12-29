import 'dart:convert';

import 'package:frontend/Model/person_model.dart';  // Make sure the correct path is used
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://localhost:3000/api/";

  // Post API to add a person
  static addPerson(Map pdata) async {
    print("Sending data: $pdata");
    var url = Uri.parse("${baseUrl}add_person");

    try {
      final res = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(pdata),
      );

      print("Response Status Code: ${res.statusCode}");
      print("Response Body: ${res.body}");

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print("Response Data: $data");
      } else {
        print("Failed to upload data. Status code: ${res.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }

  // Get API to fetch the list of people
  static Future<List<Person>> getperson() async {
    List<Person> person = [];
    var url = Uri.parse(baseUrl + "get_person");

    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print(data);

        // Parse the 'person' data and convert it to a list of Person objects
        data['person']?.forEach((value) {
          person.add(
            Person(
              name: value['pname'],
              phone: value['pphone'],
              age: value['pAge'],
              email: value['pgmail'],
              id: value['id'].toString(), // Adjusted to match the field in the JSON
            ),
          );
        });

        return person;
      } else {
        print("Failed to fetch data. Status code: ${res.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
    }

    return person; // Return an empty list in case of error
  }

 static updatePerson(String id, Map<String, dynamic> body1) async {
  var url = Uri.parse(baseUrl + "update/$id");
  print("Sending request to: $url with body: $body1"); // Debug print

  try {
    final res = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body1),
    );

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print("Updated person data: $data");
    } else {
      print("Failed to update data. Status code: ${res.statusCode}");
    }
  } catch (e) {
    print("Error occurred: $e");
  }
}


}

//update api


