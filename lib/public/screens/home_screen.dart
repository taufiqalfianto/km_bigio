import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/public/services/image_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Discover everything related to the Rick and Morty universe.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25),
          CarouselSlider.builder(
            itemCount: images.length,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              height: 400,
              viewportFraction: 1,
            ),
            itemBuilder: (context, index, realIdx) {
              return Center(
                child: Image.asset(
                  images[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
