// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// Project imports:
import '../../domain/exception/api_exceptions.dart';
import '../../domain/model/repository_detail.dart';
import '../../ui/detail/detail_state_notifier.dart';
import '../component/app_error.dart';
import '../component/app_loading.dart';
import '../component/app_network_image.dart';
import '../res/values/strings.dart' as strings;

class DetailScreen extends ConsumerStatefulWidget {
  final String ownerName;
  final String repositoryName;
  const DetailScreen(
      {super.key, required this.ownerName, required this.repositoryName});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  void initState() {
    super.initState();
    Logger().d('ando _DetailScreenState call initState');
  }

  @override
  void dispose() {
    super.dispose();
    Logger().d('ando _DetailScreenState call dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(strings.titleDetailScreen),
      ),
      body: _buildBody(context, ref),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(detailStateNotifierProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Widgetの描画が完了した時に呼ばれるコールバック
      uiState.whenOrNull(
        initial: () {
          ref.read(detailStateNotifierProvider.notifier).fetchRepositoryDetail(
              ownerName: widget.ownerName,
              repositoryName: widget.repositoryName);
        },
      );
    });

    return uiState.when(
      initial: () => Container(),
      loading: () => const AppLoading(),
      data: (data) => _buildDataBody(data),
      error: (ApiException e) => AppError(
          message: e.message,
          onReload: () => {
                ref
                    .read(detailStateNotifierProvider.notifier)
                    .fetchRepositoryDetail(
                        ownerName: widget.ownerName,
                        repositoryName: widget.repositoryName)
              }),
    );
  }

  Widget _buildDataBody(RepositoryDetail repositoryDetail) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildOwnerImage(repositoryDetail.ownerAvatarUrl),
            const SizedBox(height: 16),
            Text(
              repositoryDetail.name,
              style: Theme.of(context).textTheme.headlineLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Text(
              widget.ownerName,
              style: Theme.of(context).textTheme.headlineMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Text(
              repositoryDetail.description ?? '',
            ),
            const SizedBox(height: 16),
            Text(
              repositoryDetail.language ?? '',
            ),
            const SizedBox(height: 40),
            _buildIconWithText(const Icon(Icons.flutter_dash),
                '${repositoryDetail.forksCount}'.formatForks()),
            const SizedBox(height: 16),
            _buildIconWithText(const Icon(Icons.star),
                '${repositoryDetail.stargazersCount}'.formatStars()),
            const SizedBox(height: 16),
            _buildIconWithText(const Icon(Icons.remove_red_eye),
                '${repositoryDetail.watchersCount}'.formatWatchers()),
            const SizedBox(height: 16),
            _buildIconWithText(const Icon(Icons.task),
                '${repositoryDetail.openIssuesCount}'.formatOpenIssues()),
          ],
        ),
      ),
    );
  }

  Widget _buildOwnerImage(String imageUrl) {
    const imageWidthFactor = 0.5;
    final size = MediaQuery.of(context).size;
    final placeholder = Icon(
      Icons.person,
      size: size.width * imageWidthFactor,
    );
    final errorWidget = Icon(
      Icons.error_outline,
      size: size.width * imageWidthFactor,
    );
    return FractionallySizedBox(
      widthFactor: imageWidthFactor,
      child: AppNetworkImage(
        imageUrl: imageUrl,
        placeholder: placeholder,
        errorWidget: errorWidget,
      ),
    );
  }

  Widget _buildIconWithText(Icon icon, String text) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}
