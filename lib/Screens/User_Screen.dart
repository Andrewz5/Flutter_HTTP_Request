// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_http_requests/Model/User.dart';
import 'package:flutter_http_requests/Screens/Home_Page.dart';
import 'package:flutter_http_requests/Screens/Profile_Page.dart';
import 'package:flutter_http_requests/Screens/Settings_Page.dart';
import 'package:flutter_http_requests/Screens/User_Detials.dart';
import 'package:flutter_http_requests/Services/UserServices.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    ProfilePage(),
    SettingsPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        onTap: _onItemTapped,
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.indigo,
            boxShadow: [BoxShadow(blurRadius: 10.0)],
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)),
          ),
          child: Column(
            children: const [
              SizedBox(
                height: 40,
              ),
              Text(
                "Home Page",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: pages[currentIndex],
    );
    //ListView.builder(
    //     itemCount: userList.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return FlatButton(
    //         onPressed: () {
    //           name = userList[index].name;
    //           email = userList[index].email;
    //           phone = userList[index].phone;
    //           website = userList[index].website;
    //           address =
    //               '${userList[index].address.street},${userList[index].address.city}';
    //           Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) => UserDeitals(
    //                     name, address, email, phone, website),
    //               ));
    //         },
    //         child: ListTile(
    //           title: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Text(userList[index].name),
    //           ),
    //           trailing: const Icon(Icons.people),
    //         ),
    //       );
    //     },
    //   ));
    // }
// }
  }
}
