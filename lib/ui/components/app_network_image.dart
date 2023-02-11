// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    Key? key,
    required this.imageUrl,
    required this.placeholder,
  }) : super(key: key);

  final String imageUrl;
  final Widget placeholder;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => placeholder,
        errorWidget: (context, url, _) => placeholder,
      ),
    );
  }
}
