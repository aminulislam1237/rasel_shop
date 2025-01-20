import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rasel_shop/app/assets_path.dart';
import 'package:rasel_shop/features/common/ui/widgets/product_iteam_widget.dart';
import 'package:rasel_shop/features/home/ui/controllers/home_banner_list_controller.dart';
import 'package:rasel_shop/features/home/ui/widgets/search_bar.dart';
import '../../../common/ui/controllers/main_bottom_nav_controller.dart';
import '../widgets/app_bar_icon_button.dart';
import '../../../common/ui/widgets/category_item_widget.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/home_section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();
  final HomeBannerListController _homeBannerListController =
  Get.find<HomeBannerListController>();

  @override
  void initState() {
    super.initState();
    _homeBannerListController.getHomeBannerList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 5),
              ProductSearchBar(controller: _searchBarController),
              const SizedBox(height: 16),
              GetBuilder<HomeBannerListController>(
                init: _homeBannerListController,
                builder: (controller) {
                  if (controller.inProgress) {
                    return Center(child: CircularProgressIndicator());
                  } else if (controller.errorMessage != null) {
                    return Center(child: Text('Error: ${controller.errorMessage}'));
                  }
                  return HomeCaroselSlider(
                    bannnerlist: controller.bannerList,
                  );
                },
              ),

              const SizedBox(height: 16),
              HomeSectionHeader(
                title: 'All Category',
                onTap: () {
                  Get.find<MainBottomNavController>().moveToCategory();
                },
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: _getCategoryList()),
              ),
              HomeSectionHeader(title: 'Popular', onTap: () {}),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: _getProductlist()),
              ),
              const SizedBox(height: 16),
              HomeSectionHeader(title: 'Special', onTap: () {}),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: _getProductlist()),
              ),
              HomeSectionHeader(title: 'New', onTap: () {}),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: _getProductlist()),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCategoryList() {
    List<Widget> categoryList = [];
    for (int i = 0; i < 10; i++) {
      categoryList.add(const Padding(
        padding: EdgeInsets.only(right: 16),
        child: CategoryItemWidget(),
      ));
    }
    return categoryList;
  }

  List<Widget> _getProductlist() {
    List<Widget> productList = [];
    for (int i = 0; i < 10; i++) {
      productList.add(const Padding(
        padding: EdgeInsets.only(right: 16),
        child: ProductItemWidget(),
      ));
    }
    return productList;
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetesPath.navBarApplogo),
      actions: [
        AppBarIconButton(icon: Icons.account_circle, onTap: () {}),
        const SizedBox(width: 6),
        AppBarIconButton(icon: Icons.call, onTap: () {}),
        const SizedBox(width: 6),
        AppBarIconButton(icon: Icons.notifications_active_rounded, onTap: () {}),
        const SizedBox(width: 6),
      ],
    );
  }
}