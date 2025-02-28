import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasel_shop/app/app_colors.dart';
import 'package:rasel_shop/features/product/Data/models/product_details_model.dart';
import 'package:rasel_shop/features/product/ui/controller/product_details_controller.dart';
import 'package:rasel_shop/features/product/ui/screens/reviews_screen.dart';
import 'package:rasel_shop/features/product/ui/widgets/color_picker_widget.dart';
import 'package:rasel_shop/features/product/ui/widgets/product_image_carousel_slider.dart';
import 'package:rasel_shop/features/product/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:rasel_shop/features/product/ui/widgets/size_picker_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  static const String name = '/product/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(builder: (controller) {
        if (controller.inProgress) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage != null) {
          return Center(
            child: Text(controller.errorMessage!),
          );
        }

        ProductDetails productDetails = controller.productDetails!;
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductImageCaroselSlider(
                      imageUrls: [
                        productDetails.img1!,
                        productDetails.img2!,
                        productDetails.img3!,
                        productDetails.img4!,
                      ],
                    ), // Ensure this is the correct class name
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productDetails.product?.title ?? '',
                                      textAlign: TextAlign.start,
                                      style: textTheme.titleMedium,
                                    ),
                                    Row(
                                      children: [
                                        Wrap(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 18,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '${productDetails.product?.star ?? ''}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  ReviewScreen(
                                                      productId:
                                                          widget.productId),
                                            ));
                                          },
                                          child: const Text('Reviews'),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: AppColors.themeColor,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: const Icon(
                                            Icons.favorite_border,
                                            size: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              ProductQuantityIncDecButton(
                                onChange: (int value) {
                                  // Handle quantity change here
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text('Color', style: textTheme.titleMedium),
                          const SizedBox(height: 8),
                          ColorPickerWidget(
                            colors: productDetails.color?.split(',') ?? [],
                            onColorSelected: (String selectedColor) {
                              // Handle color selection here
                            },
                          ),
                          const SizedBox(height: 16),
                          Text('Size', style: textTheme.titleMedium),
                          const SizedBox(height: 8),
                          sizePickerWidget(
                            sizes: productDetails.size?.split(',') ?? [],
                            onSizeSelected: (String selectedSize) {
                              // Handle size selection here
                            },
                          ),
                          const SizedBox(height: 16),
                          Text('Description', style: textTheme.titleMedium),
                          const SizedBox(height: 8),
                          Text(
                            productDetails.des ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildPriceAndAddToCartSection(
                textTheme, productDetails.product?.price ?? '0.0'),
          ],
        );
      }),
    );
  }

  Widget _buildPriceAndAddToCartSection(TextTheme textTheme, String price) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: textTheme.titleSmall,
              ),
              Text(
                '\$$price',
                style: const TextStyle(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {
                // Add to cart functionality here
              },
              child: const Text('Add to cart'),
            ),
          ),
        ],
      ),
    );
  }
}
