import 'package:flutter/material.dart';
import 'package:on_boarding_screen_with_provider/OnBoarding.dart';
import 'package:provider/provider.dart';

class PageViewScreens extends StatefulWidget {
  const PageViewScreens({super.key});

  @override
  State<PageViewScreens> createState() => _PageViewScreensState();
}

class _PageViewScreensState extends State<PageViewScreens> {
  final _pageController = PageController();
  // @override
  // void initState() {
  //   _pageController = PageController(initialPage: 0);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    print("object");
    var provider = Provider.of<OnBoarding>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.pink,
        body: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: provider.list.length,
              pageSnapping: true,
              onPageChanged: (val) {
                provider.setIndex(val);
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      provider.list[index],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<OnBoarding>(
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            value.setClick(value.click);
                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: value.click == true
                                    ? Colors.indigo
                                    : Colors.white),
                            child: Center(
                              child: Text(
                                "Click Me",
                                style: TextStyle(
                                    color: value.click == true
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    // const Spacer(),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int a = 0; a < 3; a++)
                    indicator(isActive: a == provider.pageIndex),
                ],
              ),
            ),
          ],
        ));
  }
}

class indicator extends StatelessWidget {
  const indicator({
    this.isActive = false,
    super.key,
  });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: isActive == true ? 15 : 10,
      width: 15,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive == true ? Colors.white : Colors.amber),
    );
  }
}
