// Flutter imports:
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onReload;

  const ErrorView({super.key, required this.message, required this.onReload});

  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(color: Theme.of(context).colorScheme.error);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: styleText),
          const SizedBox(height: 16),
          ElevatedButton.icon(
              onPressed: onReload,
              icon: const Icon(Icons.error_outline),
              label: const Text('reload'))
        ],
      ),
    );
  }
}
