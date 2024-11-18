import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework_3_movie_ui/constant/app_color.dart';
import 'package:readmore/readmore.dart';

class MovieDetailView extends StatefulWidget {
  final Map movie;
  const MovieDetailView({super.key, required this.movie});

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  bool isScrollable = false;
  bool showNextIcon = true;
  bool showBackIcon = true;
  final description =
      "In a world where skyscrapers are mere toothpicks and the ocean is a jacuzzi, the two biggest divas in monster history are back—and this time, they’ve got...";
  final description2 =
      "In a world where skyscrapers are mere toothpicks and the ocean is a jacuzzi, the two biggest divas in monster history are back—and this time, they’ve got grudges the size of New York! Godzilla, the radioactive lizard with anger issues, faces off against Kong, the giant ape who's done CrossFit (and therapy) since their last brawl. Forget logic, physics, and urban planning—these titans have one thing on their minds: who’s the real king of catastrophic property damage? Expect skyscrapers to crumble, boats to be used as frisbees, and humanity to do what it does best—stand around screaming with smartphones out.";

  @override
  Widget build(BuildContext context) {
    // Ensure that the tabs list is properly initialized.
    List<TabData> tabs = [
      TabData(
        index: 1,
        title: const Tab(
          child: Text(
            'Episode',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        content: _buildTab(),
      ),
      TabData(
        index: 2,
        title: const Tab(
          child: Text(
            'Similar',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        content: _buildTab(),
      ),
      TabData(
        index: 3,
        title: const Tab(
          child: Text(
            'About',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        content: _buildTab(),
      ),
    ];

    // Check if the tabs list is null or empty before rendering
    if (tabs.isEmpty) {
      return const Center(
        child: Text(
          'No tabs available',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.backColor,
      appBar: _buildAppBar(),
      body: DefaultTabController(
        length: tabs.length, // Adjusted length to match the tabs
        child: Column(
          children: [
            _buildCover(),
            Expanded(
              child: _buildDetail(tabs),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.darkGrey,
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                widget.movie['image_url'], // Ensure the image URL is not null
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Handle cases where the image URL is invalid
                  return const Icon(
                    Icons.broken_image,
                    color: Colors.red,
                    size: 100,
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Trailer",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        CupertinoIcons.arrow_down_to_line,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Text(
                    description2,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetail(List<TabData> tabs) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              Text(
                widget.movie['name'] ?? 'Unknown', // Handle null movie name
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                "2024 • Adventure, Comedy • 2h 8m",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.red,
                          padding: const EdgeInsets.all(12),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Play',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.darkGrey,
                          padding: const EdgeInsets.all(12),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.arrow_down_to_line_alt,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Download',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ReadMoreText(
                description2,
                trimMode: TrimMode.Line,
                trimLines: 3,
                textAlign: TextAlign.center,
                trimCollapsedText: 'Read more',
                trimExpandedText: 'Read less',
                style: const TextStyle(
                  color: Colors.white70,
                ),
                lessStyle: TextStyle(
                  color: AppColor.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                moreStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: DynamicTabBarWidget(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            labelColor: AppColor.red,
            unselectedLabelColor: Colors.white70,
            dividerHeight: 0,
            indicatorColor: AppColor.red,
            indicatorPadding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.tab,
            dynamicTabs: tabs,
            isScrollable: isScrollable,
            onTabControllerUpdated: (controller) {},
            onTabChanged: (index) {},
            onAddTabMoveTo: MoveToTab.last,
          ),
        ),
      ],
    );
  }

  Widget _buildCover() {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            AppColor.backColor,
          ],
          stops: const [
            0,
            2
          ], // Adjust the stops for a smoother or sharper transition
          tileMode: TileMode.clamp,
        ).createShader(bounds);
      },
      blendMode: BlendMode
          .darken, // This determines how the shader blends with the image
      child: Image.asset(
        widget.movie['image_url'],
        height: MediaQuery.sizeOf(context).height * 0.45,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      titleSpacing: 17,
      title: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            Colors.white.withOpacity(0.3),
          ),
        ),
        icon: const Icon(
          Icons.arrow_back_ios_new_sharp,
          color: Colors.white,
          size: 18,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 17),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Colors.white.withOpacity(0.3),
                  ),
                ),
                icon: const Icon(
                  Icons.bookmark_border_outlined,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Colors.white.withOpacity(0.3),
                  ),
                ),
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
