// Flutter imports:
import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String message;
  final VoidCallback onReload;
  final Widget? mainWidget;
  final EdgeInsetsGeometry padding;

  const AppError(
      {super.key,
      required this.message,
      required this.onReload,
      this.mainWidget,
      this.padding = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (mainWidget != null) mainWidget!,
        Center(
          child: Padding(
            padding: padding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  message,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                  // maxLines: 3,
                  // overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                    onPressed: onReload,
                    icon: const Icon(Icons.error_outline),
                    label: const Text('reload'))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
