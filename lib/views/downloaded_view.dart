import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework_3_movie_ui/constant/app_color.dart';
import 'package:flutter_homework_3_movie_ui/constant/movie.dart';

class DownloadedView extends StatelessWidget {
  DownloadedView({super.key});
  final movie = Movie();

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TabData(
        index: 0,
        title: const Tab(
          child: Text(
            "Downloaded",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        content: _buildMovie(),
      ),
      TabData(
        index: 1,
        title: const Tab(
          child: Text(
            "Downloading",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        content: _buildMovie(),
      ),
    ];
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      color: AppColor.backColor,
      child: Column(
        children: [
          const SizedBox(
            height: 45,
          ),
          const Text(
            "Download",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: DynamicTabBarWidget(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerHeight: 0,
              labelStyle: TextStyle(
                color: AppColor.red,
                fontWeight: FontWeight.bold,
              ),
              indicatorColor: AppColor.red,
              unselectedLabelColor: Colors.white70,
              dynamicTabs: tabs,
              onTabControllerUpdated: (p0) {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovie() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.backColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.builder(
        itemCount: movie.latestMovies.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: AppColor.darkGrey,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(15),
            height: 170,
            margin: const EdgeInsets.only(left: 17, right: 17, bottom: 15),
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      movie.latestMovies[index]['image_url'].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  movie.latestMovies[index]['name'].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              const Icon(
                                Icons.more_vert_outlined,
                                color: Colors.white70,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Action, Adventure",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '2:05:32',
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            '  |  ',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            '12GB',
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
