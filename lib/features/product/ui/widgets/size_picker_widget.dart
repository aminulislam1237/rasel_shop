import 'package:flutter/material.dart';
import 'package:rasel_shop/app/app_colors.dart';

class sizePickerWidget extends StatefulWidget {
  const sizePickerWidget({super.key, required this.sizes, required this.onSizeSelected});

  final List<String> sizes;
  final Function(String) onSizeSelected ;

  @override
  State<sizePickerWidget> createState() => _sizePickerWidgetState();
}

class _sizePickerWidgetState extends State<sizePickerWidget> {
  String? _selecteSize;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: getSizeItems(),
      ),
    );
  }

  List<Widget> getSizeItems() {
    List<Widget> sizeList = [];
    for (String size in widget.sizes) {
      sizeList.add(getSizeItemWidget(
        name: size,
        onTap: () {
          setState(() {
            widget.onSizeSelected(_selecteSize!);
            _selecteSize = size;
          });
        },
        isSelected: _selecteSize == size,
      ));
    }
    return sizeList;
  }

  Widget getSizeItemWidget({
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
          color: isSelected ? Appcolors.themeColor : Colors.transparent,
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
