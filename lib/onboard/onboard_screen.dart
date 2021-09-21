import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/screens/home_page.dart';
// import 'package:get/get.dart';
import 'controller.dart';

class OnBoardScreen extends StatelessWidget {
  OnBoardScreen({Key? key}) : super(key: key);
  final _controller = OnBoardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPageIndex,
              itemCount: _controller.screens.length,
              itemBuilder: (context, index) {
                // ignore: avoid_unnecessary_containers
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(_controller.screens[index].imagePath),
                      Text(_controller.screens[index].title),
                      Text(_controller.screens[index].description)
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 8,
              left: 10,
              child: TextButton(
                child: const Text('Skip'),
                onPressed: () {
                  _controller.storeOnboardInfo();
                  // Get.off(const HomePage());
                  Get.off(() => HomePage());
                },
              ),
            ),
            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width / 2.5,
              child: Row(
                children: List.generate(
                  _controller.screens.length,
                  (index) => Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _controller.selectedPageIndex.value == index
                            ? Colors.red
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              bottom: 8.0,
              right: 20,
              child: Obx(
                () {
                  return TextButton(
                    child: _controller.isLastPage
                        ? const Text('Start')
                        : const Text('Next'),
                    // onPressed: () {
                    //   _controller.selectedPageIndex.value ==
                    //           _controller.screens.length - 1
                    //       ? Get.off(
                    //           () => const HomePage(),
                    //         )
                    //       : null;
                    // },
                    onPressed: () {
                      _controller.forwardAction(HomePage());
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
