import 'package:flutter/material.dart';
import 'package:frontend/Services/Api.dart';  // Make sure the correct path is used
import 'package:frontend/Model/person_model.dart';
import 'package:frontend/editscreen.dart';  // Correct path for Person model

class Updatescreen extends StatefulWidget {
  @override
  _UpdatescreenState createState() => _UpdatescreenState();
}

class _UpdatescreenState extends State<Updatescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Display Data")),
      body: FutureBuilder<List<Person>>(
        future: Api.getperson(),  // Use the correct method that returns Future<List<Person>>
        builder: (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
          // Handle different states of the Future (loading, error, and data)
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show loading spinner while fetching
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}")); // Handle errors
          }

          if (snapshot.hasData) {
            List<Person> pdata = snapshot.data!; // Extract the list of people from the snapshot

            // Return a ListView of ListTiles with the person data
            return ListView.builder(
              itemCount: pdata.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.person_2_rounded, size: 35),
                    title: Text("Name: ${pdata[index].name}"),
                    subtitle: Text("Phone: ${pdata[index].phone},Age: ${pdata[index].age}"),
                    trailing: IconButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Editscreen(data: pdata[0])));
                    }, icon: Icon(Icons.edit)),
                  ),
                );
              },
            );
          }

          // In case no data was found (rare, since snapshot.hasData should be true)
          return Center(child: Text("No data found"));
        },
      ),
    );
  }
}
