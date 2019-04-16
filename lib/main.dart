import 'package:flutter/material.dart';
import 'package:youtube_favorito/api.dart';
import 'package:youtube_favorito/screens/home.dart';

void main(){
  Api api = Api();
  api.search("eletro");
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube Fav',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}