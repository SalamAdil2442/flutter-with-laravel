// ignore_for_file: camel_case_types

import 'package:auth_laravel/screen_page/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../service/auth.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("home page"),
      ),
      drawer: Drawer(child: Consumer<Auth>(builder: (context, auth, child) {
        if (!auth.authenticated) {
          return ListView(
            children: [
              ListTile(
                leading: Icon(Icons.login),
                title: Text("login"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => login_screen(),
                  ));
                },
              ),
            ],
          );
        } else {
          return ListView(children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                    ),
                    Text("Salam Adil"),
                    Text("salamadilsaidan@gmail.com")
                  ],
                )),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("logout"),
              onTap: () {
                Provider.of<Auth>(context, listen: false).logout();
              },
            ),
          ]);
        }
      })),
      body: Center(
        child: Text(
          "home",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
