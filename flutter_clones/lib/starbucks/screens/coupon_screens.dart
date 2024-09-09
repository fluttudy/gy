import 'package:flutter/material.dart';

// 사용 가능한 쿠폰 화면
class AvailableCoupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('영수증 쿠폰 또는 MMS쿠폰을\n우측 상단 +버튼을 눌러 등록해 보세요.'),
    );
  }
}

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
                    color: Colors.red,
                    alignment: Alignment.center,
                    width: screenWidth * 0.075,
                    height: screenWidth * 0.075,
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

// 쿠폰 등록 화면
class AddCoupon extends StatefulWidget {
  @override
  AddCouponState createState() => AddCouponState();
}

class AddCouponState extends State<AddCoupon> {
  String? _selectedCoupon; // 선택된 쿠폰 저장

  @override
  Widget build(BuildContext context) {

    // 상수 화면 너비, 높이 값
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.03, right: screenWidth * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('영수증 쿠폰 또는 MMS 쿠폰 중 등록할 쿠폰을 선택해주세요.'),
              SizedBox(height: screenHeight * 0.01), // 간격 추가
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: '영수증 쿠폰', // 선택 가능한 값
                        groupValue: _selectedCoupon, // 현재 선택된 값
                        onChanged: (value) {
                          setState(() {
                            _selectedCoupon = value; // 선택된 값을 업데이트
                          });
                        },
                        activeColor: Colors.brown,
                      ),
                      Text('영수증 쿠폰'),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio<String>(
                        value: 'MMS 쿠폰', // 선택 가능한 값
                        groupValue: _selectedCoupon, // 현재 선택된 값
                        onChanged: (value) {
                          setState(() {
                            _selectedCoupon = value; // 선택된 값을 업데이트
                          });
                        },
                        activeColor: Colors.brown,
                      ),
                      Text('MMS 쿠폰'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.03, right: screenWidth * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('영수증 쿠폰번호 17자리를 입력하세요.'),
              SizedBox(height: screenHeight * 0.01,),
              Row(
                children: [
                  Expanded( // Row 내에서 공간을 차지하도록 설정
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), // 보더 추가
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.03,
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Expanded( // Row 내에서 공간을 차지하도록 설정
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),// 보더 추가
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.03,
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Expanded( // Row 내에서 공간을 차지하도록 설정
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), // 보더 추가
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.03,
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Expanded( // Row 내에서 공간을 차지하도록 설정
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), // 보더 추가
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.02,),
        Padding(padding: EdgeInsets.only(left: screenWidth * 0.03, right: screenWidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('쿠폰 등록코드 8자리를 입력해주세요.'),
            SizedBox(height: screenHeight * 0.01),
            Row(children: [
              Expanded( // Row 내에서 공간을 차지하도록 설정
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(), // 보더 추가
                  ),
                ),),
            ],)
          ],
        ),),
        Padding(padding: padding)
      ],
    );
  }
}





// class CheckCoupon extends StatefulWidget {
//   @override
//   State<CheckCoupon> createState() {
//     CheckCouponState();
//   }
// }
//
// class CheckCouponState extends State<CheckCoupon> {
//   String? selectedCoupon;
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
