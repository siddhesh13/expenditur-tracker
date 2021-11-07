import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenditure_tracker/drawer.dart';
import 'package:flutter/material.dart';
import 'package:expenditure_tracker/pages/add_expense.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  static const String routeName = "/dashboard";
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Stream<QuerySnapshot> expenses =
      FirebaseFirestore.instance.collection("expense").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenditure Tracker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              // Constants.prefs.setBool("loggedIn", false);
              //Navigator.pop(context);
            },
          )
        ],
      ),
      body: Container(
          child: StreamBuilder<QuerySnapshot>(
        stream: expenses,
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (snapshot.hasError) {
            return Text("something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = snapshot.requireData;
          return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.white,
                child: Table(
                    columnWidths: {
                      0: FixedColumnWidth(50),
                      1: FlexColumnWidth(),
                    },
                    border: TableBorder.all(
                        width: 1,
                        color: Colors
                            .lightBlue), // Allows to add a border decoration around your table
                    children: [
                      TableRow(children: [
                        Container(
                            color: index % 2 == 0
                                ? Colors.blue[50]
                                : Colors.amber[50],
                            child: Text(data.docs[index]['name'])),
                        //Text(data.docs[index]['team']),
                        Container(
                            color: index % 2 == 0
                                ? Colors.blue[50]
                                : Colors.amber[50],
                            child: Text(data.docs[index]['itemName'])),
                        Container(
                            color: index % 2 == 0
                                ? Colors.blue[50]
                                : Colors.amber[50],
                            child: Text(data.docs[index]['category'])),
                        Container(
                            color: index % 2 == 0
                                ? Colors.blue[50]
                                : Colors.amber[50],
                            child: Text(
                                (data.docs[index]['quantity']).toString())),
                        Container(
                            color: index % 2 == 0
                                ? Colors.blue[50]
                                : Colors.amber[50],
                            child: Text(
                                (data.docs[index]['unitPrice']).toString())),
                        Container(
                            color: index % 2 == 0
                                ? Colors.blue[50]
                                : Colors.amber[50],
                            child: Text(
                                (data.docs[index]['totalPrice']).toString())),
                      ]),
                    ]),
              );
              //return Text(
              //   "Employee:${data.docs[index]['name']}, Team: ${data.docs[index]['team']}, Item Name: ${data.docs[index]['itemName']}, Category: ${data.docs[index]['category']}, Unit price: ${data.docs[index]['unitPrice']}, Quantity: ${data.docs[index]['quantity']}, Toatal Price: ${data.docs[index]['totalPrice']}");
            },
          );
        },
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.pushNamed(
            context,
            HomePage.routeName,
          );
          setState(() {});
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
