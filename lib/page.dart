// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class PageNext extends StatelessWidget {
  const PageNext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: const Text("Click"),
            onPressed: () {},
          ),
          Container(height: 20.0),
          const Text(
            'Hello',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
              fontSize: 40,
            ),
          ),
          const Text('Alfin'),
        ],
      ),
    );
  }
}
