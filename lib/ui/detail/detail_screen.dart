// Flutter imports:
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int id;
  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('abc')),
      body: Text('Hello, Detail $id'),
    );
  }
}
