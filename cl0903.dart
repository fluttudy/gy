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
        body: Center(
          child: Column(
            children: [
              // 로그인 텍스트
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    '로그인',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),

              // 스타벅스 로고
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                    // color: Colors.red,
                    margin: EdgeInsets.only(top: 70, left: 30),
                    width: 80,
                    height: 80,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                    )),
              ),

              // 인사 및 안내
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(top: 40, left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                margin: EdgeInsets.only(top: 70),
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
                  ],
                ),
              ),

              // 로그인 메뉴
              Container(
                // color: Colors.yellow,
                padding: EdgeInsets.all(38),
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
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(
              onPressed: () {
              },
              child: Text(
                '로그인하기',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff00704a),
                minimumSize: Size(300, 60),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
