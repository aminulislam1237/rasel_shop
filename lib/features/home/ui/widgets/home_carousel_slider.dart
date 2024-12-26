import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rasel_shop/app/app_colors.dart';

class HomeCaroselSlider extends StatefulWidget {
  const HomeCaroselSlider({
    super.key,
  });

  @override
  State<HomeCaroselSlider> createState() => _HomeCaroselSliderState();
}

class _HomeCaroselSliderState extends State<HomeCaroselSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              viewportFraction: 0.95,
              onPageChanged: (currentIndex, reason) {
                _selectedIndex.value = currentIndex;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                        color: Appcolors.themeColor,
                        borderRadius: BorderRadius.circular(8)),
                    alignment: Alignment.center,
                    child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
            valueListenable: _selectedIndex,
            builder: (context, value, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      width: 16,
                      height: 16,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: value == i
                              ? Appcolors.themeColor
                              : Colors.transparent,
                          border: Border.all(color: Colors.grey.shade300)),
                    )
                ],
              );
            }),
      ],
    );
  }
}
