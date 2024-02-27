import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/data.dart';

class PageViewItemWidget extends StatelessWidget {
  final int index;
  final int currentIndex;

  const PageViewItemWidget({
    super.key,
    required this.index,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: currentIndex == 0 || currentIndex == 3
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                contentsList[index].title,
                style: const TextStyle(
                  fontFamily: "SF-Pro",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 28.0,
                  letterSpacing: 0.24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                contentsList[index].description,
                style: const TextStyle(
                  fontFamily: "SF-Pro",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
        SvgPicture.asset(
          contentsList[index].image,
        ),
      ],
    );
  }
}
