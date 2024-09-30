import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'signup_second_screen.dart';


class SignUpFirstScreen extends StatelessWidget {
  // 부모 클래스에 key값을 전달
  const SignUpFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool isChecked = false;

    return MaterialApp(
      title: 'Material App',
      routes: {
        '/second': (context) => SignUpSecondScreen(),
      },
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Icon(
              Icons.close,
              size: screenWidth * 0.1,
              color: Colors.grey,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(color: Colors.black, width: 0.1)),
                  //테두리
                  child: Text(
                    '1',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  child: Container(
                    width: screenWidth * 0.02,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 0.1)),
                  //테두리
                  child: Text(
                    '2',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  child: Container(
                    width: screenWidth * 0.02,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 0.1)),
                  //테두리
                  child: Text(
                    '3',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  child: Container(
                    width: screenWidth * 0.02,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 0.1)),
                  //테두리
                  child: Text(
                    '4',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '본인확인을 위해\n인증을 진행해 주세요.',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: screenHeight * 0.01,
                ),

                // 약관 동의
                SizedBox(
                  width: screenWidth * 0.9,
                  child: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.05),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 1.2,
                              child: CheckBox(),
                            ),
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            Text(
                              '본인 인증 서비스 약관 전체동의',
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('휴대폰 본인 인증 서비스 이용약관 동의 (필수)',
                                style: TextStyle(fontSize: 14, height: 1.6)),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('휴대폰 통신사 이용약관 동의 (필수)',
                                style: TextStyle(fontSize: 14, height: 1.6)),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('개인정보 제공 및 이용 동의 (필수)',
                                style: TextStyle(fontSize: 14, height: 1.6)),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('고유식별정보 처리 (필수)',
                                style: TextStyle(fontSize: 14, height: 1.6)),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                  thickness: 0.5,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.05),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              hintText: '이름',
                              hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w300),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                        Row(
                          children: [
                            // Textfiled를 SizedBox로 감싸니까
                            SizedBox(
                              width: screenWidth * 0.4,
                              child: TextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly, // 숫자만
                                  LengthLimitingTextInputFormatter(13) // 13자리만
                                ],
                                decoration: InputDecoration(
                                    hintText: '생년월일 6자리',
                                    hintStyle: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.grey)
                                    )
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.05,
                              child: Align(
                                child: Container(
                                  width: 8,
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.4,
                              child: TextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly, // 숫자만
                                  LengthLimitingTextInputFormatter(13) // 13자리만
                                ],
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.grey))),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropDownMenu(),
                            SizedBox(
                              width: screenWidth * 0.5,
                              child: TextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly, // 숫자만
                                ],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '휴대폰 번호',
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                            TextButton(onPressed: () {}, child: const Text('인증요청', style: TextStyle(color: Colors.grey),))
                          ],
                        ),
                        Divider(
                          thickness: 1.0,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Text(
                          '• 타인의 개인정보를 도용하여 가입한 경우, 서비스 이용 제한 및 법적 제재를 받으실 수 있습니다.',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),

                // 다음 버튼
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration:
                        BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15),
                            blurRadius: 7,
                            spreadRadius: 0.1,
                            offset: Offset(0, -10),
                          )
                        ]),
                        padding: EdgeInsets.all(screenWidth * 0.05),
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/second');
                          },
                          child: Text(
                            '다음',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffcccccc),
                            minimumSize: Size(390, 47),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}






class CheckBox extends StatefulWidget {
  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false; // null을 허용하지 않음

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Checkbox(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        value: isChecked,
        splashRadius: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: BorderSide(color: Colors.grey, width: 1.1),
        onChanged: (bool? value) {
          setState(() {
            isChecked = value ?? false; // null일 경우 false로 설정
          });
        },
      ),
    );
  }
}

class DropDownMenu extends StatefulWidget {
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String currentValue = 'SKT'; // 초기값 설정

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.05,
      child: DropdownButton(
        value: currentValue, // 현재 선택된 값 설정
        items: [
          DropdownMenuItem(
            value: 'SKT', // 각 메뉴의 값 설정
            child: Text('SKT'),
          ),
          DropdownMenuItem(
            value: 'KT',
            child: Text('KT'),
          ),
          DropdownMenuItem(
            value: 'LGU+',
            child: Text('LGU+'),
          ),
        ],
        onChanged: (value) {
          setState(() {
            currentValue = value ?? 'SKT'; // 상태 업데이트
          });
        },
        underline: SizedBox(),
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.grey,
        ),
      ),
    );
  }
}
