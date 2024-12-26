import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rasel_shop/app/assets_path.dart';

class ApplogoWidget extends StatelessWidget {
  const ApplogoWidget({super.key, this.width, this.height, this.boxFit});

  final double? width;
  final double? height;
  final BoxFit? boxFit; // Changed from Color to BoxFit

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetesPath.applogosvg,
      width: width ?? 120,
      height: height ?? 120,
      fit: boxFit ?? BoxFit.scaleDown,
    );
  }
}
