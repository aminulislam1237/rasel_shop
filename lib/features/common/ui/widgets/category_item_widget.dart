import 'package:flutter/material.dart';
import 'package:rasel_shop/features/product/ui/screens/product_list_screen.dart';

import '../../../../app/app_colors.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductListScreen.name,arguments: 'Computer');
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Appcolors.themeColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.computer,color:Colors.grey,
              size: 48,),
          ),
          const SizedBox(height: 4,),
          const Text('Conputer',style: TextStyle(
            fontSize: 16,
            color: Appcolors.themeColor,
            fontWeight: FontWeight.w600,
          ),)
        ],
      ),
    );
  }
}