import 'package:expenditure_tracker/drawer.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:expenditure_tracker/pages/dashboard.dart';
//import 'package:awesome_app/pages/success.dart';
//import 'package:awesome_app/utils/constants.dart';
//import 'package:awesome_app/name_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = "/AddExpense";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _itemnameController = TextEditingController();
  TextEditingController _unitpriceController = TextEditingController();
  CollectionReference expense =
      FirebaseFirestore.instance.collection('expense');

  //String dropdownValue = '1';
  String category = '';
  String totalPrice = "";
  String itemName = "";
  String employeeName = "";
  String quantity = "";
  String team = "";
  String unitPrice = "";

  //bool _validate = false;
  bool nameValidate = false;
  bool itemnameValidate = false;
  bool priceValidate = false;
  bool totalPriceVisible = false;
  bool isVisible = false;
  bool validateTextField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        nameValidate = true;
      });
      return false;
      // ignore: unrelated_type_equality_checks
    } else {
      setState(() {
        nameValidate = false;
      });
    }
    return true;
  }

  bool validateItemField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        itemnameValidate = true;
      });
      return false;
      // ignore: unrelated_type_equality_checks
    } else {
      setState(() {
        itemnameValidate = false;
      });
    }
    return true;
  }

  bool validatePriceField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        priceValidate = true;
      });
      return false;
      // ignore: unrelated_type_equality_checks
    } else {
      setState(() {
        priceValidate = false;
      });
    }
    return true;
  }

  String showTotalPrice(String unitPrice, String quantity) {
    var unit = int.parse(unitPrice);
    var quant = int.parse(quantity);
    isVisible = true;
    print("hello");
    print((quant * unit).toString());
    return (quant * unit).toString();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference expenses =
        FirebaseFirestore.instance.collection("expense");
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenditure Tracker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              //  Constants.prefs.setBool("loggedIn", false);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Enter Expense Details here',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 500,
                          padding: EdgeInsets.only(left: 40.0, right: 40.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _usernameController,
                                  keyboardType: TextInputType.text,
                                  //obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Your Full Name Here',
                                    labelText: 'Full Name',
                                    errorText: nameValidate
                                        ? 'Enter your full name'
                                        : null,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF6200EE)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextDropdownFormField(
                                  options: [
                                    "HR Team",
                                    "Development Team",
                                    "Management Team"
                                  ],
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.arrow_drop_down),
                                      labelText: "Select Team"),
                                  dropdownHeight: 120,
                                  onChanged: (dynamic str) {
                                    setState(() {
                                      team = str;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _itemnameController,
                                  keyboardType: TextInputType.text,
                                  //obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Item name',
                                    labelText: ' Item Name',
                                    errorText:
                                        nameValidate ? 'Enter item name' : null,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF6200EE)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextDropdownFormField(
                                  options: [
                                    "Stationary",
                                    "Infrastructure",
                                    "Travelling"
                                  ],
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.arrow_drop_down),
                                      labelText: "Category"),
                                  dropdownHeight: 120,
                                  onChanged: (dynamic str) {
                                    setState(() {
                                      category = str;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _unitpriceController,
                                  keyboardType: TextInputType.number,
                                  //obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Enter unit price',
                                    labelText: ' Unit price',
                                    errorText: nameValidate
                                        ? 'Enter unit price'
                                        : null,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF6200EE)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextDropdownFormField(
                                  options: [
                                    "1",
                                    "2",
                                    "3",
                                    "4",
                                    "5",
                                    "6",
                                    "7",
                                    "8",
                                    "9",
                                    "10",
                                    "20",
                                    "30",
                                    "40",
                                    "50",
                                    "100",
                                  ],
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.arrow_drop_down),
                                      labelText: "Quantity"),
                                  dropdownHeight: 120,
                                  onChanged: (dynamic str) {
                                    setState(() {
                                      quantity = str;
                                      totalPriceVisible = true;
                                      totalPrice =
                                          showTotalPrice(unitPrice, quantity);
                                      isVisible = true;
                                      print("totalPrice");
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Visibility(
                                  visible: isVisible,
                                  child: Text(totalPrice),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          4.0, 0.0, 4.0, 0.0),
                                      child: Visibility(
                                        visible: isVisible,
                                        child: Text("hi"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green, // background
                                    onPrimary: Colors.white, // foreground
                                    shape: RoundedRectangleBorder(
                                        //to set border radius to button
                                        borderRadius: BorderRadius.circular(4)),
                                    padding: EdgeInsets.fromLTRB(
                                        75.0, 14.0, 75.0, 16.0),
                                  ),
                                  onPressed: () async {
                                    validateTextField(_usernameController.text);
                                    validateTextField(_itemnameController.text);
                                    validateTextField(
                                        _unitpriceController.text);
                                    if (nameValidate == false &&
                                        itemnameValidate == false &&
                                        priceValidate == false) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              "sending data to cloud firestore"),
                                        ),
                                      );
                                      expenses
                                          .add({
                                            'name': _usernameController.text,
                                            'team': team,
                                            'itemName':
                                                _itemnameController.text,
                                            'category': category,
                                            'unitPrice':
                                                _unitpriceController.text,
                                            'quantity': quantity,
                                            'totalPrice': int.parse(quantity) *
                                                int.parse(
                                                    _unitpriceController.text),
                                          })
                                          .then((value) => print('data added'))
                                          .catchError((error) => print(
                                              "failed to add data: $error"));
                                      print(_usernameController.text);
                                      print(team);
                                      print(_itemnameController.text);
                                      print(category);
                                      print(quantity);
                                      print(_unitpriceController.text);
                                      print(int.parse(quantity) *
                                          int.parse(_unitpriceController.text));
                                      Navigator.pushNamed(
                                        context,
                                        Dashboard.routeName,
                                      );
                                    }
                                  },
                                  child: Text(
                                    'SUBMIT',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ),
                              ]),
                        ),
                      ]),
                ),
              ),
            ),
          ]),
      drawer: MyDrawer(),
    );
  }
}
