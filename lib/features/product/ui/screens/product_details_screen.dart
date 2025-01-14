import 'package:flutter/material.dart';
import 'package:rasel_shop/app/app_colors.dart';
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
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProductImageCaroselSlider(), // Ensure this is the correct class name
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
                                    'Nike Shoe A2ERF - Happy New Year Special Deal',
                                    style: textTheme.titleMedium,
                                  ),
                                  Row(
                                    children: [
                                      const Wrap(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 18,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => ReviewScreen(productId: widget.productId),
                                          ));
                                        },
                                        child: const Text('Reviews'),
                                      ),

                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Appcolors.themeColor,
                                          borderRadius: BorderRadius.circular(4),
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
                          colors: const ['Red', 'Green', 'Yellow', 'Pink'],
                          onColorSelected: (String selectedColor) {
                            // Handle color selection here
                          },
                        ),
                        const SizedBox(height: 16),
                        Text('Size', style: textTheme.titleMedium),
                        const SizedBox(height: 8),
                        sizePickerWidget(
                          sizes: const ['S', 'M', 'L', 'XL'],
                          onSizeSelected: (String selectedSize) {
                            // Handle size selection here
                          },
                        ),
                        const SizedBox(height: 16),
                        Text('Description', style: textTheme.titleMedium),
                        const SizedBox(height: 8),
                        const Text(
                          'This is a special deal on Nike Shoe A2ERF, perfect for the new year!',
                          style: TextStyle(fontWeight: FontWeight.w400,
                          color: Colors.grey),

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPriceAndAddToCartSection(textTheme),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Appcolors.themeColor.withOpacity(0.15),
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
              const Text(
                '\$100',
                style: TextStyle(
                  color: Appcolors.themeColor,
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
