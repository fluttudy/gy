import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Container(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 로그인 텍스트
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  '로그인',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
              ),
            ),

            // 인사 및 안내
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                // margin이 마이너스 값을 가질 수 없어서 transform을 사용함
                transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                margin: EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 로고
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                        width: 70,
                        height: 70,
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.cover,
                        )),
                    Text(
                      '안녕하세요.\n스타벅스입니다.',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 1.2),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '회원 서비스 이용을 위해 로그인 해주세요.',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 2.8),
                    ),
                  ],
                ),
              ),
            ),

            // 아이디, 비밀번호 입력
            Container(
              transform: Matrix4.translationValues(0.0, -60.0, 0.0),
              width: 380,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: '아이디'),
                  ),
                  Container(
                    height: 25,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: '비밀번호'),
                  ),
                  // 로그인 메뉴
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
            // 로그인하기 버튼
            Align(
              // alignment: Alignment.bottomCenter, // container를 bottom에 붙이는 방법?
              child: Container(
                width: 500,
                color: Colors.white,
                padding: EdgeInsets.only(top:20, bottom: 20),

                /// 컨테이너 탑에만 shadow 주고 싶었는데 실패함.
                // decoration: BoxDecoration(
                //   boxShadow: [
                //     BoxShadow(color: Colors.grey.withOpacity(0.5),
                //     spreadRadius: 5,
                //     blurRadius: 7,
                //     offset: Offset(0, 3)),
                //   ],
                // ),
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
            ),
          ],
        ),
      ),
    );
  }
}
