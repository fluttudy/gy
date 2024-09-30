import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/place_provider.dart';
import 'dart:async';
import '../screens/place_detail_screen.dart';

class PlaceSearchBar extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce; // Timer 변수를 추가

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(placeProvider);

    return Column(
      children: [
        Stack(
          children: [
            TextField(
              controller: _controller,
              onChanged: (value) {
                // 이전 타이머가 활성화되어 있으면 취소
                if (_debounce?.isActive ?? false) _debounce!.cancel();
                // 새로운 타이머 시작
                _debounce = Timer(const Duration(milliseconds: 200), () {
                  ref.read(placeProvider.notifier).searchPlaces(value);
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '장소 검색',
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _controller.clear(); // 텍스트 필드 클리어
                  ref.read(placeProvider.notifier).searchPlaces(''); // 결과도 클리어
                },
              ),
            ),
          ],
        ),
        // 검색 결과에 따라 ListView의 높이를 조정
        if (places.isNotEmpty) // 결과가 있을 때만 ListView 표시
          Expanded(
            child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(places[index].name),
                    subtitle: Text(places[index].address),
                    onTap: () {
                      // 선택된 장소의 상세 정보 화면으로 이동
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.88,
                            child: PlaceDetailScreen(
                                place: places[index]),
                          );
                        },
                      );
                      _controller.clear();
                    },
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}