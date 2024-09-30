import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/place.dart';
import '../providers/place_provider.dart';

class PlaceDetailScreen extends ConsumerWidget {
  final Place place;

  PlaceDetailScreen({required this.place});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // placeProvider의 전체 상태를 watch
    final places = ref.watch(placeProvider);

    // 현재 place의 최신 상태
    final currentPlace = places.firstWhere(
            (p) => p.placeId == place.placeId,
        orElse: () => place
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(currentPlace.name), // 장소 이름 표시
        // automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              currentPlace.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: currentPlace.isFavorite ? Colors.red : null,
            ),
            onPressed: () {
              // 즐겨찾기 토글
              ref.watch(placeProvider.notifier).toggleFavorite(currentPlace);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // 장소 사진
            if (place.photoUrl.isNotEmpty)
              Image.network(
                place.photoUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 16),
            Text(
              place.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              place.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '주소: ${place.address}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '전화번호: ${place.phoneNumber}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '평점: ${place.rating.toString()}',
              style: TextStyle(fontSize: 16),
            ),
            // 추가적인 정보 표시 가능
          ],
        ),
      ),
    );
  }
}