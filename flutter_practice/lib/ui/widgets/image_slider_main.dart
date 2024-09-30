import 'package:flutter/material.dart';

class ImageSliderMain extends StatelessWidget {
  final PageController pageController; // PageController를 매개변수로 받음

  // 생성자에서 pageController를 필수 매개변수로 설정
  ImageSliderMain({required this.pageController});

  // 메인배너 이미지 리스트
  final List<String> images = [
    'assets/images/starbucks/card_1.png',
    'assets/images/starbucks/card_2.png',
  ];

  @override
  Widget build(BuildContext context) {

    // 상수 화면 너비, 높이 값
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return PageView.builder(
      controller: pageController,
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Container(
          width: screenWidth,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(images[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}