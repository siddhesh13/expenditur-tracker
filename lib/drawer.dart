import 'package:expenditure_tracker/pages/login_page.dart';
import 'package:expenditure_tracker/pages/dashboard.dart';
import 'package:expenditure_tracker/pages/add_expense.dart';
import 'package:expenditure_tracker/pages/about.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text("john@gmail.com"),
            // currentAccountPicture: CircleAvatar(
            // backgroundImage: NetworkImage(
            //      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
            //),
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text('Dashboard'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Dashboard.routeName,
                );
              }),
          ListTile(
              leading: Icon(Icons.emoji_symbols),
              title: Text('Add Expenses'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  HomePage.routeName,
                );
              }),
          ListTile(
              leading: Icon(Icons.queue),
              title: Text('About Us'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AboutPage.routeName,
                );
              }),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {}),
        ],
      ),
    );
  }
}
