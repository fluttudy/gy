import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. StateNotifier - 카운터의 상태를 관리하기 위한 클래스
// StateNotifier는 상태를 관리하기 위한 클래스. 상태를 변경하는 메서드를 정의하고, 상태가 변경될 때 UI를 자동으로 업데이트하는 기능을 제공.
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0); // 초기값을 0으로 설정

  // 증가 메서드 작성
  void increment() {
    state++; // 상태를 증가시킴
  }

  // 감소 메서드 작성
  void decrement() {
    if (state > 0) {
      state--; // 상태를 감소시킴
    } else {
      state = 0; // 상태가 0보다 작아지지 않도록 0으로 설정
    }
  }

  // 초기화 메서드 작성
  void reset() {
    state = 0;
  }
}

// 2. StateNotifierProvider
// tateNotifierProvider는 StateNotifier의 인스턴스를 생성하고, 그 상태를 관리하는 프로바이더
final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});
