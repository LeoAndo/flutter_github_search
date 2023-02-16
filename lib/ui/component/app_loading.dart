// Flutter imports:
import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key, this.mainWidget});
  final Widget? mainWidget;
  @override
  Widget build(BuildContext context) {
    // 画面中央にローディングを表示したいため、Stackで囲っている.
    // StackはAndroidでいうFrameLayout的なイメージで使っている.
    return Stack(
      children: [
        if (mainWidget != null) mainWidget!,
        const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
