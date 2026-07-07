
import 'package:flutter/cupertino.dart';
import 'package:get_time_ago/get_time_ago.dart';

String getLocalizedTime(String? publishedAt, BuildContext context) {
  if (publishedAt == null) return '';

  try {
    final convertedTime = DateTime.parse(publishedAt);
    final locale = Localizations.localeOf(context).languageCode;
    return GetTimeAgo.parse(convertedTime, locale: locale);
  } catch (e) {
    return '';
  }
}