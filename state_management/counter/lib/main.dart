import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/counter_provider.dart';
import 'styles/app_colors.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

// 홈 스크린 빌드 - ConsumerWidget으로 riverpod에서 상태를 구독함. 상태가 변경될 때 자동으로 재빌드됨.
// ref : Riverpod에서 상태를 관리하고 접근하기 위해 제공하는 객체. WidgetRef 타입의 인스턴스.
class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Counter',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 2.0,
              )
            ],
          )),
      body:
      Center(
        child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.ballColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${ref.watch(counterProvider)}', // 카운터 값 읽기, 단순한 int 값을 반환
                style: TextStyle(fontSize: 100, color: AppColors.numColor, fontFamily: 'SCDream', fontWeight: FontWeight.bold),
              ),
            )),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: AppColors.buttonColor,
            onPressed: () {
              // Counter 객체를 반환. 객체에는 상태를 변경할 수 있는 메서드 increment()가 포함되어 있음. 단순값과 객체를 구분하기 위해 .notifier를 붙임.
              ref.read(counterProvider.notifier).increment(); // 카운터 값 증가
            },
            child: Icon(Icons.add, color: AppColors.buttonIconColor,),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: AppColors.buttonColor,
            onPressed: () {
              ref.read(counterProvider.notifier).decrement(); // 카운터 값 감소
            },
            child: Icon(Icons.remove, color: AppColors.buttonIconColor),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: AppColors.buttonColor,
            onPressed: () {
              ref.read(counterProvider.notifier).reset(); // 카운터 값 리셋
            },
            child: Icon(Icons.refresh, color: AppColors.buttonIconColor),
          )
        ],
      ),
    );
  }
}
