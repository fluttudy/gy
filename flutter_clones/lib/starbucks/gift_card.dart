import 'package:flutter/material.dart';
import 'widgets/image_slider_main.dart';
import 'widgets/image_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GiftCard(),
    );
  }
}

class GiftCard extends StatefulWidget {
  @override
  State<GiftCard> createState() {
    return GiftCardState();
  }
}


class GiftCardState extends State<GiftCard> {
  @override
  Widget build(BuildContext context) {
    // 상수 화면 너비, 높이 값
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.11),
            child: AppBar(
              backgroundColor: Colors.white,
              flexibleSpace: Container(
                padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                    screenWidth * 0.15, screenWidth * 0.05, screenWidth * 0.03),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff777777),
                      size: 18,
                    ),
                    Text(
                      'e-Gift Card',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.info_outline_rounded)
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(screenHeight * 0.1),
                child: Column(
                  children: [
                    TabBar(tabs: [
                      Tab(
                        child: Container(
                            width: screenWidth * 0.4,
                            height: screenHeight * 0.2,
                            child: Center(
                              child: Text(
                                '선물하기',
                                style: TextStyle(color: Colors.black),
                              ),
                            )),
                      ),
                      Tab(child: Container(
                          width: screenWidth * 0.4,
                          height: screenHeight * 0.2,
                          child: Center(
                            child: Text(
                              '선물내역',
                              style: TextStyle(color: Colors.grey),
                            ),
                          )),)
                    ],
                      indicatorColor: Colors.green,
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                  ],
                ),
              ),
            )
        ),
        body: GiftGivePage(),
      ),
    );
  }
}



class GiftGivePage extends StatefulWidget {
  @override
  State<GiftGivePage> createState() {
    return GiftGivePageState();
  }
}



class GiftGivePageState extends State<GiftGivePage> {
  // 페이지 컨트롤러 초기화
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // PageController에 리스너를 추가하여 페이지가 변경될 때마다 호출
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // 상수 화면 너비, 높이 값
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight * 0.3,
                child: ImageSliderMain(pageController: _pageController),
              ),
              SizedBox(height: screenHeight * 0.015), // 인디케이터와 슬라이더 사이의 간격
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(2, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: screenWidth * 0.028,
                    height: screenWidth * 0.028,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index ? Colors.brown : Colors.grey,
                    ),
                  );
                }),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.045,),
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(screenHeight * 0.01, screenHeight * 0.02, 0, screenHeight * 0.025),
                color: Color(0xffefefee),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.016, right: screenWidth * 0.016),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('시즌', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                          Row(
                            children: [
                              Text('더보기', style: TextStyle(fontSize: 12),),
                              Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14,)
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01,),
                    HorizontalImageList(
                      images: [
                        'assets/images/starbucks/card_2.png',
                        'assets/images/starbucks/card_3.png',
                        'assets/images/starbucks/card_4.png',
                        'assets/images/starbucks/card_1.png',
                      ],
                    )
                    ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(screenHeight * 0.01, screenHeight * 0.02, 0, screenHeight * 0.025),
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.016, right: screenWidth * 0.016),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Coffee', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                          Row(
                            children: [
                              Text('더보기', style: TextStyle(fontSize: 12),),
                              Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14,)
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01,),
                    HorizontalImageList(
                      images: [
                        'assets/images/starbucks/card_7.png',
                        'assets/images/starbucks/card_6.png',
                        'assets/images/starbucks/card_5.png',
                        'assets/images/starbucks/card_2.png',
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(screenHeight * 0.01, screenHeight * 0.02, 0, screenHeight * 0.025),
                color: Color(0xffefefee),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.016, right: screenWidth * 0.016),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('축하', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                          Row(
                            children: [
                              Text('더보기', style: TextStyle(fontSize: 12),),
                              Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14,)
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01,),
                    HorizontalImageList(
                      images: [
                        'assets/images/starbucks/card_3.png',
                        'assets/images/starbucks/card_2.png',
                        'assets/images/starbucks/card_6.png',
                        'assets/images/starbucks/card_7.png',
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}









