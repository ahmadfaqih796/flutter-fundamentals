import 'package:flutter/material.dart';
import 'package:project_1/src/screens/about_screen.dart';

class MyDrawer extends StatelessWidget {
  final Function onTapHome;

  const MyDrawer({Key? key, required this.onTapHome}) : super(key: key);

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
              // Tutup drawer
              Navigator.pop(context);
              // Panggil fungsi onTapHome
              onTapHome();
            },
          ),
          ListTile(
            title: const Text('New Screen'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
