import 'package:a5bark/utils/resources/app_assets.dart';
import 'package:a5bark/utils/resources/app_theme_extension.dart';
import 'package:a5bark/utils/screen_size.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DropDownMenu extends StatelessWidget {
  final String title;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final List<DropdownMenuItem<String>> optionsItems;

  const DropDownMenu({
    super.key,
    required this.title,
    required this.selectedValue,
    required this.onChanged,
    required this.optionsItems,
  });

  @override
  Widget build(BuildContext context) {
    final double height = context.height;
    final double width = context.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .02),
      child: DropdownButtonFormField2<String>(
        value: selectedValue,
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        hint: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        items: optionsItems,
        onChanged: onChanged,
        iconStyleData: IconStyleData(
          icon: SvgPicture.asset(
            AppIcons.dropMenu,
            width: width * .009,
            height: height * .009,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}