// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../res/values/strings.dart' as strings;

class EnvironmentVariableScreen extends StatelessWidget {
  const EnvironmentVariableScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const flavor = String.fromEnvironment('flavor');
    const appName = String.fromEnvironment('flutterAppName');
    const applicationIdSuffix =
        String.fromEnvironment('flutterApplicationIdSuffix');
    const githubAccessToken = String.fromEnvironment('githubAccessToken');
    const githubApiDomain = String.fromEnvironment('githubApiDomain');
    return Scaffold(
      appBar: AppBar(
        title: const Text(strings.titleEnvironmentVariableScreen),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: const [
            ListTile(
              leading: Text('kDebugMode'),
              title: Text('kDebugMode: $kDebugMode'),
            ),
            ListTile(
              leading: Text('kProfileMode'),
              title: Text('kProfileMode: $kProfileMode'),
            ),
            ListTile(
              leading: Text('kReleaseMode'),
              title: Text('kReleaseMode: $kReleaseMode'),
            ),
            ListTile(
              leading: Text('flavor'),
              title: Text(flavor),
            ),
            ListTile(
              leading: Text('appName'),
              title: Text(appName),
            ),
            ListTile(
              leading: Text('applicationIdSuffix'),
              title: Text(applicationIdSuffix),
            ),
            ListTile(
              leading: Text('githubAccessToken'),
              title: Text(githubAccessToken),
            ),
            ListTile(
              leading: Text('githubApiDomain'),
              title: Text(githubApiDomain),
            ),
          ],
        ),
      )),
    );
  }
}
