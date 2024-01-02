import 'package:flutter/material.dart';
import 'package:project_1/theme.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  void onTapHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MaterialApp(
          themeMode: ThemeMode.system,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: const AboutScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Screen'),
      ),
      body: const Center(
        child: Text('This is the new screen!'),
      ),
    );
  }
}
