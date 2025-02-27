import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rasel_shop/app/assets_path.dart';
import 'package:rasel_shop/features/common/data/models/category_model.dart';
import 'package:rasel_shop/features/common/data/models/product_model.dart';
import 'package:rasel_shop/features/common/ui/controllers/category_list_controller.dart';
import 'package:rasel_shop/features/common/ui/widgets/product_iteam_widget.dart';
import 'package:rasel_shop/features/home/ui/controllers/home_banner_list_controller.dart';
import 'package:rasel_shop/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:rasel_shop/features/home/ui/widgets/search_bar.dart';
import '../../../common/ui/controllers/main_bottom_nav_controller.dart';
import '../controllers/Special_product_list_controller.dart';
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
    Get.find<CategoryListController>().getCategoryList();
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
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.errorMessage != null) {
                    return Center(
                        child: Text('Error: ${controller.errorMessage}'));
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
              GetBuilder<CategoryListController>(builder: (controller) {
                if (controller.inProgress) {
                  return const SizedBox(
                      height: 100, child: CircularProgressIndicator());
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:
                      Row(children: _getCategoryList(controller.categoryList)),
                );
              }),
              HomeSectionHeader(title: 'Popular', onTap: () {}),
              const SizedBox(height: 8),
              GetBuilder<PopularProductListController>(builder: (controller) {
                if (controller.inProgress) {
                  return const SizedBox(
                      height: 50, child: CircularProgressIndicator());
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: _getProductlist(
                    controller.productList,
                  )),
                );
              }),
              const SizedBox(height: 16),
              HomeSectionHeader(title: 'Special', onTap: () {}),
              const SizedBox(height: 8),
              GetBuilder<SpecialProductListController>(builder: (controller) {
                if (controller.inProgress) {
                  return const SizedBox(
                      height: 50, child: CircularProgressIndicator());
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: _getProductlist(
                    controller.productList,
                  )),
                );
              }),
              HomeSectionHeader(title: 'New', onTap: () {}),
              const SizedBox(height: 8),
              GetBuilder<SpecialProductListController>(builder: (controller) {

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: _getProductlist(controller.productList)),
                );
              }),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCategoryList(List<CategoryModel> categoryModels) {
    List<Widget> categoryList = [];
    for (int i = 0; i < categoryModels.length; i++) {
      categoryList.add(Padding(
        padding: const EdgeInsets.only(right: 16),
        child: CategoryItemWidget(
          categoryModel: categoryModels[i],
        ),
      ));
    }
    return categoryList;
  }

  List<Widget> _getProductlist(List<ProductModel> productList) {
    List<Widget> list = [];
    for (int i = 0; i < productList.length; i++) {
      list.add(Padding(
        padding: const EdgeInsets.only(right: 16),
        child: ProductItemWidget(
          productModel: productList[i],
        ),
      ));
    }
    return list;
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetesPath.navBarApplogo),
      actions: [
        AppBarIconButton(icon: Icons.account_circle, onTap: () {}),
        const SizedBox(width: 6),
        AppBarIconButton(icon: Icons.call, onTap: () {}),
        const SizedBox(width: 6),
        AppBarIconButton(
            icon: Icons.notifications_active_rounded, onTap: () {}),
        const SizedBox(width: 6),
      ],
    );
  }
}
