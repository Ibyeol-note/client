import 'package:flutter/material.dart';
import 'package:ibyeol_note/start/info_view.dart';

class SelectUiView extends StatelessWidget {
  const SelectUiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 44,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Icon(
                Icons.arrow_back_ios,
                size: 24,
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "현재 OO님의 상태를\n알려주세요!",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              const Text("선택에 따라 적절한 UI로 변경됩니다.",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey)),
              const SizedBox(height: 60),
              Row(
                children: [
                  SelectBtn(
                    txt: "잡고 싶나요?",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InfoView(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 20),
                  SelectBtn(
                    txt: "잊고 싶나요?",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InfoView(),
                        ),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        )));
  }
}

class SelectBtn extends StatelessWidget {
  const SelectBtn({super.key, required this.txt, required this.onTap});

  final String txt;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(txt, style: const TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
