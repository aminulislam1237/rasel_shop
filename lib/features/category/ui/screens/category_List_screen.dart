import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasel_shop/features/common/ui/controllers/category_list_controller.dart';
import 'package:rasel_shop/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:rasel_shop/features/common/ui/widgets/category_item_widget.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  static const String name = "/Category-list-Screen";

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => _onPop(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Category List'),
          leading: IconButton(
            onPressed: _onPop,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: ()async{
            Get.find<CategoryListController>().getCategoryList();
          },
          child: GetBuilder<CategoryListController>(
            builder: (controller) {
              if (controller.inProgress) {
                return const Center(child: CircularProgressIndicator());
              }
              return GridView.builder(
                itemCount: controller.categoryList.length,
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return  FittedBox(
                      child: CategoryItemWidget(
                        categoryModel: controller.categoryList[index],
                      ),
                  );
                },
              );
            }
          ),
        ),
      ),
    );
  }

  void _onPop() {
    {
      Get.find<MainBottomNavController>().backToHome();
    }
  }
}
