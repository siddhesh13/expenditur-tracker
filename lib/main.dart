import 'package:flutter/material.dart';
import 'package:expenditure_tracker/pages/login_page.dart';
import 'package:expenditure_tracker/pages/dashboard.dart';
import 'package:expenditure_tracker/pages/add_expense.dart';
import 'package:expenditure_tracker/pages/about.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //Constants.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        //home: Constants.prefs.getBool("loggedIn") == true
        //   ? HomePage()
        //  : LoginPage(),
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        routes: {
          // LoginPage.routeName: (context) => LoginPage(),
          LoginPage.routeName: (context) => LoginPage(),
          HomePage.routeName: (context) => HomePage(),
          Dashboard.routeName: (context) => Dashboard(),
          AboutPage.routeName: (context) => AboutPage(),
          //SuccessPage.routeName: (context) => SuccessPage(),
        });
  }
}
