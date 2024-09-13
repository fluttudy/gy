import 'package:flutter/material.dart';

class HorizontalImageList extends StatelessWidget {
  // 이미지 리스트를 매개변수로 받음
  final List<String> images;

  // 생성자에서 매개변수 초기화
  HorizontalImageList({
    required this.images,
  });

  // // 이미지 리스트
  // final List<String> images = [
  //   'assets/images/starbucks/card_2.png',
  //   'assets/images/starbucks/card_3.png',
  //   'assets/images/starbucks/card_4.png',
  //   'assets/images/starbucks/card_1.png',
  // ];

  @override
  Widget build(BuildContext context) {
    // 상수 화면 너비, 높이 값
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.09, // 리스트의 높이 설정
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // 가로 방향 스크롤 설정
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            width: screenWidth * 0.28, // 각 이미지의 너비 설정
            margin: EdgeInsets.symmetric(horizontal: 5), // 이미지 간격 설정
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}