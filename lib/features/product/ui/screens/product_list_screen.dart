import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasel_shop/features/common/ui/controllers/product_list_controller.dart';

import '../../../common/ui/widgets/product_iteam_widget.dart';

class ProductListScreen extends StatefulWidget {
  static const String name = '/product/product-list-by-category';
  const ProductListScreen(
      {super.key, required this.categoryName, required this.categoryId});
  final String categoryName;
  final int categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {


  @override
  void initState() {
    super.initState();
    Get.find<ProductListController>().getProductListByCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body:GetBuilder<ProductListController>(
        builder: (controller) {
          if (controller.inProgress) {
            return const Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                crossAxisSpacing: 2,
                mainAxisSpacing: 4),
            itemCount: controller.productList.length,
            itemBuilder: (context, index) {
               return FittedBox(child: ProductItemWidget(
                 productModel:controller.productList[index],
               ));
            },
          );
        }
      ),
    );
  }
}
