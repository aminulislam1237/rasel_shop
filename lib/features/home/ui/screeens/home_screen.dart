
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rasel_shop/app/assets_path.dart';
import 'package:rasel_shop/features/home/ui/widgets/search_bar.dart';

import '../widgets/app_bar_icon_button.dart';
import '../widgets/home_carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                ProductSearchBar(controller: _searchBarController),
                const SizedBox(
                  height: 16,
                ),

                const HomeCaroselSlider()
              ],
            ),
          ),
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetesPath.navBarApplogo),
      actions: [
        AppBarIconButton(
          icon: Icons.account_circle,
          onTap: () {},
        ),
        const SizedBox(
          width: 6,
        ),
        AppBarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(
          width: 6,
        ),
        AppBarIconButton(
          icon: Icons.notifications_active_rounded,
          onTap: () {},
        ),
        const SizedBox(
          width: 6,
        ),
      ],
    );
  }
}


