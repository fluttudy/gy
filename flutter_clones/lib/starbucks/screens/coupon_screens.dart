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

    // 하단 주의사항 텍스트 리스트
    final List<String> texts = [
      '• 쿠폰으로 등록한 영수증 쿠폰은 등록해지가 불가능하며, 등록 이후 기존의 실물 쿠폰은 더 이상 사용하실 수 없습니다.',
      '• 등록한 쿠폰은 해당 계정에 등록된 스타벅스카드 또는 쿠폰의 QR코드를 제시하여 사용하실 수 있습니다.',
      '• 쿠폰 및 실물 쿠폰은 상업적으로 이용할 수 없으며, 스타벅스에서 제공하는 쿠폰 선물하기 기능 외 방법으로 전달된 쿠폰 사용으로 인해 발생된 문제에 대해서는 스타벅스가 책임지지 않습니다.',
      '• 쿠폰이 발행된 원 거래가 취소되는 경우, 등록된 쿠폰도 즉시 회수됩니다.'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.03, right: screenWidth * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '영수증 쿠폰 또는 MMS 쿠폰 중 등록할 쿠폰을 선택해주세요.',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: screenHeight * 0.01), // 간격 추가
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
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
                  SizedBox(width: screenWidth * 0.02,),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio<String>(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
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
        SizedBox(height: screenHeight * 0.02,),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.03, right: screenWidth * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '영수증 쿠폰번호 17자리를 입력하세요.',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Row(
                children: [
                  Expanded(
                    // Row 내에서 공간을 차지하도록 설정
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
                  Expanded(
                    // Row 내에서 공간을 차지하도록 설정
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
                  Expanded(
                    // Row 내에서 공간을 차지하도록 설정
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
                  Expanded(
                    // Row 내에서 공간을 차지하도록 설정
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
        SizedBox(
          height: screenHeight * 0.02,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.03, right: screenWidth * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '쿠폰 등록코드 8자리를 입력해주세요.',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                children: [
                  Expanded(
                    // Row 내에서 공간을 차지하도록 설정
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), // 보더 추가
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.03, right: screenWidth * 0.03),
            child: Container(
              height: screenHeight * 0.055,
              child: Center(child: Text('바코드 인식하기')),
              decoration: BoxDecoration(
                color: Color(0xffD7D2CA),
                borderRadius: BorderRadius.circular(3),
              ),
            )),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: texts.map((text) => CautionText(text: text)).toList(),
        ),
        // 등록하기 버튼
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(screenWidth * 0.03),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  },
                  child: Text(
                    '등록하기',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4aa568),
                    minimumSize: Size(400, 47),
                  ).copyWith(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // 원하는 둥글기 값
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CautionText extends StatelessWidget {
  final String text;

  const CautionText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 상수 화면 너비, 높이 값
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.fromLTRB(screenWidth * 0.03, screenWidth * 0.01, screenWidth * 0.03, screenWidth * 0.01),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xff777777),
          fontSize: 13,
          fontWeight: FontWeight.normal,
          letterSpacing: -0.3, // 자간 조정 (음수 값)
        ),
      ),
    );
  }
}