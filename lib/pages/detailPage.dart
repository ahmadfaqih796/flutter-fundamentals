import 'package:flutter/material.dart';
import 'package:project_1/models/posts.dart';

class DetailPage extends StatelessWidget {
  // DetailPage({Key? key, required Posts posts}) : super(key: key);

  final Posts posts;
  const DetailPage({Key? key, required this.posts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'id: ${posts.id}',
        ),
        Text('Title: ${posts.title}'),
        const SizedBox(
          height: 20,
        ),
        const Text('Body: '),
        Text(posts.body)
      ])),
    );
  }
}
