// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http_requests/Model/User.dart';
import 'package:flutter_http_requests/Screens/User_Detials.dart';
import 'package:flutter_http_requests/Services/UserServices.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<User> userList = [];
  bool isLoading = true;
  getUserList() async {
    userList = await UserServices().getUser();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserList();
  }

  String name, address, email, phone, website;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: userList.length,
                itemBuilder: (BuildContext context, int index) {
                  return FlatButton(
                    onPressed: () {
                      name = userList[index].name;
                      email = userList[index].email;
                      phone = userList[index].phone;
                      website = userList[index].website;
                      address =
                          '${userList[index].address.street},${userList[index].address.city}';
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDeitals(
                                name, address, email, phone, website),
                          ));
                    },
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(userList[index].name),
                      ),
                      trailing: const Icon(Icons.people),
                    ),
                  );
                },
              ));
  }
}
