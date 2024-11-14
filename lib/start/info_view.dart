import 'package:flutter/material.dart';

enum Gender {
  man("남성"),
  woman("여성"),
  etc("기타");

  const Gender(this.label);
  final String label;
}

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  Gender? selectedGender;

  void setGender(Gender gender) {
    setState(() {
      selectedGender = gender;
      print(selectedGender);
    });
  }

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
              "정보를\n알려주세요!",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            const Text("앱을 사용하는데 필요한 정보입니다.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey)),
            const SizedBox(height: 60),
            const Text(
              "닉네임",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "닉네임을 입력해주세요.",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "성별",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: Gender.values
                  .map(
                    (e) => Expanded(
                      child: GenderBtn(
                        gender: e,
                        onTap: () {
                          setGender(e);
                        },
                        isSelected: selectedGender == e,
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      )),
      bottomSheet: Container(
        height: 96,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.white,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.purple,
          ),
          alignment: Alignment.center,
          child: const Text(
            "확인",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class GenderBtn extends StatelessWidget {
  const GenderBtn(
      {super.key,
      required this.gender,
      required this.onTap,
      required this.isSelected});

  final Gender gender;
  final VoidCallback onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.purple : Colors.white,
        ),
        alignment: Alignment.center,
        child: Text(gender.label, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
