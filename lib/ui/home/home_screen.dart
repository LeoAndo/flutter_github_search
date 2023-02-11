import 'package:flutter/material.dart';
import 'package:flutter_github_search/ui/search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text("Home Page."),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text(
                  'Paging compatible / non-compatible versions are available.'),
            ),
            ListTile(
                leading: const Icon(Icons.flutter_dash_outlined),
                title: const Text("Paging compatible"),
                onTap: () {
                  Navigator.maybePop(context);
                }),
            ListTile(
                leading: const Icon(Icons.flutter_dash_outlined),
                title: const Text("Paging non-compatible"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const SearchScreen()));
                }),
          ],
        ),
      ),
    );
  }
}