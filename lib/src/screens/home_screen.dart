import 'package:flutter/material.dart';
import 'package:project_1/src/screens/about_screen.dart';
import 'package:project_1/src/widgets/navbar/appbar_widget.dart';
import 'package:project_1/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void onTapHome(BuildContext context) {
    // Logika untuk menavigasi ke halaman Home jika diperlukan
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
    bool isDarkMode = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        actions: [
          IconButton(
            icon: Icon(
              // ignore: dead_code
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: () {
              isDarkMode = !isDarkMode;
              ThemeMode newThemeMode =
                  Theme.of(context).brightness == Brightness.light
                      ? ThemeMode.dark
                      : ThemeMode.light;

              MaterialApp app = MaterialApp(
                themeMode: newThemeMode,
                theme: lightTheme,
                darkTheme: darkTheme,
                home: const HomeScreen(),
              );

              runApp(app);
            },
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
                    Theme.of(context).brightness == Brightness.light
                        ? ThemeMode.dark
                        : ThemeMode.light;

                MaterialApp app = MaterialApp(
                  themeMode: newThemeMode,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  home: const HomeScreen(),
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
