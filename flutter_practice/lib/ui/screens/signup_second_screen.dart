import 'package:flutter/material.dart';

class SignUpSecondScreen extends StatefulWidget {
  const SignUpSecondScreen({super.key});

  @override
  SignUpSecondScreenState createState() => SignUpSecondScreenState();
}

class SignUpSecondScreenState extends State<SignUpSecondScreen> {
  final TextEditingController _idContoller = TextEditingController();
  bool _isIdValid = false;

  void _validateInput(String input) {
    // 아이디가 4~13자리인지 확인
    setState(() {
      _isIdValid = input.length >= 4 && input.length <= 13;
    });
  }

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordValid = false;
  bool _isPasswordMatched = false;

  bool _obscurePassword = true; // 비밀번호 숨김 여부
  bool _obscureConfirmPassword = true; // 비밀번호 확인 숨김 여부

  void _checkPassword() {
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    setState(() {
      // 비밀번호가 10~20자리인지 확인
      _isPasswordValid = password.length >= 10 && password.length <= 20;
      // 비밀번호와 비밀번호 확인이 일치하는지 확인
      _isPasswordMatched = _isPasswordValid && password == confirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.08),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '아이디와 비밀번호를\n입력해 주세요.',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextField(
                    controller: _idContoller,
                    onChanged: _validateInput,
                    decoration: InputDecoration(
                      hintText: '아이디 (4~13자리 이내)',
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2.0),
                      ),
                      suffixIcon: _isIdValid
                          ? Icon(Icons.check, color: Colors.green) // 체크 아이콘
                          : null,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.85,
                  child: TextField(
                    controller: _passwordController,
                    onChanged: (value) => _checkPassword(),
                    decoration: InputDecoration(
                      hintText: '비밀번호 (10~20자리 이내)',
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green, width: 1), // 포커스 시 두께 조절
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          if (_isPasswordValid)
                            Icon(Icons.check, color: Colors.green),
                        ],
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.85,
                  child: TextField(
                    controller: _confirmPasswordController,
                    onChanged: (value) => _checkPassword(),
                    decoration: InputDecoration(
                      hintText: '비밀번호 확인',
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green, width: 1), // 포커스 시 두께 조절
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          if (_isPasswordMatched)
                            Icon(Icons.check, color: Colors.green),
                        ],
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
              ],
            ),
          ),

          // 다음 버튼
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
                      backgroundColor: const Color(0xff4aa568),
                      minimumSize: Size(390, 47),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
