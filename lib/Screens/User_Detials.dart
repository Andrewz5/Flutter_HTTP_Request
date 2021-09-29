// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http_requests/Model/User.dart';

import '../uitls.dart';

class UserDeitals extends StatelessWidget {
  User user;
  UserDeitals({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserDeitals'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50.0,
            ),
            Text(
              'Name\n${user.name}',
              style: const TextStyle(fontSize: 25, color: Colors.indigo),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                launchURL(
                    "mailto:${user.email} ?subject=Hello World &body=Hello Guys");
              },
              child: Text(
                'Email\n${user.email}',
                style: const TextStyle(fontSize: 25, color: Colors.indigo),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              'address\n${user.address.city}',
              style: const TextStyle(fontSize: 25, color: Colors.indigo),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                launchURL('tel:${user.phone}');
              },
              child: Text(
                'Phone Number\n${user.phone}',
                style: const TextStyle(fontSize: 25, color: Colors.indigo),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                launchURL('http://${user.website}');
              },
              child: Text(
                'Website\n${user.website}',
                style: const TextStyle(fontSize: 25, color: Colors.indigo),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
