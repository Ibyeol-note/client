import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:ibyeol_note/start/select_ui_view.dart';
import 'package:ibyeol_note/start/widgets./login_btn.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:flutter/foundation.dart' as foundation;

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(child: Text("이별노트")),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Column(
                children: [
                  LoginBtn(
                    txt: "네이버로 시작하기",
                    icon: "naver",
                    txtColor: Colors.white,
                    bgColor: const Color(0xFF28D34A),
                    onTap: () async {
                      try {
                        NaverLoginResult res = await FlutterNaverLogin.logIn();
                        if (res.status != NaverLoginStatus.loggedIn) {
                          throw Exception("네이버 로그인 실패 ${res.errorMessage}");
                        } else {
                          NaverAccessToken token =
                              await FlutterNaverLogin.currentAccessToken;
                          print(
                              '네이버로 로그인 성공 계정: ${res.account.email} 토큰: $token');
                          if (context.mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SelectUiView(),
                              ),
                            );
                          }
                        }
                      } catch (e) {
                        print("[PRINT] 로그인 실패 error: $e");
                      }
                    },
                  ),
                  LoginBtn(
                    txt: "카카오로 시작하기",
                    icon: "kakao",
                    bgColor: const Color(0xFFFFEB03),
                    onTap: () async {
                      if (await isKakaoTalkInstalled()) {
                        try {
                          final user =
                              await UserApi.instance.loginWithKakaoTalk();
                          print('카카오톡으로 로그인 성공 ${user.accessToken}');
                        } catch (error) {
                          print('카카오톡으로 로그인 실패 $error');
                          if (error is PlatformException &&
                              error.code == 'CANCELED') {
                            return;
                          }
                          try {
                            final user =
                                await UserApi.instance.loginWithKakaoAccount();
                            print('카카오계정으로 로그인 성공 ${user.accessToken}');
                          } catch (error) {
                            print('카카오계정으로 로그인 실패 $error');
                          }
                        }
                      } else {
                        try {
                          final user =
                              await UserApi.instance.loginWithKakaoAccount();
                          print('카카오계정으로 로그인 성공 ${user.accessToken}');
                        } catch (error) {
                          print('카카오계정으로 로그인 실패 $error');
                        }
                      }
                    },
                  ),
                  if (foundation.defaultTargetPlatform == TargetPlatform.iOS)
                    LoginBtn(
                      txt: "Apple로 시작하기",
                      icon: "google",
                      txtColor: Colors.white,
                      bgColor: Colors.black,
                      onTap: () {},
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
