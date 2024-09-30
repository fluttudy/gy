import 'package:flutter/material.dart';

void main() => runApp(LogIn());

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 로그인 텍스트
            SizedBox(height: screenHeight * 0.02),
            Padding(padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '로그인',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                  SizedBox(height: screenHeight * 0.03,),
                  // 로고
                  Container(
                      margin: EdgeInsets.only(bottom: 30),
                      width: 70,
                      height: 70,
                      child: Image.asset(
                        'assets/images/starbucks/logo.png',
                        fit: BoxFit.cover,
                      )),
                  Text(
                    '안녕하세요.\n스타벅스입니다.',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        height: 1.2),
                  ),
                  Text(
                    '회원 서비스 이용을 위해 로그인 해주세요.',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 2.8),
                  ),

                  SizedBox(height: screenHeight * 0.05,),
                ],
              ),
            ),
            // 아이디, 비밀번호 입력
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.89,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          decoration: InputDecoration(hintText: '아이디'),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: TextField(
                            decoration: InputDecoration(hintText: '비밀번호'),
                          ),
                        ),


                        // 로그인 메뉴
                        // vertical devider 대신 컨테이너로 구분선 구현
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('아이디 찾기'),
                              Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                width: 1,
                                height: 10,
                                color: Colors.grey,
                              ),
                              Text('비밀번호 찾기'),
                              Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                width: 1,
                                height: 10,
                                color: Colors.grey,
                              ),
                              Text('회원가입'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 로그인하기 버튼
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    // decoration에서 color줬는데 container에서 color 또 주면 에러남
                    decoration:
                    BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        blurRadius: 7,
                        spreadRadius: 0.1,
                        offset: Offset(0, -10),
                      )
                    ]),
                    // 컨테이너 너비 화면의 100%로 설정하기
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top:20, bottom: 20),
                  
                    child: Align(
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        child: Text(
                          '로그인하기',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff4aa568),
                          minimumSize: Size(390, 47),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}