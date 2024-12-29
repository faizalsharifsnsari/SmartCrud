import 'package:flutter/material.dart';
import 'package:frontend/create.dart';
import 'package:frontend/deletedata.dart';
import 'package:frontend/displaydata.dart';
import 'package:frontend/updatedata.dart';

class HomePage extends StatefulWidget
{
  const HomePage({super.key});

@override
  HomePageState createState()
{
  return HomePageState();
}
}

class HomePageState extends State<HomePage>
{
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
             ElevatedButton.icon(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CreateScreen()));
             },
             icon: Icon(Icons.create), label: Text("CREATE")),
             Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton.icon(onPressed: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Displaydata()));
              },
             icon: Icon(Icons.read_more_rounded), label: Text("READ")),
             Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton.icon(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Updatescreen()));
              },
             icon: Icon(Icons.update_disabled_rounded), label: Text("UPDATE")),
             Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton.icon(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>deletedata()));
              },
             icon: Icon(Icons.delete_outline_rounded), label: Text("DELETE"))
            ],
          ),
        )
        ],
      ),
    ),
    
  );
 }
  }
