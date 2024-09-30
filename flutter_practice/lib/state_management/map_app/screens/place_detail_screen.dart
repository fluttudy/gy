import 'package:flutter/material.dart';
import '../models/place.dart';

class PlaceDetailScreen extends StatelessWidget {
  final Place place;

  PlaceDetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name), // 장소 이름 표시
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
