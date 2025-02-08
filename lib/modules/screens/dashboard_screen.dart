import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/constants/image_constants.dart';
import '../../core/utils/constants/text_constants.dart';
import '../../core/utils/helpers/components/expandable_card.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final List<String> imageList = [
    ImageConstants.networkImage1,
    ImageConstants.networkImage2,
    ImageConstants.newtworkImage3,
    ImageConstants.newtworkImage4,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(
          TextConstants.dashboard,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildAnimatedCarousel(),
            const SizedBox(height: 15.0),
            Expanded(child: _buildCollapsibleCards()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(
          '/homeScreen',
          //transition: Transition.rightToLeftWithFade
        ),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }

  Widget _buildAnimatedCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250.0,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: imageList
          .map((item) => Container(
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(item),
                    fit: BoxFit.cover,
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildCollapsibleCards() {
    return ListView(
      children: List.generate(3, (index) => ExpandableCard(index: index)),
    );
  }
}
