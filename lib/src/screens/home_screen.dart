import 'package:flutter/material.dart';
import 'package:project_1/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Home Screen!'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Toggle theme
                ThemeMode newThemeMode =
                    Theme.of(context).brightness == Brightness.light
                        ? ThemeMode.dark
                        : ThemeMode.light;

                // Apply the new theme directly
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
          ],
        ),
      ),
    );
  }
}
