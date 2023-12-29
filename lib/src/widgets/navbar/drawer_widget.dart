import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/src/screens/about_screen.dart';

class MyDrawer extends StatelessWidget {
  final Function onTapHome;
  final Function onTapNewScreen;

  const MyDrawer(
      {Key? key, required this.onTapHome, required this.onTapNewScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context); // Tutup drawer
              onTapHome(); // Panggil fungsi onTapHome
            },
          ),
          ListTile(
            title: const Text('New Screen'),
            onTap: () {
              // Navigator.pop(context); // Tutup drawer
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const AboutScreen()),
              // );
              // Navigator.push(
              //   context,
              //   CupertinoPageRoute(builder: (context) => const AboutScreen()),
              // );
              Get.to(const AboutScreen());
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => const AboutScreen()),
              // );
            },
          ),
        ],
      ),
    );
  }
}
