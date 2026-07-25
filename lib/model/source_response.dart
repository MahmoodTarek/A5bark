import 'package:a5bark/model/source.dart';
import 'package:json_annotation/json_annotation.dart';

part 'source_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SourceResponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "sources")
  final List<Source>? sources;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "message")
  final String? message;

  SourceResponse({this.status, this.sources, this.code, this.message});

  factory SourceResponse.fromJson(Map<String, dynamic> json) {
    return _$SourceResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SourceResponseToJson(this);
  }
}
