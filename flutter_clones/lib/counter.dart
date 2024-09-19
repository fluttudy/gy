import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 0. 앱을 ProviderScope로 감싸준다.
void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

// 1. StateNotifier - 카운터의 상태를 관리하기 위한 클래스
// StateNotifier는 상태를 관리하기 위한 클래스. 상태를 변경하는 메서드를 정의하고, 상태가 변경될 때 UI를 자동으로 업데이트하는 기능을 제공.
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0); // 초기값을 0으로 설정

  // 증가 메서드 작성
  void increment() {
    state++; // 상태를 증가시킴
  }
}

// 2. StateNotifierProvider
// tateNotifierProvider는 StateNotifier의 인스턴스를 생성하고, 그 상태를 관리하는 프로바이더
final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});


// 홈 화면 빌드
class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('counter')),
      body: Center(
        child: Text('${ref.watch(counterProvider)}'), // 카운터 값 읽기, 단순한 int 값을 반환
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // CounterNotifier 객체를 반환. 객체에는 상태를 변경할 수 있는 메서드 increment()가 포함. 단순값과 객체를 구분하기 위해 .notifier를 붙임.
            ref.read(counterProvider.notifier).increment(); // 카운터 값 증가
      },
      child: Icon(Icons.add),),
    );
  }
}
