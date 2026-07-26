import 'package:a5bark/model/article.dart';
import 'package:a5bark/ui/widgets/main_loading.dart';
import 'package:a5bark/utils/resources/app_strings.dart';
import 'package:a5bark/utils/resources/app_theme_extension.dart';
import 'package:a5bark/utils/screen_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesBottomSheet extends StatelessWidget {
  final Article article;

  const ArticlesBottomSheet({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.7,
      width: .infinity,
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.02,
        vertical: context.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: context.colors.textPrimary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: context.locale.languageCode == 'ar'
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        spacing: context.height * 0.01,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? '',
                  placeholder: (context, url) => const MainLoading(),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Text(
            article.content ?? AppStrings.noArticleDescription,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              color: context.colors.textSecondary,
            ),
            textAlign: TextAlign.left,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),


          ElevatedButton(
            onPressed: () {
              launchArticleUrl(uri: Uri.parse(article.url ?? ''));
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(.infinity, context.height * 0.04),
              backgroundColor: context.colors.background,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(vertical: context.height * 0.02),
            ),
            child: Text(
              AppStrings.viewArticle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                color: context.colors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
Future<void> launchArticleUrl({required Uri uri}) async {
    final url = Uri.parse(article.url ?? '');
  if (await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
  }
}
