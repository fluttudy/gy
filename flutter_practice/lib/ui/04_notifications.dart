import 'package:flutter/material.dart';

// void main() => runApp(Notifications());
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Notifications(),
    );
  }
}

class Notifications extends StatefulWidget {
  @override
  State<Notifications> createState() {
    return NotificationsState();
  }
}

class NotificationsState extends State<Notifications> {
  // 드롭다운 메뉴 아이템 리스트
  List<String> dropDownList = ['전체', '사이렌 오더 알림', '프로모션/이벤트'];

  // 드롭다운 상태 변수
  String selectedValue = '전체';

  @override
  Widget build(BuildContext context) {
    // 상수 화면 너비, 높이 값
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    double listItemFontSize = 17;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.075),
          child: AppBar(
              backgroundColor: Colors.white,
              flexibleSpace: Container(
                padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                    screenWidth * 0.15, screenWidth * 0.05, screenWidth * 0.03),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 6,
                    spreadRadius: 0.05,
                    offset: Offset(0, 1),
                  )
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff777777),
                      size: 18,
                    ),
                    Text(
                      '알림',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  '알림함의 모든 메시지를 삭제하시겠어요?',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold), // 제목 스타일 조정
                                ),
                                actions: [
                                  OutlinedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('아니요',
                                          style:
                                              TextStyle(color: Colors.green)),
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(color: Colors.green),
                                      )),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      '전체 삭제',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                ],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // 다이얼로그 모서리 둥글게
                                ),
                                backgroundColor: Colors.white,
                                // 배경 색상 조정
                                elevation: 5, // 그림자 효과 조정
                              );
                            },
                          );
                        },
                        child: Icon(Icons.delete_outlined))
                  ],
                ),
              ))),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: screenHeight * 0.01, bottom: screenHeight * 0.02),
              width: screenWidth * 0.9,
              child: DropdownButton(
                  value: selectedValue,
                  isExpanded: true,
                  items: dropDownList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    );
                  }).toList(),
                  // 드롭다운 버튼의 onChanged 구문
                  onChanged: (String? newValue) {
                    // 항목 선택 시 코드 정의
                    setState(() {
                      selectedValue = newValue!;
                    });
                  }),
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth * 0.92,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.09,
                              height: screenWidth * 0.09,
                              child: Image.asset(
                                'assets/images/starbucks/cup.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '메뉴가 모두 준비되었어요.(A-24)',
                                  style: TextStyle(fontSize: listItemFontSize),
                                ),
                                Text(
                                  '픽업대에서 메뉴를 픽업해주세요!\n매장 방문시 마스크를 꼭 착용해주세요.',
                                  style: TextStyle(fontSize: listItemFontSize),
                                ),
                                Text(
                                  '2021.03.05 17:44:41',
                                  style: TextStyle(
                                      color: Color(0xff888888),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Container(
                                margin:
                                    EdgeInsets.only(left: screenWidth * 0.02),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 40,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Container(
                        // color: Colors.red,
                        width: screenWidth * 0.92,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.09,
                              height: screenWidth * 0.09,
                              child: Image.asset(
                                'assets/images/starbucks/cup.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '메뉴가 모두 준비되었어요.(A-82)',
                                  style: TextStyle(fontSize: listItemFontSize),
                                ),
                                Text(
                                  '픽업대에서 메뉴를 픽업해주세요!\n매장 방문시 마스크를 꼭 착용해주세요.',
                                  style: TextStyle(fontSize: listItemFontSize),
                                ),
                                Text(
                                  '2021.02.25 14:02:17',
                                  style: TextStyle(
                                      color: Color(0xff888888),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Container(
                                margin:
                                    EdgeInsets.only(left: screenWidth * 0.02),
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 40,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Container(
                        color: Color(0xffeeeeee),
                        width: screenWidth,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(screenWidth * 0.1, screenWidth * 0.03, screenWidth * 0.06, screenWidth * 0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: screenWidth * 0.08,
                                height: screenWidth * 0.08,
                                child: Image.asset(
                                  'assets/images/starbucks/cup.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.05),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '8번째 메뉴로 준비중입니다.(A-82)',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    '2021.02.25 14:02:17',
                                    style: TextStyle(
                                        color: Color(0xff888888),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Container(
                        width: screenWidth * 0.92,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.09,
                              height: screenWidth * 0.09,
                              child: Image.asset(
                                'assets/images/starbucks/star.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '지금 마이 스타벅스 리뷰에 참여해보세요!',
                                  style: TextStyle(fontSize: listItemFontSize),
                                ),
                                Text(
                                  '2021.03.05 17:44:41',
                                  style: TextStyle(
                                      color: Color(0xff888888),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Container(
                                margin:
                                    EdgeInsets.only(left: screenWidth * 0.02),
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 40,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Container(
                        // color: Colors.red,
                        width: screenWidth * 0.92,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.09,
                              height: screenWidth * 0.09,
                              child: Image.asset(
                                'assets/images/starbucks/cup.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '메뉴가 모두 준비되었어요.(A-23)',
                                  style: TextStyle(fontSize: listItemFontSize),
                                ),
                                Text(
                                  '픽업대에서 메뉴를 픽업해주세요!\n매장 방문시 마스크를 꼭 착용해주세요.',
                                  style: TextStyle(fontSize: listItemFontSize),
                                ),
                                Text(
                                  '2021.02.23 14:02:17',
                                  style: TextStyle(
                                      color: Color(0xff888888),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Container(
                                margin:
                                    EdgeInsets.only(left: screenWidth * 0.02),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 40,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Container(
                        // color: Colors.red,
                        width: screenWidth * 0.92,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.09,
                              height: screenWidth * 0.09,
                              child: Image.asset(
                                'assets/images/starbucks/cup.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '메뉴가 모두 준비되었어요.(A-82)',
                                  style: TextStyle(fontSize: listItemFontSize),
                                ),
                                Text(
                                  '픽업대에서 메뉴를 픽업해주세요!\n매장 방문시 마스크를 꼭 착용해주세요.',
                                  style: TextStyle(fontSize: listItemFontSize),
                                ),
                                Text(
                                  '2021.02.23 14:02:17',
                                  style: TextStyle(
                                      color: Color(0xff888888),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Container(
                                margin:
                                    EdgeInsets.only(left: screenWidth * 0.02),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 40,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Container(
                        // color: Colors.red,
                        width: screenWidth * 0.92,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.09,
                              height: screenWidth * 0.09,
                              child: Image.asset(
                                'assets/images/starbucks/cup.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '4번째 메뉴로 준비중입니다.(A-85)',
                                  style: TextStyle(fontSize: listItemFontSize),
                                ),
                                Text(
                                  '준비가 완료되면 알려드릴게요!\n매장 방문시 마스크를 꼭 착용해주세요.',
                                  style: TextStyle(fontSize: listItemFontSize),
                                ),
                                Text(
                                  '2021.02.23 14:02:17',
                                  style: TextStyle(
                                      color: Color(0xff888888),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Container(
                                margin:
                                    EdgeInsets.only(left: screenWidth * 0.02),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 40,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Container(
                        // color: Colors.red,
                        width: screenWidth * 0.92,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.09,
                              height: screenWidth * 0.09,
                              child: Image.asset(
                                'assets/images/starbucks/cup.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '메뉴가 모두 준비되었어요.(A-82)',
                                  style: TextStyle(fontSize: listItemFontSize),
                                ),
                                Text(
                                  '픽업대에서 메뉴를 픽업해주세요!\n매장 방문시 마스크를 꼭 착용해주세요.',
                                  style: TextStyle(fontSize: listItemFontSize),
                                ),
                                Text(
                                  '2021.02.23 14:02:17',
                                  style: TextStyle(
                                      color: Color(0xff888888),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Container(
                                margin:
                                EdgeInsets.only(left: screenWidth * 0.02),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 40,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Container(
                        // color: Colors.red,
                        width: screenWidth * 0.92,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.09,
                              height: screenWidth * 0.09,
                              child: Image.asset(
                                'assets/images/starbucks/cup.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '메뉴가 모두 준비되었어요.(A-23)',
                                  style: TextStyle(fontSize: listItemFontSize),
                                ),
                                Text(
                                  '픽업대에서 메뉴를 픽업해주세요!\n매장 방문시 마스크를 꼭 착용해주세요.',
                                  style: TextStyle(fontSize: listItemFontSize),
                                ),
                                Text(
                                  '2021.02.23 14:02:17',
                                  style: TextStyle(
                                      color: Color(0xff888888),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Container(
                                margin:
                                    EdgeInsets.only(left: screenWidth * 0.02),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 40,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Container(
                        // color: Colors.red,
                        width: screenWidth * 0.92,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.09,
                              height: screenWidth * 0.09,
                              child: Image.asset(
                                'assets/images/starbucks/cup.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '메뉴가 모두 준비되었어요.(A-82)',
                                  style: TextStyle(fontSize: listItemFontSize),
                                ),
                                Text(
                                  '픽업대에서 메뉴를 픽업해주세요!\n매장 방문시 마스크를 꼭 착용해주세요.',
                                  style: TextStyle(fontSize: listItemFontSize),
                                ),
                                Text(
                                  '2021.02.23 14:02:17',
                                  style: TextStyle(
                                      color: Color(0xff888888),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Container(
                                margin:
                                    EdgeInsets.only(left: screenWidth * 0.02),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 40,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
