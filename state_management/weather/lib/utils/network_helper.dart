import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  // 싱글턴 패턴: _instance라는 정적 변수를 통해 NetworkHelper의 단일 인스턴스를 생성
  // // factory 생성자를 사용하여 항상 동일한 인스턴스를 반환
  static final NetworkHelper _instance = NetworkHelper._internal();
  factory NetworkHelper() => _instance;
  NetworkHelper._internal();

  // 비동기 메서드 getData : url을 인자로 받아 http get 요청을 보냄. await를 사용해 결과를 기다림
  Future getData(String url) async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }else {
      print(response.statusCode);
    }
  }
}