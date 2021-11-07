import 'package:expenditure_tracker/drawer.dart';
//import 'package:awesome_app/utils/constants.dart';
//import 'package:awesome_app/name_card_widget.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'dart:convert';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);
  static const String routeName = "/about";
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  //var myText = "Change My Name";
  //TextEditingController _nameController = TextEditingController();
  var url = "http://127.0.0.1:8000/quizs";
  //"https://jsonplaceholder.typicode.com/photos";

  var data;

  @override
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenditure Tracker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              //Constants.prefs.setBool("loggedIn", false);
              //Navigator.pop(context);
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          "Simple app to calculate and keep track of expenditure",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.indigo[900],
          ),
        ),
      ),
      // body: Center(
      //  child: Padding(
      //    padding: const EdgeInsets.all(16.0),
      //  ),
      //),

      drawer: MyDrawer(),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
