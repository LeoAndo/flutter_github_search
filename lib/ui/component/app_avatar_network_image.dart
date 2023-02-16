// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:logger/logger.dart';

class AppAvatarNetworkImage extends StatefulWidget {
  const AppAvatarNetworkImage(
      {super.key,
      this.height = 200,
      this.width = 200,
      this.size = 200,
      required this.url});
  final double height;
  final double width;
  final double size;
  final String url;

  @override
  State<StatefulWidget> createState() => _AppAvatarNetworkImageState();
}

class _AppAvatarNetworkImageState extends State<AppAvatarNetworkImage> {
  bool _showErrorWidget = false;
  @override
  Widget build(BuildContext context) {
    final errorWidget = Icon(
      Icons.person,
      size: widget.size,
      color: Theme.of(context).colorScheme.error,
    );
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(widget.url),
        onBackgroundImageError: (exception, stackTrace) {
          // ArgumentErrorがスローされる. NetworkImageは内部で、httpライブラリを使用している模様.
          if (exception is ArgumentError) {
            Logger().e('ando exception ${exception.toString()}');
            Logger().e('ando stackTrace $stackTrace');
          } else {
            Logger().e('ando exception $exception, stackTrace $stackTrace');
          }
          setState(() => _showErrorWidget = true);
        },
        child: AnimatedOpacity(
          opacity: _showErrorWidget ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: errorWidget,
        ),
      ),
    );
  }
}
