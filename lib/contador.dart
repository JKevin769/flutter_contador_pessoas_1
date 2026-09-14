import 'package:flutter/material.dart';
import 'package:flutter_contador_pessoas_1/conter_pager.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
@override
Widget build(BuildContext context){
  return MaterialApp(
    title:'contador simples',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home:const CounterPage(),
  );
  }
}





