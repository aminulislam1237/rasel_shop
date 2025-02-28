import 'package:flutter/material.dart';
import 'package:rasel_shop/app/app_colors.dart';

class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget({super.key, required this.colors, required this.onColorSelected});

  final List<String> colors;
  final Function(String) onColorSelected ;

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: getColorItems(),
      ),
    );
  }

  List<Widget> getColorItems() {
    List<Widget> colorsList = [];
    for (String color in widget.colors) {
      colorsList.add(getColorItemWidget(
        name: color,
        onTap: () {
          setState(() {
            widget.onColorSelected(_selectedColor!);
            _selectedColor = color;
          });
        },
        isSelected: _selectedColor == color,
      ));
    }
    return colorsList;
  }

  Widget getColorItemWidget({
    required String name,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: Border.all(),
          color: isSelected ? AppColors.themeColor : Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black, // Handle text color when not selected
          ),
        ),
      ),
    );
  }
}
