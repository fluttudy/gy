import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CitySearchScreen extends StatefulWidget {
  const CitySearchScreen({Key? key}) : super(key: key);

  @override
  _CitySearchScreenState createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> _searchResults = [];
  List<String> _allCities = []; // API로부터 받아온 도시 리스트
  final String apiKey = 'a0db626d7a4aceb088e90c8f01bc4ae1';

  void _searchCity(String query) async {
    if (query.isNotEmpty) {
      final results = await _fetchCities(query);
      setState(() {
        _searchResults = results;
      });
    } else {
      setState(() {
        _searchResults.clear();
      });
    }
  }

  Future<List<String>> _fetchCities(String query) async {
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$query&appid=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // 도시 이름을 리스트에 추가
      return [data['name']]; // 단일 도시 이름을 반환
    } else {
      // 에러 처리 로직 추가
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('도시 검색'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: _searchCity,
              decoration: InputDecoration(
                labelText: '도시 이름 입력',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    _searchCity('');
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_searchResults[index]),
                    onTap: () {
                      Navigator.pop(context, _searchResults[index]); // 선택한 도시 반환
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
