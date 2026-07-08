import 'package:a5bark/model/articles_response.dart';
import 'package:a5bark/ui/widgets/main_loading.dart';
import 'package:a5bark/utils/get_time_ago_format.dart';
import 'package:a5bark/utils/screen_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final timeAgo = getLocalizedTime(article.publishedAt, context);

    return Container(
      height: context.height * .4,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 1,
        ),
      ),
      child: Column(
        spacing: context.height * .01,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                placeholder: (context, url) => MainLoading(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            article.title ?? '',
            /* TODO: Article Title Need UX Massage */
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            spacing: context.width * .02,
            children: [
              Expanded(
                child: Text(
                  article.author ?? '',
                  /* TODO: Article Author Need UX Massage */
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                timeAgo,
                /* TODO: Article Author Need UX Massage */
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
