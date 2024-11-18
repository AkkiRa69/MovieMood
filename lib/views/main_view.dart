import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework_3_movie_ui/constant/app_color.dart';
import 'package:flutter_homework_3_movie_ui/views/downloaded_view.dart';
import 'package:flutter_homework_3_movie_ui/views/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final pages = [
    const HomeView(),
    const Scaffold(),
    const Scaffold(),
     DownloadedView(),
    const Scaffold(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 75,
        child: BottomNavigationBar(
          onTap: (value) => setState(() {
            currentIndex = value;
          }),
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColor.darkGrey,
          selectedItemColor: Colors.white,
          currentIndex: currentIndex,
          iconSize: 26,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.search,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.bookmark,
                ),
                label: 'Saved'),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.arrow_down_to_line_alt,
                ),
                label: 'Downloads'),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.person,
                ),
                label: 'Me'),
          ],
        ),
      ),
    );
  }
}
