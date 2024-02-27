import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class NextButtonWidget extends StatelessWidget {
  final PageController? controller;
  final int currentIndex;
  final double percentage;

  const NextButtonWidget({
    super.key,
    required this.controller,
    required this.currentIndex,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        if (currentIndex == contentsList.length - 1) {
          // Go to next page...
        } else {
          controller!.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 55,
            width: 55,
            child: CircularProgressIndicator(
              value: percentage,
              backgroundColor: Colors.white38,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Colors.white,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: contentsList[currentIndex].backgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
