import 'package:flutter_dotenv/flutter_dotenv.dart';

class Place {
  final String placeId; // 추가된 placeId
  final String name;
  final String description;
  final String address;
  final String phoneNumber;
  final double rating;
  final String photoUrl;

  Place({
    required this.placeId, // 생성자에 placeId 추가
    required this.name,
    required this.description,
    required this.address,
    required this.phoneNumber,
    required this.rating,
    required this.photoUrl,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      placeId: json['place_id'], // API 응답에서 placeId 가져오기
      name: json['name'],
      description: json['description'] ?? '',
      address: json['formatted_address'] ?? '',
      phoneNumber: json['formatted_phone_number'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      photoUrl: json['photos'] != null && json['photos'].isNotEmpty
          ? 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${json['photos'][0]['photo_reference']}&key=${dotenv.env['googleMapsApiKey']}'
          : '',
    );
  }
}