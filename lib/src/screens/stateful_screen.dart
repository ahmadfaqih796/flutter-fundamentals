// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:project_1/src/screens/about_screen.dart';
import 'package:project_1/src/widgets/navbar/appbar_widget.dart';
import 'package:project_1/theme.dart';

class StatefulScreen extends StatefulWidget {
  const StatefulScreen({Key? key}) : super(key: key);

  @override
  _StatefulScreenState createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  bool isDarkMode = false;

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
    return HomeScreenContent(
      isDarkMode: isDarkMode,
      onTapHome: onTapHome,
      toggleDarkMode: () {
        setState(() {
          isDarkMode = !isDarkMode;
          ThemeMode newThemeMode =
              Theme.of(context).brightness == Brightness.light
                  ? ThemeMode.dark
                  : ThemeMode.light;

          MaterialApp app = MaterialApp(
            themeMode: newThemeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: const StatefulScreen(),
          );

          runApp(app);
        });
      },
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({
    required this.isDarkMode,
    required this.onTapHome,
    required this.toggleDarkMode,
  });

  final bool isDarkMode;
  final void Function(BuildContext) onTapHome;
  final VoidCallback toggleDarkMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: toggleDarkMode,
          ),
        ],
      ),
      drawer: MyDrawer(
        onTapHome: onTapHome,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Home Screen!'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ThemeMode newThemeMode =
                    isDarkMode ? ThemeMode.light : ThemeMode.dark;

                MaterialApp app = MaterialApp(
                  themeMode: newThemeMode,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  home: const StatefulScreen(),
                );

                runApp(app);
              },
              child: const Text('Toggle Theme'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
              child: const Text('Go to New Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
