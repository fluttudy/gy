import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'provider/counter_provider.dart';

// 앱을 ProviderScope로 감싸준다.
void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

// 홈 화면 빌드 - ConsumerWidget으로 riverpod에서 상태를 구독함. 상태가 변경될 때 자동으로 재빌드됨.
// ref : Riverpod에서 상태를 관리하고 접근하기 위해 제공하는 객체. WidgetRef 타입의 인스턴스.
class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'Counter Ball',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          Divider(
            color: Colors.purple,
            thickness: 2.0,
          )
        ],
      )),
      body: Center(
        child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.purple,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25), // 그림자 색상
                  blurRadius: 9.0, // 흐림 반경
                  spreadRadius: 2.0, // 확산 반경
                  offset: Offset(0, 2), // 그림자의 위치
                ),
              ],
            ),
            child: Center(
              child: Text(
                '${ref.watch(counterProvider)}',
                style: TextStyle(fontSize: 100, color: Colors.white),
              ),
            )), // 카운터 값 읽기, 단순한 int 값을 반환
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // CounterNotifier 객체를 반환. 객체에는 상태를 변경할 수 있는 메서드 increment()가 포함. 단순값과 객체를 구분하기 위해 .notifier를 붙임.
              ref.read(counterProvider.notifier).increment(); // 카운터 값 증가
            },
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).decrement(); // 카운터 값 감소
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).reset(); // 카운터 값 초기화
            },
            child: Icon(Icons.refresh),
          )
        ],
      ),
    );
  }
}
