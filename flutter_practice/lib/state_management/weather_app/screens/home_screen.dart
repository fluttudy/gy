import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/weather_provider.dart';
import '../styles/app_color.dart';
import '../utils/weather_search.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // weatherProvider의 상태를 구독해서, 리빌드함. weatherProvider의 현재 상태를 반환.
    final weatherList = ref.watch(weatherProvider);
    // weatherProvider의 StateNotifier 인스턴스를 읽음. 상태를 직접 업데이트하거나 메서드 호출. weatherProvider의 인스턴스를 반환.
    final notifier = ref.read(weatherProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Text(
          'Weather Today',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: WeatherSearch(notifier: notifier),
              );
            },
          ),
        ],
      ),
      body: weatherList.isEmpty
          ? Center(child: Text('날씨 정보가 없습니다.'))
          : ListView.separated(
              itemCount: weatherList.length,
              separatorBuilder: (context, index) => SizedBox(height: 10.0),
              itemBuilder: (context, index) {
                final weatherItem = weatherList[index];
                final iconId = weatherItem.iconId;
                final iconSrc =
                    'http://openweathermap.org/img/wn/$iconId@2x.png';

                return Dismissible(
                    key: Key(weatherItem.cityName),
                    onDismissed: (direction) {
                      ref.read(weatherProvider.notifier).removeCity(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Color.fromRGBO(37, 36, 96, 1)], // 그라데이션 색상
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15), // 카드의 모서리 둥글게
                      ),
                      child: Card(
                        elevation: 4,
                        color: AppColors.cardColor.withOpacity(0.2),
                        child: ListTile(
                          title: Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                      onPressed: () {
                                        notifier.toggleFavorite(index);
                                        print(weatherItem.isFavorite);
                                      },
                                      icon: Icon(
                                        weatherItem.isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_outline,
                                        color: Colors.white,
                                      ))),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        weatherItem.cityName,
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        '${weatherItem.currentTemp.toStringAsFixed(0)}°C',
                                        style: TextStyle(
                                            fontSize: 32,
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Image.network(iconSrc),
                                ],
                              ),
                            ],
                          ),
                          subtitle: Text(
                            '${weatherItem.weatherDescription}',
                            style: TextStyle(color: AppColors.textColor),
                          ),
                        ),
                      ),
                    ));
              }),
    );
  }
}
