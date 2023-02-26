# 概要

Flutterで作るGithubリポジトリ検索アプリになります。<br>
<strong>本プロジェクトは android / ios / macosのみ動作サポートしています</strong><br>

# アーキテクチャ
変更が多い内容ですので、[Wiki](https://github.com/LeoAndo/flutter_github_search/wiki/architecture)にまとめています。<br>

# 開発環境
- IDE: Visual Studio Code バージョン: 1.75.1 (Universal)

# アプリ開発時の準備 (重要)
変更が多い内容ですので、[Wiki](https://github.com/LeoAndo/flutter_github_search/wiki/dev-setup)にまとめています。<br>

# デザイン面：アピールポイント
- Material3 Themeの適用 (カスタマイズ)
- Dark Theme対応

# 機能面:アピールポイント
- Paging対応

# capture: 各プラットフォーム 基本機能の確認

| Android Resizable Emulator API 33 | i phone 14 Pro ios 16.2  | macos |
|:---|:---:|:---:|
|<img src="https://user-images.githubusercontent.com/16476224/219412356-73d15e57-fca4-4984-a3c9-10a6510d45eb.gif" width=320 /> |<img src="https://user-images.githubusercontent.com/16476224/218935617-3edd9a0c-fc37-4851-830c-9f78fb8e6df5.gif" width=320 /> | <img src="https://user-images.githubusercontent.com/16476224/218936421-2725e7a5-6b5f-4af0-8254-f29c5de1b434.png" /> |

# capture: 異常系

復旧手段があることの確認<br>
| Android Resizable Emulator API 33 |
|:---|
|<img src="https://user-images.githubusercontent.com/16476224/218940081-918802d6-90bd-498f-b6f8-1d1c40954c4a.gif" width=320 /> |

# capture: Android Material 3の適用チェック

OS12以上でM3のDynamic Colorが適用されていることを確認<br>
[Dynamic Color](https://m3.material.io/styles/color/dynamic-color/user-generated-color) はOS12以上で適用されます。<br>

| Android Resizable Emulator API 33 | Pixel Pro 6 API 26  |
|:---|:---:|
|<img src="https://user-images.githubusercontent.com/16476224/218936947-af4cdcda-8be5-4e30-ba60-e8a20a45ffa7.png" width=320 /> |<img src="https://user-images.githubusercontent.com/16476224/218937498-57f11516-46bc-432d-bfe8-b61fb2bb8263.png" width=320 /> |

# capture: Dark Themeの適用

| Android Resizable Emulator API 33 | i phone 14 Pro ios 16.2  | macos |
|:---|:---:|:---:|
|<img src="https://user-images.githubusercontent.com/16476224/218938289-911a480d-9984-4459-958a-e1166a1d7a46.png" width=320 /> |<img src="https://user-images.githubusercontent.com/16476224/218938512-b07600ca-0022-4c54-85a0-10dfa028064c.png" width=320 /> | <img src="https://user-images.githubusercontent.com/16476224/218938858-878e496e-b7fe-46e4-a005-702724804a8c.png" /> |

# 参考にしたリポジトリ

## dartの実装まわり
https://github.com/watanavex/flutter_github_search<br>
## CI/CD周り
https://github.com/yorifuji/flutter_github_actions_template<br>
## 環境(dev/stg/prod)の切り替え
https://zenn.dev/altiveinc/articles/separating-environments-in-flutter<br>
