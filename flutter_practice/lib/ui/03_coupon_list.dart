import 'package:flutter/material.dart';
import 'screens/coupon_available.dart';
import 'screens/coupon_history.dart';
import 'screens/coupon_add.dart';

void main() => runApp(Coupon());

// 쿠폰 화면 클래스
class Coupon extends StatefulWidget {
  @override
  State<Coupon> createState() {
    return CouponState();
  }
}

class CouponState extends State<Coupon> {
  // 상태 변수
  int currentTabIndex = 0; // 0: 사용 가능한 쿠폰, 1: 쿠폰 히스토리, 2: 쿠폰 등록
  double screenWidth = 0; // 화면 너비 변수
  double screenHeight = 0; // 화면 높이 변수
  double appBarHeight = 0.15; // 기본 AppBar 높이 비율
  String title = 'Coupon';

  @override
  Widget build(BuildContext context) {
    // 상수 화면 너비, 높이 값
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // AppBar 높이 계산
    double calculatedAppBarHeight = screenHeight * appBarHeight;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(calculatedAppBarHeight),
          child: AppBar(
              backgroundColor: Colors.white,
              flexibleSpace: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            currentTabIndex = 0;
                            appBarHeight = 0.15;
                            title = 'Coupon';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: screenWidth * 0.03),
                          // color: Colors.yellow,
                          alignment: Alignment.centerLeft,
                          width: screenWidth * 0.2,
                          child: Icon(Icons.arrow_back_ios,
                              color: Color(0xFF555555)),
                        ),
                      ),
                      // SizedBox(width: screenWidth * 0.22,),
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      // SizedBox(width: screenWidth * 0.22,),
                      Container(
                        padding: EdgeInsets.only(right: screenWidth * 0.02),
                        child: Row(
                          children: [
                            if (currentTabIndex != 2
                            )
                            GestureDetector(
                              onTap:(){
                                setState(() {
                                  currentTabIndex = 2; // 쿠폰 등록 화면
                                  appBarHeight = 0.075;
                                  title = 'Coupon 등록';
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.grey[400],
                                size: 32,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            Icon(
                              Icons.info_outline,
                              color: Colors.grey[400],
                              size: 30,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider()
                ],
              ),
              bottom: currentTabIndex == 2 // currentTabIndex가 2일 때 bottom을 숨김
                  ? null : PreferredSize(
                  preferredSize: Size.fromHeight(screenHeight * 0.01),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentTabIndex = 0; // 사용 가능한 쿠폰 선택
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(screenWidth * 0.03),
                              width: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                  color: currentTabIndex == 0 ? Colors.green : Colors.white,
                                  border: Border.all(
                                      color: Color(0xff222222), width: 0.2),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  )),
                              child: Center(
                                  child: Text(
                                '사용 가능한 쿠폰',
                                style: TextStyle(color: currentTabIndex == 0 ? Colors.white : Colors.grey),
                              )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentTabIndex = 1; // 쿠폰 히스토리 선택
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(screenWidth * 0.03),
                              width: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                  color: currentTabIndex == 1 ? Colors.green : Colors.white,
                                  border: Border.all(
                                      color: Color(0xff222222), width: 0.2),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  )),
                              child: Center(
                                  child: Text(
                                '쿠폰 히스토리',
                                style: TextStyle(color: currentTabIndex == 1 ? Colors.white : Colors.grey),
                              )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02,)
                    ],
                  )
              )),
        ),
        body: Center(
          child: Builder(
            builder: (context) {
              switch (currentTabIndex) {
                case 0:
                  return CouponAvailable();
                case 1:
                  return CouponHistory();
                case 2:
                  return CouponAdd();
                default:
                  return Container(); // 기본값 처리
              }
            },
          ),
        ),
      ),
    );
  }
}




