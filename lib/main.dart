// import 'package:flutter/material.dart';
// // import 'package:project_1/page.dart';
// import 'package:project_1/pages/home.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Home(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:project_1/src/screens/auth/register.dart';
import 'package:project_1/src/screens/home_screen.dart';
import 'package:project_1/src/screens/auth/login.dart';
import 'package:project_1/src/screens/stateful_screen.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode
          .system, // Pilih ThemeMode.light atau ThemeMode.dark jika ingin mengatur mode secara manual
      home: const RegisterScreen(),
    );
  }
}
