import 'package:a5bark/model/article.dart';
import 'package:a5bark/model/article_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "totalResults")
  final int? totalResults;
  @JsonKey(name: "articles")
  final List<Article>? articles;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "message")
  final String? message;

  ArticleResponse ({
    this.status,
    this.totalResults,
    this.articles,
    this.code,
    this.message,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    return _$ArticleResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ArticleResponseToJson(this);
  }
}



