// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_github_search/ui/package_info/package_info_screen.dart';
import 'package:flutter_github_search/ui/search/pagination/search_paging_screen.dart';
import 'package:flutter_github_search/ui/search/search_screen.dart';
import '../environment_variable/environment_variable_screen.dart';
import '../res/values/strings.dart' as strings;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text(strings.titleHomeScreen),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text(strings.homeDrawableHeader),
            ),
            ListTile(
                leading: const Icon(Icons.computer),
                title: const Text(strings.titleEnvironmentVariableScreen),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const EnvironmentVariableScreen()));
                }),
            ListTile(
                leading: const Icon(Icons.info),
                title: const Text("Package Info"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const PackageInfoScreen()));
                }),
            ListTile(
                leading: const Icon(Icons.flutter_dash_outlined),
                title: const Text("Paging compatible"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const SearchPagingScreen()));
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
