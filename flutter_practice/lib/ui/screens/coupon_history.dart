import 'package:flutter/material.dart';

// 쿠폰 히스토리 화면
class CouponHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 상수 화면 너비, 높이 값
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: ListView(
        children: [
          ListTile(
            tileColor: Color(0xffF4F4F2),
            // 쿠폰 아이콘
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.08,
                    height: screenWidth * 0.08,
                    child: Image.asset(
                      'assets/images/starbucks/coupon_icon.png',
                      fit: BoxFit.cover,
                    )),
                Text(
                  '쿠폰 사용',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            // 쿠폰 제목
            title: Text(
              '2020 크리스마스 e-프리퀀시 완성 쿠폰',
              style: TextStyle(fontSize: 14, color: Color(0xff777777)),
            ),
            // 쿠폰 부제목
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2020.12.31까지 | 2020.12.23 사용',
                  style: TextStyle(fontSize: 12, color: Color(0xff777777)),
                ),
                Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.005),
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.03,
                  color: Color(0xff7B6D66),
                  child: Center(
                      child: Text(
                        '영수증 보기',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )),
                )
              ],
            ),
            // 추가 정보
            onTap: () {
              // 쿠폰 클릭 시 동작
            },
          ),
          // 더 많은 쿠폰 항목 추가 가능
        ],
      ),
    );
  }
}