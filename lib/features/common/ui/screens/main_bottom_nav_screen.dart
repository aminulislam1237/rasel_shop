import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasel_shop/features/cart/ui/screens/cart_list_screen.dart';
import 'package:rasel_shop/features/category/ui/screens/category_List_screen.dart';
import 'package:rasel_shop/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:rasel_shop/features/home/ui/screeens/home_screen.dart';
import 'package:rasel_shop/features/wishlist/ui/screens/wish_list_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});
  static const String name  = '/bottom-nav-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = const [

     HomeScreen(),
   CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (bottomNavController) {
        return Scaffold(
          body: _screens[bottomNavController.selectedIndex],
          bottomNavigationBar: NavigationBar(
              selectedIndex:bottomNavController.selectedIndex ,
              onDestinationSelected: bottomNavController.changeIndex,
              destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.category), label: 'Categories'),
            NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
            NavigationDestination(
                icon: Icon(Icons.favorite_border), label: 'Wishlist')
          ]),
        );
      }
    );
  }
}
