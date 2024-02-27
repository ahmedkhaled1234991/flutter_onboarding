import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/data/data.dart';

import '../widgets/dot_widget.dart';
import '../widgets/next_button_widget.dart';
import '../widgets/page_view_item_widget.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController? _controller;
  int currentIndex = 0;
  double percentage = 0.25;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        color: contentsList[currentIndex].backgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: contentsList.length,
                  onPageChanged: (int index) {
                    if (index >= currentIndex) {
                      setState(() {
                        currentIndex = index;
                        percentage += 0.25;
                      });
                    } else {
                      setState(() {
                        currentIndex = index;
                        percentage -= 0.25;
                      });
                    }
                  },
                  itemBuilder: (context, index) {
                    return PageViewItemWidget(
                      index: index,
                      currentIndex: currentIndex,
                    );
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(
                              contentsList.length,
                              (index) => DotWidget(
                                  index: index, currentIndex: currentIndex),
                            ),
                          ),
                          const SizedBox(height: 10),
                          currentIndex == contentsList.length - 1
                              ? const SizedBox(height: 52)
                              : CupertinoButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Skip",
                                    style: TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      NextButtonWidget(
                        controller: _controller,
                        currentIndex: currentIndex,
                        percentage: percentage,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
