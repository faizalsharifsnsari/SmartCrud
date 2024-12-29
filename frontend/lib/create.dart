import 'package:flutter/material.dart';
import 'package:frontend/Services/Api.dart';

class CreateScreen extends StatefulWidget
{
  const CreateScreen({super.key});

@override
  CreateScreenState createState()
{
  return CreateScreenState();
}
}

class CreateScreenState extends State<CreateScreen>
{
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var contactController = TextEditingController();
  var gmailController = TextEditingController();
  @override

  @override
 Widget build(BuildContext context)
 {
  return Scaffold(
    body: Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blueAccent,
                Colors.greenAccent
              ])
            ),
          
          ),
          Container(
            padding: EdgeInsets.only(left: 500,top: 20),
            child: Text("CREATE",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),),
          
            
          ),
          Container(
             margin: EdgeInsets.symmetric(vertical: 100,horizontal: 50),
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 100,horizontal: 50),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white54
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 75,right: 75),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Enter Name",
                      hintStyle: TextStyle(
                        color: Colors.blue
                      )
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 75,right: 75),
                  child: TextField(
                    controller: ageController,
                    decoration: InputDecoration(
                      hintText: "Enter Age",
                      hintStyle: TextStyle(
                        color: Colors.blue
                      )
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 75,right: 75),
                  child: TextField(
                    controller: contactController,
                    decoration: InputDecoration(
                      hintText: "Enter Phone no",
                      hintStyle: TextStyle(
                        color: Colors.blue
                      )
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 75,right: 75),
                  child: TextField(
                    controller: gmailController,
                    decoration: InputDecoration(
                      hintText: "Enter gmail",
                      hintStyle: TextStyle(
                        color: Colors.blue
                      )
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                ElevatedButton(onPressed: (){
                  var data =
                   
                   {
                    "pname":nameController.text,
                    "pAge":ageController.text,
                    "pphone":contactController.text,
                    "pgmail":gmailController.text,

                  
                   };
                   Api.addPerson(data);
                }, child: Text("SUBMIT BUTTON"))
              ],
            ),
          )
       
        ],
      ),
    ),
    
  );
 }
  }
