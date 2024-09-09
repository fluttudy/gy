import 'package:flutter/material.dart';

void main() => runApp(Coupon());

// 쿠폰 화면 클래스
class Coupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CouponList(),
    );
  }
}


// 쿠폰 리스트 화면 클래스
class CouponList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // 상수 화면 너비, 높이 값
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
          title: Text('Coupon'),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(screenHeight * 0.05),
              child: Column(
                children: [Divider(), TabBar(tabs: [Tab(child: AvailableBtn(),), Tab(child: HistoryBtn())])],
              )
          )
      ),
      body: TabBarView(children: [
        AvailableCoupon(),
        CouponHistory(),
      ])
    ),
    );
  }
}

class AvailableCoupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('사용가능한 쿠폰 화면'),
    );
  }
}

class CouponHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('쿠폰 히스토리 화면'),
    );
  }
}

class AvailableBtn extends StatefulWidget {
  @override
  State<AvailableBtn> createState() {
    return
    AvailableBtnState();
  }
}

class AvailableBtnState extends State<AvailableBtn> {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Text('사용가능한 쿠폰'),
    );
  }
}

class HistoryBtn extends StatefulWidget {
  @override
  State<HistoryBtn> createState() {
    return
      HistoryBtnState();
  }
}

class HistoryBtnState extends State<HistoryBtn> {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Text('쿠폰 히스토리'),
    );
  }
}