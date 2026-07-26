import 'package:a5bark/model/category.dart';
import 'package:a5bark/ui/widgets/directional_icon.dart';
import 'package:a5bark/utils/resources/app_assets.dart';
import 'package:a5bark/utils/resources/app_strings.dart';
import 'package:a5bark/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final ValueChanged<CategoryType> onTap;
  final bool isRight;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap,
    this.isRight = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      height: context.height * .25,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: AssetImage(category.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: isRight
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.height * .01),
          Text(
            category.name,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.surface,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          _ViewAllButton(
            isRight: isRight,
            onTap: () => onTap(CategoryType.values.byName(category.id)),
            colorScheme: colorScheme,
            textStyle: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class _ViewAllButton extends StatelessWidget {
  final bool isRight;
  final VoidCallback onTap;
  final ColorScheme colorScheme;
  final TextStyle? textStyle;

  const _ViewAllButton({
    required this.isRight,
    required this.onTap,
    required this.colorScheme,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isRight ? TextDirection.rtl : TextDirection.ltr,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.surface.withValues(alpha: .5),
          padding: EdgeInsets.zero,
        ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .center,
          mainAxisSize: MainAxisSize.min,
          spacing: context.width * .03,
          children: [
            SizedBox(width: context.width * .02),
            Text(AppStrings.viewAll, style: textStyle),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * .02,
                vertical: context.height * .01,
              ),
              decoration: BoxDecoration(
                color: colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: !isRight
                  ? const DirectionalIcon(child: _ArrowIcon())
                  : const _ArrowIcon(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArrowIcon extends StatelessWidget {
  const _ArrowIcon();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppIcons.arrow,
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.primary,
        BlendMode.srcIn,
      ),
    );
  }
}
