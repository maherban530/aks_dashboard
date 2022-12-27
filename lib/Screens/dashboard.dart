import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Providers/dashboard_provider.dart';
import 'Widgets/all_categories_widget.dart';
import 'Widgets/best_seller_widget.dart';
import 'Widgets/day_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // PageController? _pageController;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DashboardProvider>(context, listen: false)
          .getDashboardDetails();
    });

    // _pageController = PageController(viewportFraction: 0.8);
  }

  int _current = 0;
  int activePage = 0;
  bool moreCategories = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, value, child) {
      if (value.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      final dashboardData = value.dashboardData;
      YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: 'iLnmTe5Q2Qw',
        // dashboardData?.result?.youtubeVideo ?? '',
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: true,
        ),
      );
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Scrollbar(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(14),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                        dashboardData?.result?.dashboardCalender?.length ?? 0,
                        ((i) => DayWidget(
                            dashboardCalender:
                                dashboardData!.result!.dashboardCalender![i])))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 130,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dashboardData?.result?.bannerList?.length ?? 0,
                // pageSnapping: true,
                // controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      dashboardData!.result!.bannerList![index].bannerPhoto!,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    dashboardData?.result?.bannerList?.length ?? 0,
                    ((i) => Icon(
                          Icons.circle,
                          size: 8,
                          color: activePage == i ? Colors.black : Colors.grey,
                        )))
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "All Categories",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            dashboardData == null
                ? Container()
                : GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 2 / 3,
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 0.0,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    children: List.generate(
                        !moreCategories &&
                                dashboardData.result!.categoryList!.length > 8
                            ? 8
                            : dashboardData.result?.categoryList?.length ?? 0,
                        (ind) {
                      return AllCategoriesWidget(
                          categoryList:
                              dashboardData.result!.categoryList![ind]);
                    })),
            InkWell(
              onTap: () {
                setState(() {
                  moreCategories = !moreCategories;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(14.0),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: moreCategories
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                        color: moreCategories
                            ? Colors.transparent
                            : Theme.of(context).primaryColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      moreCategories ? 'VIEW LESS' : 'VIEW MORE',
                      style: TextStyle(
                        color: moreCategories
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                    Icon(
                      moreCategories
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: moreCategories
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 26, horizontal: 14),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dashboardData?.result?.mainText ?? '',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    dashboardData?.result?.subText ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 320.0,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  children: [
                    ...List.generate(
                        dashboardData?.result?.sallerProductList?.length ?? 0,
                        (int ind) {
                      return BestSellerWidget(
                        sallerProductList:
                            dashboardData!.result!.sallerProductList![ind],
                      );
                    }),
                    Container(
                      height: 200,
                      width: 150,
                      color: Colors.white,
                      child: const Center(child: Text("View All product")),
                    )
                  ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 26, horizontal: 14),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
              decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border.all(
                    color: Colors.green.shade100,
                  )),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dashboardData?.result?.referEarnText?.titleText ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          dashboardData?.result?.referEarnText?.subText ?? '',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/refer.jpg',
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              padding: const EdgeInsets.all(14),
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
                onReady: () {
                  // _controller.addListener(listener);
                },
              ),
            ),
          ],
        ),
      );
    }
        // ),
        );
  }
}
