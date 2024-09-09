import 'package:flutter/material.dart';
import 'coupon_screens.dart';

class CouponAppBar extends StatefulWidget {
@override
  CouponAppBarState createState() {
    return CouponAppBarState();
  }
}

class CouponAppBarState extends State<CouponAppBar> {

  // 상태 변수
  int currentTabIndex = 0; // 0: 사용 가능한 쿠폰, 1: 쿠폰 히스토리, 2: 쿠폰 등록

  @override
  Widget build(BuildContext context) {

    // 상수 화면 너비, 높이 값
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return PreferredSize(
      preferredSize: Size.fromHeight(screenHeight * 0.125),
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
                  Container(
                    padding: EdgeInsets.only(left: screenWidth * 0.03),
                    // color: Colors.yellow,
                    alignment: Alignment.centerLeft,
                    width: screenWidth * 0.2,
                    child: Icon(Icons.arrow_back_ios,
                        color: Color(0xFF555555)),
                  ),
                  // SizedBox(width: screenWidth * 0.22,),
                  Text(
                    'Coupon',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  // SizedBox(width: screenWidth * 0.22,),
                  Container(
                    // color: Colors.yellow,
                    width: screenWidth * 0.2,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              currentTabIndex = 2; // 쿠폰 등록 화면
                            });
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.grey[400],
                            size: 32,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),
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
          bottom: PreferredSize(
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
                              color: Colors.green,
                              border: Border.all(
                                  color: Color(0xff222222), width: 0.2),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              )),
                          child: Center(
                              child: Text(
                                '사용 가능한 쿠폰',
                                style: TextStyle(color: Colors.white),
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
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xff222222), width: 0.2),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              )),
                          child: Center(
                              child: Text(
                                '쿠폰 히스토리',
                                style: TextStyle(color: Colors.grey),
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02,)
                ],
              )
          )),
    );
  }
}