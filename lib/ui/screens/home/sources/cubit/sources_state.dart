import 'package:a5bark/model/source.dart';

sealed class SourcesState {}

class SourcesLoadingState extends SourcesState {}

class SourcesErrorState extends SourcesState {
  final String errorMessage;

  SourcesErrorState(this.errorMessage);
}

class SourcesSuccessState extends SourcesState {
  final List<Source> sources;

  SourcesSuccessState(this.sources);
}
