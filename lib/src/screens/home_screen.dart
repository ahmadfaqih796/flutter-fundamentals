import 'package:flutter/material.dart';
import '../widgets/appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Text('Welcome to Home Screen!'),
      ),
    );
  }
}
