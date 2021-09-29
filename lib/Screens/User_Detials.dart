// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../uitls.dart';

class UserDeitals extends StatelessWidget {
  String name, address, email, phone, website;

  UserDeitals(this.name, this.address, this.email, this.phone, this.website);
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
              'Name\n$name',
              style: const TextStyle(fontSize: 25, color: Colors.indigo),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                launchURL(
                    "mailto:$email ?subject=Hello World &body=Hello Guys");
              },
              child: Text(
                'Email\n$email',
                style: const TextStyle(fontSize: 25, color: Colors.indigo),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              'address\n$address',
              style: const TextStyle(fontSize: 25, color: Colors.indigo),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                launchURL('tel:$phone');
              },
              child: Text(
                'Phone Number\n$phone',
                style: const TextStyle(fontSize: 25, color: Colors.indigo),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                launchURL('http://$website');
              },
              child: Text(
                'Website\n$website',
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
