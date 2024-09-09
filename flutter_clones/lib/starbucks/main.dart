import 'package:flutter/material.dart';
import 'signup_first.dart';
import 'signup_second.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool isChecked = false;

    return MaterialApp(
      home: SignUpFirst(),
      routes: {'/second': (context) => SignUpSecond(),},
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
