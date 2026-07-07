import 'package:a5bark/model/sources_response.dart';
import 'package:a5bark/ui/screens/home/sources/articles/articles_details.dart';
import 'package:a5bark/utils/resources/app_theme_extension.dart';
import 'package:flutter/material.dart';


class SourcesTabs extends StatefulWidget {
  final List<Source> sources;
  final int selectedTabIndex;
  final ValueChanged<int> onTabChanged;

  const SourcesTabs({
    super.key,
    required this.sources,
    required this.selectedTabIndex,
    required this.onTabChanged,
  });

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        spacing: 12,
        children: [
           TabBar(
              onTap: widget.onTabChanged,
              splashFactory: NoSplash.splashFactory,
              dividerColor: Colors.transparent,
              indicatorColor: context.colors.textPrimary,
              tabAlignment: .start,
              isScrollable: true,
              tabs: widget.sources.map((source) {
                return Text(
                  source.name!,
                  style: widget.selectedTabIndex == widget.sources.indexOf(source)
                      ? Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(fontSize: 16)
                      : Theme.of(context).textTheme.titleLarge,
                );
              }).toList(),
            ),

          Expanded(
            child: ArticlesDetails(
                    source: widget.sources[widget.selectedTabIndex],
               ),
          ),
        ],
      ),
    );
  }
}
