import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rasel_shop/app/assets_path.dart';

class ApplogoWidget extends StatelessWidget {
  const ApplogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   SvgPicture.asset(
      AssetesPath.applogosvg,
      width: 120,
    );
  }
}
