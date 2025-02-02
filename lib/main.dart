import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibyeol_note/common/utils/web_utils.dart';

import 'package:ibyeol_note/start/main_view.dart';

Future<void> main() async {
  var envPath = kReleaseMode ? 'assets/release.env' : 'assets/develop.env';
  await dotenv.load(fileName: envPath);

  var jsContext = getJsContext();

  if (jsContext != null) {
    // 여기에 웹 환경변수 추가 (아래는 디버깅 용으로 넣어둠)
    // 환경변수는 web/env.js 로 관리
    dotenv.env['BASE_URL'] = jsContext['ENV']['BASE_URL'] as String;
  }
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: const TextScaler.linear(1)),
        child: child!,
      ),
      home: const MainView(),
    );
  }
}
