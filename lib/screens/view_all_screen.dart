import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_game_ui/constant.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({Key? key}) : super(key: key);

  @override
  _ViewAllScreenState createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  final List<dynamic> _games = [
    {
      'title': 'Cyberpunk 2077',
      'image': 'assets/images/cyberpunk.png',
      'description': 'Futuristic Game'
    },
    {
      'title': 'Spiderman',
      'image': 'assets/images/spiderman.png',
      'description': 'Live like a Spider!'
    },
    {
      'title': 'Outriders',
      'image': 'assets/images/outrider3.jpg',
      'description': 'Survival of the Best'
    },
    {
      'title': 'Halo Infinite',
      'image': 'assets/images/halo_infinite.jpg',
      'description': 'The ultimate battel royale'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(_games[_currentIndex]['image'], fit: BoxFit.cover),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black,
                        Colors.black,
                        Colors.black,
                        Colors.black12,
                        Colors.black12,
                        Colors.black12,
                        Colors.black12,
                        Colors.black12,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 500.0,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.65,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  carouselController: _carouselController,
                  items: _games.map((games) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 320,
                                  margin: const EdgeInsets.only(top: 30),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(games['image'],
                                      fit: BoxFit.cover),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  games['title'],
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                // rating
                                const SizedBox(height: 10),
                                Text(
                                  games['description'],
                                  style: const TextStyle(
                                      fontSize: 18.0, color: Colors.grey),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Play Now',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
