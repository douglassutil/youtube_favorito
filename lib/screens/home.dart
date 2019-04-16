
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25.0,
          child: Image.asset("images/yt_logo_rgb_dark.png"),
        ),
        elevation: 0.0,
        backgroundColor: Colors.black,
        actions: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Text("0"),
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: (){},
          ), 
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),          
        ],
      ),
    );
  }
}