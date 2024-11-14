import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibyeol_note/common/utils/web_utils_stub.dart';
import 'package:ibyeol_note/home/home_view.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

Future<void> main() async {
  const envPath = kReleaseMode ? 'assets/release.env' : 'assets/develop.env';
  var jsContext = getJsContext();

  await dotenv.load(fileName: envPath);
  final kakaoKey = dotenv.env['KAKAO_KEY'];

  if (jsContext != null) {
    // 여기에 웹 환경변수 추가 (아래는 디버깅 용으로 넣어둠)
    // 환경변수는 web/env.js 로 관리
    dotenv.env['BASE_URL'] = jsContext['ENV']['BASE_URL'] as String;
  }
  KakaoSdk.init(nativeAppKey: kakaoKey);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      home: HomeView(),
    );
  }
}
