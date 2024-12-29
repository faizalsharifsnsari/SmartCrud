import 'package:flutter/material.dart';
import 'package:frontend/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
Widget build(BuildContext context)
{
  return MaterialApp(
    title: "Server task",
    home: HomePage(),
  );
}
}

