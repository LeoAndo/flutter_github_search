/// UIで使うstringリソースをここで定義します。
/// 多言語対応を想定しない前提なので対応する場合は、外部パッケージをご利用ください。
const reload = 'reload';
const titleDetailScreen = 'Detail Screen';
const titleEnvironmentVariableScreen = 'Environment Variable';
const titleSearchScreen = 'Search Screen';
const titleSearchPagingScreen = 'Search Paging Screen';
const titleHomeScreen = 'Home';
const homeDrawableHeader =
    'Paging compatible / non-compatible versions are available.';
const listItemIsEmpty = 'result empty..';

extension StringExt on String {
  String formatForks() => '$this forks';
  String formatStars() => '$this stars';
  String formatWatchers() => '$this watchers';
  String formatOpenIssues() => 'open $this issues';
}
