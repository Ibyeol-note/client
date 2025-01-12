import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(
        image ?? 'https://loremflickr.com/600/400', // 기본 이미지는 후에 변경 예정
        width: 120,
        height: 120,
        alignment: Alignment.center,
        fit: BoxFit.cover,
      ),
    );
  }
}
