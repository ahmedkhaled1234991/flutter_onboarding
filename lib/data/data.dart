import 'package:flutter/material.dart';

class OnboardingContent {
  final String image;
  final String title;
  final String description;
  final Color backgroundColor;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
    required this.backgroundColor,
  });
}

List<OnboardingContent> contentsList = [
  OnboardingContent(
    image: "assets/images/img_car1.svg",
    title: "Your first car without a driver's license",
    description: "Goes to meet people who just got their license",
    backgroundColor: const Color(0xFFF0CF69),
  ),
  OnboardingContent(
    image: "assets/images/img_car2.svg",
    title: "Always there: more than 1000 cars",
    description: "Our company is a leader by the number of cars in the fleet",
    backgroundColor: const Color(0xFFB7ABFD),
  ),
  OnboardingContent(
    image: "assets/images/img_car3.svg",
    title: "Don't pay for parking and maintenance",
    description: "We will pay for you, all expenses related to the car",
    backgroundColor: const Color(0xFFEFB491),
  ),
  OnboardingContent(
    image: "assets/images/img_car4.svg",
    title: "29 car models: from Skoda to Porsche",
    description: "Choose between regular car models or exclusive ones",
    backgroundColor: const Color(0xFF95B6FF),
  ),
];
