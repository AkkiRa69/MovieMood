import 'package:flutter/material.dart';
import 'package:flutter_homework_3_movie_ui/constant/app_color.dart';
import 'package:flutter_homework_3_movie_ui/constant/movie.dart';
import 'package:flutter_homework_3_movie_ui/views/movie_detail_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = PageController(initialPage: 3);
  final movie = Movie();

  final textStyle = const TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  final texts = [
    "All",
    "Action",
    "Comedy",
    "Adventure",
    "Romance",
    "Rated R",
    "Popular",
    "Latest"
  ];

  int selectedIndex = 0; // Add this to keep track of the selected category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backColor,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCover(),
            _buildCategories(),
            _buildMovies(
              title: "Most Popular",
              movies: movie.popularMovies,
            ),
            _buildMovies(
              title: "Latest Movies",
              movies: movie.latestMovies,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovies({String? title, final movies}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title ?? '',
                  style: textStyle,
                ),
                const Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 15),
            child: SizedBox(
              height: 240,
              child: ListView.builder(
                itemCount: movies.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 17),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailView(
                                movie: movies[index],
                              ),
                            ));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          movies[index]['image_url'].toString(),
                          width: 170,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.only(left: 17, bottom: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: textStyle,
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 40,
            width: MediaQuery.sizeOf(context).width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: texts.length,
              itemBuilder: (context, index) {
                bool isSelected = (selectedIndex == index);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index; // Update the selected index
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: isSelected
                          ? AppColor.red
                          : AppColor
                              .darkGrey, // Change color based on selection
                    ),
                    alignment: Alignment.center, // Ensure text is centered
                    child: Text(
                      texts[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: isSelected
                            ? Colors.white
                            : Colors.grey
                                .shade400, // Change text color based on selection
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCover() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: PageView.builder(
            itemCount: 6,
            controller: controller,
            itemBuilder: (context, index) {
              final item = movie.popularMovies[index];
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // The movie image
                  Image.asset(
                    item['image_url'].toString(),
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.cover,
                  ),
                  // The dark gradient overlay at the bottom
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.9),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        // Page indicator
        Positioned(
          bottom: 20,
          child: SmoothPageIndicator(
            controller: controller,
            count: 6,
            axisDirection: Axis.horizontal,
            effect: const ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              spacing: 5,
              dotColor: Colors.white,
              activeDotColor: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
