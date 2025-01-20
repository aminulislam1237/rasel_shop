import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rasel_shop/app/app_colors.dart';
import 'package:rasel_shop/features/home/data/models/banner_model.dart';

class HomeCaroselSlider extends StatefulWidget {
  const HomeCaroselSlider({
    super.key,
    required this.bannnerlist,
  });

  final List<BannerModel> bannnerlist;


  @override
  State<HomeCaroselSlider> createState() => _HomeCaroselSliderState();
}

class _HomeCaroselSliderState extends State<HomeCaroselSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        _buildCarousel(),
        const SizedBox(height: 8),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180.0,
        viewportFraction: 0.95,
        onPageChanged: (currentIndex, reason) {
          _selectedIndex.value = currentIndex;
        },
      ),
      items: widget.bannnerlist.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Appcolors.themeColor,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(banner.image ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      banner.title ?? '',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your action here
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Buy Now'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildIndicator() {
    return ValueListenableBuilder(
      valueListenable: _selectedIndex,
      builder: (context, value, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.bannnerlist.length; i++)
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: i == value ? Colors.blue : Colors.grey,
                ),
              ),
          ],
        );
      },
    );
  }
}
