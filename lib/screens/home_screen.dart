import 'package:flutter/material.dart';

import 'package:video_game_ui/constant.dart';
import 'package:video_game_ui/screens/detail_screen.dart';
import 'package:video_game_ui/screens/view_all_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, top: 30, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Welcome Back",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          Text("Flutter Boy",
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(Icons.notifications_sharp,
                              color: Colors.white, size: 32),
                          const SizedBox(width: 20),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              "assets/images/avatar.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const DefaultTabController(
                  length: 4,
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.red,
                    unselectedLabelColor: Colors.white,
                    labelColor: Colors.red,
                    labelStyle: TextStyle(fontSize: 18),
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 3, color: Colors.red),
                      insets: EdgeInsets.only(right: 32, left: 14),
                    ),
                    tabs: [
                      Tab(
                        child: Text('Popular'),
                      ),
                      Tab(
                        child: Text('New'),
                      ),
                      Tab(
                        child: Text('Trending'),
                      ),
                      Tab(
                        child: Text('Best'),
                      ),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.amber,
                  margin: const EdgeInsets.only(top: 8),
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const DetailScreen(),
                                ),
                              );
                            },
                            child: const PopularGamesWidget(
                              imageUrl: "assets/images/cyberpunk.png",
                              category: "Action",
                              gameName: "Cyberpunk 2077",
                              price: "\$59.99",
                            ),
                          ),
                          const PopularGamesWidget(
                            imageUrl: "assets/images/spiderman.png",
                            category: "Adventure",
                            gameName: "Spiderman",
                            price: "\$67.99",
                          ),
                          const PopularGamesWidget(
                            imageUrl: "assets/images/outrider3.jpg",
                            category: "Battel Royal",
                            gameName: "Outriders",
                            price: "\$72.99",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recent",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ViewAllScreen()));
                            },
                            child: const Text(
                              "View all",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            size: 24,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 200,
                            height: 100,
                            child: Image.asset(
                              "assets/images/infinite.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 200,
                            height: 100,
                            child: Image.asset(
                              "assets/images/outrider.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PopularGamesWidget extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String gameName;
  final String price;
  const PopularGamesWidget({
    Key? key,
    required this.imageUrl,
    required this.category,
    required this.gameName,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 8, left: 16, right: 16),
          height: MediaQuery.of(context).size.height * 0.35,
          width: 200,
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 5),
          child: Text(
            category,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: colorRed, fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 5),
          child: Text(
            gameName,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white, fontSize: 22),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            price,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white, fontSize: 22),
          ),
        ),
      ],
    );
  }
}
