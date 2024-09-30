import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/place_provider.dart'; // placeProvider 경로를 맞게 수정하세요
import '../models/place.dart'; // Place 모델 경로를 맞게 수정하세요
import '../screens/place_detail_screen.dart';

class BookmarkScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 즐겨찾기 목록을 placeProvider에서 가져옴
    final List<Place> favoritePlaces = ref.watch(placeProvider).where((place) => place.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('북마크 목록'),
      ),
      body: favoritePlaces.isNotEmpty
          ? ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(favoritePlaces[index].name),
              subtitle: Text(favoritePlaces[index].address),
              onTap: () {
                // 상세 정보 화면으로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlaceDetailScreen(place: favoritePlaces[index]),
                  ),
                );
              },
            ),
          );
        },
      )
          : Center(
        child: Text('저장된 북마크가 없습니다.'),
      ),
    );
  }
}
