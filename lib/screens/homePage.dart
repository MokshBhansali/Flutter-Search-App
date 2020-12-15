import 'package:flutter/material.dart';
import 'dart:async';
import '../models/Usermodels.dart';
import '../services/myServices.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<UserViewModel> users = List();
  List<UserViewModel> filteredList = List();
  @override
  void initState() {
    super.initState();
    getMyOnlineData();
  }

  getMyOnlineData() async {
    Services.getUsers().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        filteredList = users;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              onChanged: (string) {
                setState(() {
                  filteredList = users
                      .where(
                        (u) => (u.name
                                .toLowerCase()
                                .contains(string.toLowerCase()) ||
                            u.name
                                .toLowerCase()
                                .contains(string.toLowerCase())),
                      )
                      .toList();
                });
              },
              decoration: InputDecoration(
                hintText: "Seach with name & email.",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10, right: 10),
              itemCount: filteredList.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      filteredList[index].name.toString(),
                    ),
                    subtitle: Text(
                      filteredList[index].email.toString(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
