import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'providers/place_provider.dart';
import 'utils/place_search_bar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  await dotenv.load(fileName: ".env");
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Places',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreen(),
    );
  }
}

class MapScreen extends ConsumerWidget {
  // 기본 위치를 클래스 필드로 선언
  final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.4573, 126.6467),
    zoom: 11.0,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(placeProvider);

    // GoogleMapController를 선언
    GoogleMapController? _controller; // 초기값을 null로 설정

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('My Places'),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [GoogleMap(
          initialCameraPosition: _initialPosition, // 클래스 필드 사용
          mapType: MapType.normal,
          onMapCreated: (controller) {
            _controller = controller; // _controller 초기화
          },
        ),
        Positioned(child: Padding(padding: const EdgeInsets.all(8.0),
          child: PlaceSearchBar(),
        ))
        ]
      ),
    );
  }
}